# Racerbil
Vi har tilfæjet nogle ting for at kunne løse opgaven, det vi har tilføjet er et fitness system. Hvor vi kan udregne hvilken bil der klarer sig bedst, vi er gået ud fra at runden ender på to måder at enten klarer en af bilerne banen, ellers dør de alle sammen. 
I tilfældet af at en af bilerne klarer banen, så tager vi dens gener videre og muterer dem for at danne den næste generation af biler. Det andet tilfælde der sker er at ingen klarer banen, så tager vi dem der når længst hen, for at måle dette så bruger vi en masse punkter.
Disse punkter bliver brugt til at finde ud af hvilken bil nåede længst. Dens gener sender vi så viderer og muterer den for at lave den næste generation, for at undgå at bilerne bare kan køre direkte hen til målstregen uden at køre banen, så har vi sagt at bilerne skal i gennem punkterne før for at kunne klarer banen.
Men det kan også ske at ingen bilerne når hen til det første punkt, udregner vi den og sender den viderer.

For at lave en ny generation så har vi fundet en ny bil hvis værdier vi ændre, det sker hvergang vi sætter så dette lig med hele CarControllerList. Så laver vi en ny generation
