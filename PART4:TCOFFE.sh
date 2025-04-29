# To conduct the protein sequence aligment, for the obtained protein sequences from both methods, we use the tcoffe server, by running this command in the local terminal:
$ cat geneid_prot_contig24.fa FGENESH_prot_contig24.fa  homology_protein.fa > comb_pred_protein_contig24.fa

# If working in bash however we found the use of this command more efficient:
$t_coffe comb_pred_protein_contig24.fa -method mcoffe 
