import os
import pandas as pd
import sys

def get_summary(resdir, outfile):
    res = pd.read_csv(os.path.join(resdir, "TEMP_pbpID_Results.txt"), sep="\t")
    pbpcode = res["PBP_Code(1A:2B:2X)"].to_list()[0].split(":")
    with open(os.path.join(resdir, "BLACTAM_MIC_RF_with_SIR.txt")) as res:
        blcode = list(res.readlines())[1].split(" ")
    header = ">PBP_Category\tType\n"
    pbp_resstring = f"1A\t{pbpcode[0]}\n2B\t{pbpcode[1]}\n2X\t{pbpcode[2]}\n"
    pbp_header = ">Agent\tPredicted_MIC\tInferred_phenotype(non/meningitis)\n"
    AMO_resstring = f"Amoxicilin\t{blcode[4]}{blcode[5]}\t{blcode[6]}\n"
    CFT_resstring = f"Ceftriaxone\t{blcode[14]}{blcode[15]}\t{blcode[16]}\\{blcode[17]}\n"
    CFX_resscring = f"Cefuroxime\t{blcode[18]}{blcode[19]}\t{blcode[20]}\n"
    MER_resstring = f"Meropenem\t{blcode[7]}{blcode[8]}\t{blcode[9]}\n"
    PEN_resstring = f"Penicililn\t{blcode[0]}{blcode[1]}\t{blcode[2]}\\{blcode[3]}\n"
    TAX_resstring = f"Cefotaxime\t{blcode[10]}{blcode[11]}\t{blcode[12]}\\{blcode[13]}\n"
    result = header + pbp_resstring + pbp_header + AMO_resstring + CFT_resstring + TAX_resstring + CFX_resscring + MER_resstring + PEN_resstring
    with open(outfile, "w") as out:
        out.write(result)

if __name__ == '__main__':
    input = sys.argv
    get_summary(sys.argv[1], sys.argv[2])