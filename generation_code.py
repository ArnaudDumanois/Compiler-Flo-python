import sys
from analyse_lexicale import FloLexer
from analyse_syntaxique import FloParser
import arbre_abstrait
from arbre_abstrait import *
from table_symbole import *

num_etiquette_courante = -1 #Permet de donner des noms différents à toutes les étiquettes (en les appelant e0, e1,e2,...)

afficher_table = False
afficher_nasm = False
table = Table({}) #Table des symboles globale
imbrication = 0 #Permet de savoir dans quelle fonction on est (pour la table des symboles)

def nom_nouvelle_etiquette():
    global num_etiquette_courante
    num_etiquette_courante +=1
    return  "e"+ str(num_etiquette_courante)

"""
Un print qui ne fonctionne que si la variable afficher_table vaut Vrai.
(permet de choisir si on affiche le code assembleur ou la table des symboles)
"""
def printifm(*args,**kwargs):
    if afficher_nasm:
        print(*args,**kwargs)

"""
Un print qui ne fonctionne que si la variable afficher_table vaut Vrai.
(permet de choisir si on affiche le code assembleur ou la table des symboles)
"""
def printift(*args,**kwargs):
    if afficher_table:
        print(*args,**kwargs)

"""
Fonction locale, permet d'afficher un commentaire dans le code nasm.
"""
def nasm_comment(comment):
    if comment != "":
        printifm("\t\t ; "+comment)#le point virgule indique le début d'un commentaire en nasm. Les tabulations sont là pour faire jolie.
    else:
        printifm("")  
"""
Affiche une instruction nasm sur une ligne
Par convention, les derniers opérandes sont nuls si l'opération a moins de 3 arguments.
"""
def nasm_instruction(opcode, op1="", op2="", op3="", comment=""):
    if op2 == "":
        printifm("\t"+opcode+"\t"+op1+"\t\t",end="")
    elif op3 =="":
        printifm("\t"+opcode+"\t"+op1+",\t"+op2+"\t",end="")
    else:
        printifm("\t"+opcode+"\t"+op1+",\t"+op2+",\t"+op3,end="")
    nasm_comment(comment)


"""
Retourne le nom d'une nouvelle étiquette
"""
def nasm_nouvelle_etiquette(num_etiquette_courante=None):
    num_etiquette_courante+=1
    return "e"+str(num_etiquette_courante)

"""
Affiche le code nasm correspondant à tout un programme
"""


def gen_programme(programme):
    printifm('%include\t"io.asm"')
    printifm('section\t.bss')
    printifm('sinput:	resb	255	;reserve a 255 byte space in memory for the users input string')
    printifm('v$a:	resd	1')
    printifm('section\t.text')
    printifm('global _start')
    printifm('_start:')

    gen_listeInstructions(programme.listeInstructions)

    nasm_instruction("mov", "eax", "1", "", "1 est le code de SYS_EXIT") 
    nasm_instruction("int", "0x80", "", "", "exit")

    
"""
Affiche le code nasm correspondant à une suite d'instructions
"""
def gen_listeInstructions(listeInstructions):
    for instruction in listeInstructions.instructions:
        gen_instruction(instruction)

"""
Affiche le code nasm correspondant à une instruction
"""



def gen_def_fonction(nom_fonction):
    printifm(nom_fonction+":")
    nasm_instruction("push", "ebp", "", "", "")
    nasm_instruction("mov", "ebp", "esp", "", "")
    nasm_instruction("sub", "esp", "4", "", "")

def gen_affectation(instruction):
    gen_expression(instruction.expression)


def gen_boucleTantQue(instruction):
    global num_etiquette_courante
    num_etiquette_courante+=1
    etiquette_debut = "e"+str(num_etiquette_courante)
    num_etiquette_courante+=1
    etiquette_finale = "e"+str(num_etiquette_courante)
    nasm_instruction(etiquette_debut+":", "", "", "", "")
    gen_expression(instruction.expr)
    nasm_instruction("pop", "eax", "", "", "")
    nasm_instruction("cmp", "eax", "0", "", "")
    nasm_instruction("je", etiquette_finale, "", "", "")
    gen_listeInstructions(instruction.listeInstructions)
    nasm_instruction("jmp", etiquette_debut, "", "", "")
    nasm_instruction(etiquette_finale+":", "", "", "", "")


def gen_retourner(instruction):
    gen_expression(instruction.expression)
    nasm_instruction("pop", "eax", "", "", "")
    nasm_instruction("ret", "", "", "", "")


def gen_appelFonction(instruction):
    nasm_instruction("push", "ebp", "", "", "")
    nasm_instruction("call", instruction.nom, "", "", "")
    nasm_instruction("push", "eax", "", "", "")


