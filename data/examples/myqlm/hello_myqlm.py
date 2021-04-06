# Doc here -> https://myqlm.github.io/index.html

from qat.lang.AQASM import Program, H, CNOT
from qat.qpus import PyLinalg

# Create a Program
qprog = Program()
# Number of qbits
nbqbits = 2
# Allocate some qbits
qbits = qprog.qalloc(nbqbits)

# Apply some quantum Gates
qprog.apply(H, qbits[0])
qprog.apply(CNOT, qbits[0], qbits[1])

print(qprog)

# Export this program into a quantum circuit
circuit = qprog.to_circ()

# Create a Quantum Processor Unit
linalgqpu = PyLinalg()

# Create a job
job = circuit.to_job()

# Submit the job to the QPU
result = linalgqpu.submit(job)

# Iterate over the final state vector to get all final components
for sample in result:
    print("State %s amplitude %s" % (sample.state, sample.amplitude))
