# Step 1: Using blastx (translated nucleotide > protein)

#	  Preparation: upload contig_24.fa to blastx, set the database to nr.
#	  Beware: The database is really big, therefore not excluding organisms led to an error in the search. Reduce the database to only Drosophila family organisms.

#   Selection: select a family related organism in the database, with a high percentage of identity. Drosophila simulans was selected, it has a 99.04% of identity with Drosophila melanogaster (our organism).

#   Download: download in fasta file (the complete seq.), rename it drosophilasimulans.fa .

# Step 2: Using terminal (alignments)
#   Analysis: shows the alignment of both organisms, shows them in depth, shown directly in the terminal. We save the analysis in a text file. Command use :
    exonerate -m p2g --showtargetgff -q drosophilasimulans.fa -t contig_24.fa > exonerate_1.txt
#   Additionaly, in the exonerate command it is possible to get a more trustworthy alignment, by removing the use of soft-masking, which avoids complex areas, for example, lower-case parts of the sequence. -S relates to soft-masking, F stands for False, for soft-masking not to be done. We save the analysis in a text file Therefore it is an even more complete analysis of exonerate:
    exonerate -m p2g --showtargetgff -q drosophilasimulans.fa -t contig_24.fa -S F > exonerate_2.txt
#   Select the exons signaled by the exonerate analysis and add them in a separate file in gff format
    exonerate -m p2g --showtargetgff -q drosophilasimulans.fa -t contig_24.fa -S F | egrep -w exon > exonerate_exons.gff
#   Convert the previous file into a fasta file. 
#   	Beware: NECESARY THE USE OF BEDTOOLS, MAKE SURE BEDTOOLS ARE INSTALLED PREVOUSLY
    bedtools getfasta -fi contig_24.fa -bed exonerate_exons.gff>exonerate_exons.fa
#   	Error: index file contig_24.fa.fai not found, generating… We had to create the file contig_24.fa.fai to continue with the process. However we found that installing SAMtools extension is a way to avoif the error.
#   Join all exons into a single sequence, and storing it in a fasta file.
	  sed -e '2,$s/>.*//' exonerate_exons.fa | grep -v '^$' > exonerate_singleLine.fa