def gen_conditionnelle(instruction):
    # afficher le code nasm correspondant à l'expression
    global num_etiquette_courante
    gen_expression(instruction.condition)
    nasm_instruction("pop", "eax", "", "", "")
    nasm_instruction("cmp", "eax", "0", "", "")
    if instruction.listeInstructionsSinon != None:
        etiquette_sinon = nasm_nouvelle_etiquette(num_etiquette_courante)
        num_etiquette_courante+=1
        nasm_instruction("je", etiquette_sinon, "", "", "")
        gen_listeInstructions(instruction.listeInstructions)
        etiquette_finale = nasm_nouvelle_etiquette(num_etiquette_courante)
        num_etiquette_courante+=1
        nasm_instruction("jmp", etiquette_finale, "", "", "")
        nasm_instruction(etiquette_sinon+":", "", "", "", "")
        gen_listeInstructions(instruction.listeInstructionsSinon)
        nasm_instruction(etiquette_finale+":", "", "", "", "")
    else:
        etiquette_finale = nasm_nouvelle_etiquette(num_etiquette_courante)
        num_etiquette_courante+=1
        nasm_instruction("je", etiquette_finale, "", "", "")
        gen_listeInstructions(instruction.listeInstructions)
        nasm_instruction(etiquette_finale+":", "", "", "", "")


def gen_declarationVariable(instruction):
    return


def gen_instruction(instruction):
    if type(instruction) == arbre_abstrait.Ecrire:
        gen_ecrire(instruction)
    elif type(instruction) == arbre_abstrait.Affectation:
        gen_affectation(instruction)
    elif type(instruction) == arbre_abstrait.Conditionnelle:
        if (type(instruction.condition) == arbre_abstrait.Entier):
            exit(1)
        gen_conditionnelle(instruction)

    elif type(instruction) == arbre_abstrait.BoucleTantQue:
        if (type(instruction.expr) == arbre_abstrait.Entier):
            exit(1)
        gen_boucleTantQue(instruction)
    elif type(instruction) == arbre_abstrait.Retourner:
        nom_fonction = table.obtenir_nom_fonction_courante()
        type_retour = table.obtenir_type_fonction_courante()
        if (instruction.listeInstructions != None):
            if (len(instruction.listeInstructions.instructions) *4 != table.obtenir_taille_zone_memoire(instruction.nom)):
                exit(1)
        elif type(instruction.expression) != arbre_abstrait.Operation:
            if type_retour != instruction.expression.type:
                exit(1)
        if nom_fonction == None:
            exit(1)
        else:
            gen_expression(instruction.expression)
            nasm_instruction("pop", "eax", "", "", "")
            nasm_instruction("ret", "", "", "", "")
    elif type(instruction) == arbre_abstrait.AppelFonction:
        gen_appelFonction(instruction)
    elif type(instruction) == arbre_abstrait.DeclarationVariable:
        gen_declarationVariable(instruction)

    else:
        print("type instruction inconnu",type(instruction))
        exit(0)

"""
Affiche le code nasm correspondant au fait d'envoyer la valeur entière d'une expression sur la sortie standard
"""	
def gen_ecrire(ecrire):
    gen_expression(ecrire.exp) #on calcule et empile la valeur d'expression
    nasm_instruction("pop", "eax", "", "", "") #on dépile la valeur d'expression sur eax
    nasm_instruction("call", "iprintLF", "", "", "") #on envoie la valeur d'eax sur la sortie standard

"""
Affiche le code nasm pour calculer et empiler la valeur d'une expression
"""
def gen_expression(expression):
    if type(expression) == arbre_abstrait.Operation:
        gen_operation(expression) #on calcule et empile la valeur de l'opération
    elif type(expression) == arbre_abstrait.Entier:
            nasm_instruction("push", str(expression.valeur), "", "", "")  #on met sur la pile la valeur entière
    elif type(expression) == arbre_abstrait.Variable:
            return
    elif type(expression) == arbre_abstrait.Booleen:
            if expression.valeur == "Vrai":
                nasm_instruction("push", "1", "", "", "")
            else:
                nasm_instruction("push", "0", "", "", "")
    elif type(expression) == arbre_abstrait.Lire:
            nasm_instruction("mov", "eax", "sinput", "", "")
            nasm_instruction("call", "readline", "", "", "")
            nasm_instruction("call", "atoi", "", "", "")
            nasm_instruction("push", "eax", "", "", "")

    elif type(expression) == arbre_abstrait.AppelFonction:
            gen_appelFonction(expression)
    else:
        print("type d'expression inconnu",type(expression))
        exit(0)


