# Beware: INSTALL BIOPYTHON PREVOUSLY, BEFORE USING SCRIPT
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord

# Load exon sequence from FASTA
input_fasta = "exonerate_singleLine.fa"
output_fasta = "homology_protein.fa"

# Read the first (or only) sequence from the input FASTA
record = next(SeqIO.parse(input_fasta, "fasta"))

# Translate the sequence (standard table; stop_symbol="*")
protein_seq = record.seq.translate(to_stop=False)

# Create a new SeqRecord for the translated protein
protein_record = SeqRecord(
    protein_seq,
    id=record.id,
    description="Translated protein sequence"
)

# Save to output FASTA
SeqIO.write(protein_record, output_fasta, "fasta")

print(f"Translated protein saved to {output_fasta}")
