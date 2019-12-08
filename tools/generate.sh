for i in 16 32 64;
do ./grief/generate_code.py grief/test_pairs.txt $i >grief/generated_$i.i;
done
rm evolve_grief 
make MACOS=yes evolve_grief
rm match_all
make MACOS=yes match_all 
