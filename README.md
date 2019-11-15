# Autodock vina docking scripts

---

## docking.sh

### How it works?

1. When you run the **docking&#46;sh** for the first time it checks if the folder named **results** exist. If it is exist then it counts the result count in the folder for the further usage. If it doesn't exist then it creates **results** folder.
    * **results** folder is the location of where the console output of Autodock vina will be save.
2. Then it checks the existence of **results\_table.csv** file. If it doesnt exist it creates one.
    * **results\_table.csv** is the where the summary of results will be save (Number of result, Lowest affinity value, Average value of 'dist from rmsd', Maximum value of 'dist from rmsd', Seed number, etc.).
3. Then it detects the config file. Config file must be named as **\(*some_name*\)\_conf.txt** (Check [config file](#example-config-file)). *PS: Be sure that there is not file contains **\_conf.txt** in the name.*
4. Then it starts to work until it reaches the 'maxattempt' number which you entered at the top of **docking&#46;sh** line.
5. Script prints the summary of the result (Average value of 'dist from rmsd', Maximum value of 'dist from rmsd', Lowest affinity value) and it stores the detailed information in the **results\_table.csv** table.
6. When process is finished. You can check the **results\_table.csv** for the value you want to find. When you find the result, you can copy the seed number of result and then run the vina with the seed you copied to reach result that you want.

### Example workflow

1. Open the terminal in the docking folder. Docking folder must be contains (**\(some_name\)\_conf.txt**, **protein.pdbqt** file, **ligand.pdbqt** file which you defined in the config file (Check [config file](#example-config-file)).
2. Then edit the **maxattempt** number in the **docking&#46;sh** as you want.
3. Then type `./docking.sh` in the terminal. It must be give a output like `<result_number> started...` that means script is working.
4. If you see `Process finished` that means script is finished working. You can check the **results\_table.csv** for the pick result for the seed.
5. Then run `vina --config test_conf.txt --seed <seed_number>`

#### Example config file

<code>
receptor= protein.pdbqt<br>
ligand= SO.pdbqt<br><br>
center_x= 4.402<br>
center_y= -8.060<br>
center_z= 8.874<br><br>
size_x= 66<br>
size_y= 56<br>
size_z= 54<br><br>
out= vina_outSO.pdbqt<br>
log= logSO.txt<br><br>
exhaustiveness= 8
</code>

---