"""
Affiche le code nasm pour calculer l'opération et la mettre en haut de la pile
"""
def gen_operation(operation):
    op = operation.op
    if operation.exp2 == None:
        gen_expression(operation.exp1) #on calcule et empile la valeur de exp1
        nasm_instruction("pop", "eax", "", "", "dépile la permière operande dans eax")
        if op == '-':
            nasm_instruction("neg", "eax", "", "", "effectue l'opération -eax et met le résultat dans eax" )
        if op == 'non':
            nasm_instruction("xor", "eax", "1", "", "effectue l'opération non eax et met le résultat dans eax" )

    else:
        gen_expression(operation.exp1) #on calcule et empile la valeur de exp1
        gen_expression(operation.exp2) #on calcule et empile la valeur de exp2

        nasm_instruction("pop", "ebx", "", "", "dépile la seconde operande dans ebx")
        nasm_instruction("pop", "eax", "", "", "dépile la permière operande dans eax")

        code = {"+":"add","*":"imul"} #Un dictionnaire qui associe à chaque opérateur sa fonction nasm
        #Voir: https://www.bencode.net/blob/nasmcheatsheet.pdf

        if op in ['+']:
            nasm_instruction(code[op], "eax", "ebx", "", "effectue l'opération eax" +op+"ebx et met le résultat dans eax" )
        if op == '*':
            nasm_instruction(code[op], "ebx", "", "", "effectue l'opération eax" +op+"ebx et met le résultat dans eax" )
        if op == '-':
            nasm_instruction("sub", "eax", "ebx", "", "effectue l'opération eax" +op+"ebx et met le résultat dans eax" )
        if op == '/':
            nasm_instruction("mov", "edx", "0", "", "met 0 dans edx pour la division")
            nasm_instruction("idiv", "ebx", "", "", "effectue l'opération eax" +op+"ebx et met le résultat dans eax" )
        if op == '%':
            nasm_instruction("mov", "edx", "0", "", "met 0 dans edx pour la division")
            nasm_instruction("idiv", "ebx", "", "", "effectue l'opération eax" +op+"ebx et met le reste dans edx" )
            nasm_instruction("mov", "eax", "edx", "", "met le reste dans eax" )
        if op == '==':
            nasm_instruction("cmp", "eax", "ebx", "", "compare eax et ebx")
            nasm_instruction("sete", "al", "", "", "met 1 dans al si eax == ebx, 0 sinon")
            nasm_instruction("movzx", "eax", "al", "", "met 0 ou 1 dans eax")
        if op == '!=':
            nasm_instruction("cmp", "eax", "ebx", "", "compare eax et ebx")
            nasm_instruction("setne", "al", "", "", "met 1 dans al si eax != ebx, 0 sinon")
            nasm_instruction("movzx", "eax", "al", "", "met 0 ou 1 dans eax")
        if op == '<':
            nasm_instruction("cmp", "eax", "ebx", "", "compare eax et ebx")
            nasm_instruction("setl", "al", "", "", "met 1 dans al si eax < ebx, 0 sinon")
            nasm_instruction("movzx", "eax", "al", "", "met 0 ou 1 dans eax")
        if op == '>':
            nasm_instruction("cmp", "eax", "ebx", "", "compare eax et ebx")
            nasm_instruction("setg", "al", "", "", "met 1 dans al si eax > ebx, 0 sinon")
            nasm_instruction("movzx", "eax", "al", "", "met 0 ou 1 dans eax")
        if op == '<=':
            nasm_instruction("cmp", "eax", "ebx", "", "compare eax et ebx")
            nasm_instruction("setle", "al", "", "", "met 1 dans al si eax <= ebx, 0 sinon")
            nasm_instruction("movzx", "eax", "al", "", "met 0 ou 1 dans eax")
        if op == '>=':
            nasm_instruction("cmp", "eax", "ebx", "", "compare eax et ebx")
            nasm_instruction("setge", "al", "", "", "met 1 dans al si eax >= ebx, 0 sinon")
            nasm_instruction("movzx", "eax", "al", "", "met 0 ou 1 dans eax")
        if op == 'et':
            nasm_instruction("and", "eax", "ebx", "", "effectue l'opération eax" +op+"ebx et met le résultat dans eax" )
        if op == 'ou':
            nasm_instruction("or", "eax", "ebx", "", "effectue l'opération eax" +op+"ebx et met le résultat dans eax" )
    nasm_instruction("push",  "eax" , "", "", "empile le résultat")


if __name__ == "__main__":
    afficher_nasm = True
    lexer = FloLexer()
    parser = FloParser()
    if len(sys.argv) < 3 or sys.argv[1] not in ["-nasm","-table"]:
        print("usage: python3 generation_code.py -nasm|-table NOM_FICHIER_SOURCE.flo")
        exit(0)
    if sys.argv[1]  == "-nasm":
        afficher_nasm = True
    else:
        afficher_tableSymboles = True
    with open(sys.argv[2],"r") as f:
        data = f.read()
        try:
            arbre = parser.parse(lexer.tokenize(data))
            gen_programme(arbre)
        except EOFError:
            exit()
