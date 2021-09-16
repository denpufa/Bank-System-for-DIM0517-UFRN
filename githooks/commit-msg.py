import sys
import re
import requests
def main():
    print("chegou no script")
    with open(sys.argv[1],"r") as fp:
        lines = fp.readlines()

        for line in lines:
            if line.strip() == "# ------------------------ >8 ------------------------":
                break
            if line[0] == "#":
                continue
            commit_text = line.strip()
            if re.match('#/d/d-.',commit_text) :
                if verify_issue_exist(commit_text[1:3]) :
                    sys.exit(0)
                else:
                    print("Não existe este numero de issue")
                    sys.exit(1)
            else:
                print("FORA DO FORMATO #numeroIssue-Mensagem")
                sys.exit(1)
def verify_issue_exist(number):
    r = requests.get("https://github.com/denpufa/Bank-System-for-DIM0517-UFRN/issues/"+ number)
    if r.status_code == 400:
        return False
    else:
        return True