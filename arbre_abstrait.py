"""
Affiche une chaine de caractère avec une certaine identation
"""
import enum
from typing import Optional, List
def afficher(s,indent=0):
    print(" "*indent+s)

class Type(enum.Enum):
    NONE = enum.auto()
    ENTIER = enum.auto()
    BOOLEEN = enum.auto()
    FONCTION = enum.auto()
    VIDE = enum.auto()
    NONDEFINI = enum.auto()

class Programme:
    def __init__(self,ListeFonctions ,listeInstructions):
        self.listeFonctions = ListeFonctions
        self.listeInstructions = listeInstructions
    def afficher(self,indent=0):
        afficher("<programme>",indent)
        if self.listeFonctions != None:
            self.listeFonctions.afficher(indent+1)
        self.listeInstructions.afficher(indent+1)
        afficher("</programme>",indent)

    def type(self):
        raise NotImplementedError("Un Programme n'a pas de type")

class ListeInstructions:
    def __init__(self):
        self.instructions = []
    def afficher(self,indent=0):
        afficher("<listeInstructions>",indent)
        for instruction in self.instructions:
            instruction.afficher(indent+1)
        afficher("</listeInstructions>",indent)

    def ajouter_instruction(self,instruction):
        self.instructions.append(instruction)


class Ecrire:
    def __init__(self,exp):
        self.exp = exp
    def afficher(self,indent=0):
        afficher("<ecrire>",indent)
        self.exp.afficher(indent+1)
        afficher("</ecrire>",indent)

class Operation:
    def __init__(self,op,exp1,exp2):
        self.exp1 = exp1
        self.op = op
        self.exp2 = exp2
    def afficher(self,indent=0):
        afficher("<operation "+ "\"" + self.op + "\" >", indent)
        self.exp1.afficher(indent+1)
        if self.exp2 != None:
            self.exp2.afficher(indent+1)
        afficher("</operation>",indent)

    def type(self):
        if self.exp1.type() == self.exp2.type():
            if self.op in ["<",">","==","!=",">=","<="]:
                return Type.BOOLEEN
            return self.exp1.type()
        return Type.NONE

class Entier:
    def __init__(self,valeur):
        self.valeur = valeur
    def afficher(self,indent=0):
        afficher("[Entier:"+str(self.valeur)+"]",indent)

    def type(self):
        return Type.ENTIER

class Variable:
    def __init__(self,valeur):
        self.nom = valeur
    def afficher(self,indent=0):
        afficher("[Variable:"+self.nom+"]",indent)

    def type(self):
        return Type.NONDEFINI

class Booleen:
    def __init__(self,valeur):
        self.valeur = valeur
    def afficher(self,indent=0):
        afficher("[Booleen:"+self.valeur+"]",indent)

    def type(self):
        return Type.BOOLEEN

class AppelFonction:
    def __init__(self,nom,listeExpressions):
        self.nom = nom
        self.listeExpressions = listeExpressions
    def afficher(self,indent=0):
        afficher("[AppelFonction:"+self.nom+"]",indent)
        if self.listeExpressions != None:
            self.listeExpressions.afficher(indent+1)
        else:
            afficher("pas d'arguments",indent+1)


class Lire:
    def __init__(self):
        self.nom = "Lire"
    def afficher(self,indent=0):
        afficher("<Lire>",indent)
        afficher("</Lire>",indent)

class ListeExpressions:
    def __init__(self):
        self.expressions = []
    def afficher(self,indent=0):
        afficher("<listeExpressions>",indent)
        for expression in self.expressions:
            expression.afficher(indent+1)
        afficher("</listeExpressions>",indent)

class DeclarationVariable:
    def __init__(self,type,nom):
        self.type = type
        self.nom = nom
    def afficher(self,indent=0):
        afficher("<declarationVariable type=\""+self.type+"\" nom=\""+self.nom+"\"/>",indent)

    def type(self):
        if self.type == "entier":
            return Type.ENTIER
        elif self.type == "booleen":
            return Type.BOOLEEN
        else:
            return Type.NONE

class Affectation:
    def __init__(self,nom,expression):
        self.nom = nom
        self.expression = expression
    def afficher(self,indent=0):
        afficher("<affectation nom=\""+self.nom+"\""+ ">",indent)
        self.expression.afficher(indent+1)
        afficher("</affectation>",indent)

    def type(self):
        return Type.NONE

