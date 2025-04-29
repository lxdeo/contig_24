#**Ab Intio method**

#Ab Initio could be made with 2 websites, geneid and fgenesh:
#  1. GeneId: the commands used to obtain the coding and protein sequences. The coding sequences is all the parts of the original sequence that codes for a protein. The protein sequence is the aminoacid chain that codes said protein.
#     Command used on the local bash terminal:
      $geneid -P /soft/GeneID/geneid_1.2/dros.param -D /tmp/WebFiles/fastas/geneid18918.fasta
      
#  2. FGENESH: using the drosophila organism model selection on the website. As before we also obtain the DNA coding sequence and protein aa sequence. We also save them in fasta files.
#     Command used on the local bash terminal:
#     Beware: the command used only works on the paid local extension of Softberry, as an alternative using and downloading the fasta file from the website is possible.
      $fgenesh contig24.fa -species=drosophila > FGENESH_contig24.fa
