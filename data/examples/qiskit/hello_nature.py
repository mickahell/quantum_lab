from qiskit_nature.drivers import PySCFDriver, UnitsType
from qiskit_nature.problems.second_quantization.electronic import ElectronicStructureProblem

# Use PySCF, a classical computational chemistry software
# package, to compute the one-body and two-body integrals in
# electronic-orbital basis, necessary to form the Fermionic operator
driver = PySCFDriver(atom='H .0 .0 .0; H .0 .0 0.735',
                     unit=UnitsType.ANGSTROM,
                     basis='sto3g')
problem = ElectronicStructureProblem(driver)

# generate the second-quantized operators
second_q_ops = problem.second_q_ops()
main_op = second_q_ops[0]

num_particles = (problem.molecule_data_transformed.num_alpha,
                 problem.molecule_data_transformed.num_beta)

num_spin_orbitals = 2 * problem.molecule_data.num_molecular_orbitals

# setup the classical optimizer for VQE
from qiskit.algorithms.optimizers import L_BFGS_B

optimizer = L_BFGS_B()

# setup the mapper and qubit converter
from qiskit_nature.mappers.second_quantization import ParityMapper
from qiskit_nature.converters.second_quantization import QubitConverter

mapper = ParityMapper()
converter = QubitConverter(mapper=mapper, two_qubit_reduction=True)

# map to qubit operators
qubit_op = converter.convert(main_op, num_particles=num_particles)

# setup the initial state for the ansatz
from qiskit_nature.circuit.library import HartreeFock

init_state = HartreeFock(num_spin_orbitals, num_particles, converter)

# setup the ansatz for VQE
from qiskit.circuit.library import TwoLocal

ansatz = TwoLocal(num_spin_orbitals, ['ry', 'rz'], 'cz')

# add the initial state
ansatz.compose(init_state, front=True)

# set the backend for the quantum computation
from qiskit import Aer

backend = Aer.get_backend('aer_simulator_statevector')

# setup and run VQE
from qiskit.algorithms import VQE

algorithm = VQE(ansatz,
                optimizer=optimizer,
                quantum_instance=backend)

result = algorithm.compute_minimum_eigenvalue(qubit_op)
print(result.eigenvalue.real)

electronic_structure_result = problem.interpret(result)
print(electronic_structure_result)