class DeclarationAffectation:
    def __init__(self,type,nom,expression):
        self.type = type
        self.nom = nom
        self.expression = expression
    def afficher(self,indent=0):
        afficher("<declarationAffectation type=\""+self.type+"\" nom=\""+self.nom+"\""+ ">",indent)
        self.expression.afficher(indent+1)
        afficher("</declarationAffectation>",indent)

    def type(self):
        if self.type == "entier":
            return Type.ENTIER
        elif self.type == "booleen":
            return Type.BOOLEEN
        else:
            return Type.NONE


class Conditionnelle:
    def __init__(self,condition, listeInstructions, listeInstructionsSinon : Optional[ListeInstructions]):
        self.condition = condition
        self.listeInstructions = listeInstructions
        self.listeInstructionsSinon = listeInstructionsSinon

    def afficher(self,indent=0):
        afficher("<conditionnelle>",indent)
        afficher("<condition>",indent)
        self.condition.afficher(indent+1)
        afficher("</condition>",indent)
        afficher("<instructions>",indent)
        self.listeInstructions.afficher(indent+1)
        afficher("</instructions>",indent)
        if self.listeInstructionsSinon != None:
            afficher("<sinon>",indent)
            self.listeInstructionsSinon.afficher(indent+1)
            afficher("</sinon>",indent)
        afficher("</conditionnelle>",indent)

    def ajouter_sinonsi(self,condition,listeInstructions):
        if (self.listeInstructionsSinon and isinstance(self.listeInstructionsSinon.instructions[-1],Conditionnelle)):
            self.listeInstructionsSinon.instructions[-1].ajouter_sinonsi(condition,listeInstructions)
        else:
            if self.listeInstructionsSinon == None:
                self.listeInstructionsSinon = ListeInstructions()
            self.listeInstructionsSinon.ajouter_instruction(Conditionnelle(condition,listeInstructions,None))

    def ajouter_sinon(self,listeInstructions):
        self.ajouter_sinonsi(Booleen("Vrai"),listeInstructions)

class BoucleTantQue:
    def __init__(self,expr,listeInstructions):
        self.expr = expr
        self.listeInstructions = listeInstructions
    def afficher(self,indent=0):
        afficher("<boucleTantQue>",indent)
        afficher("<conditionTantQue>",indent)
        self.expr.afficher(indent+1)
        afficher("</conditionTantQue>",indent)
        afficher("<instructionsTantQue>",indent)
        self.listeInstructions.afficher(indent+1)
        afficher("</instructionsTantQue>",indent)
        afficher("</boucleTantQue>",indent)

    def type(self):
        return Type.NONE


class Retourner:
    def __init__(self,expression):
        self.expression = expression
    def afficher(self,indent=0):
        afficher("<retourner>",indent)
        self.expression.afficher(indent+1)
        afficher("</retourner>",indent)

    def type(self):
        return Type.NONE

class ListeFonctions:
    def __init__(self):
        self.fonctions = []
    def afficher(self,indent=0):
        afficher("<listeFonctions>",indent)
        for fonction in self.fonctions:
            fonction.afficher(indent+1)
        afficher("</listeFonctions>",indent)



class Fonction:
    def __init__(self,type,nom,listeParametres,listeInstructions):
        self.type = type
        self.nom = nom
        self.listeParametres = listeParametres
        self.listeInstructions = listeInstructions
        self.taille_pile = 0
    def afficher(self,indent=0):
        afficher("<fonction type=\""+self.type+"\" nom=\""+self.nom+"\""+ ">",indent)
        if self.listeParametres != None:
            self.listeParametres.afficher(indent+1)
        self.listeInstructions.afficher(indent+1)
        afficher("</fonction>",indent)

    def type(self):
        return Type.FONCTION

class ListeParametres:
    def __init__(self):
        self.parametres = []
    def afficher(self,indent=0):
        afficher("<listeParametres>",indent)
        for parametre in self.parametres:
            parametre.afficher(indent+1)
        afficher("</listeParametres>",indent)


class Parametre:
    def __init__(self,type,nom):
        self.type = type
        self.nom = nom
    def afficher(self,indent=0):
        afficher("<parametre type=\""+self.type+"\" nom=\""+self.nom+"\""+ "/>",indent)

    def type(self):
        if self.type == "entier":
            return Type.ENTIER
        elif self.type == "booleen":
            return Type.BOOLEEN
        else:
            return Type.NONE