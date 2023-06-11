def afficher(s, indent=0):
    print(" " * indent + s)


class Table:
    def __init__(self, symboles):
        self.symboles = symboles  # Dictionnaire associant nom de fonction -> type de paramètre
        self.nom_fonction_en_cours = None  # Fonction en cours de génération de code
        self.type_fonction_en_cours = None  # Type de la fonction en cours de génération de code

    def obtenir_type(self, nom):
        return self.symboles.get(nom, None)

    def type_fonction(self, nom):
        return self.symboles[nom]["type"]

    # def ajouter_symbole(self, nom, type):
    def ajouter_symbole(self, nom, type, tailleZoneMemoire=0, typeArguments=None, listeVariables=None):
        # self.symboles[nom] = type
        self.symboles[nom] = {"type": type, "tailleZoneMemoire": tailleZoneMemoire, "typeArguments": typeArguments,
                              "listeVariables": listeVariables}

    def obtenir_symboles(self):
        return self.symboles

    def maj_nom_fonction_en_cours(self, nom_fonction):
        self.nom_fonction_en_cours = nom_fonction

    def obtenir_nom_fonction_courante(self):
        return self.nom_fonction_en_cours

    def maj_type_fonction_en_cours(self, type_fonction):
        self.type_fonction_en_cours = type_fonction

    def obtenir_type_fonction_courante(self):
        return self.type_fonction_en_cours

    def obtenir_taille_zone_memoire(self, nom):
        return self.symboles[nom]["tailleZoneMemoire"]

    def obtenir_type_parametre(self, nom):
        variables = self.symboles[self.nom_fonction_en_cours]["listeVariables"]
        for objet in variables:
            if objet.nom == nom:
                return objet.type

    def obtenir_zone_memoire_parametre(self, nom):
        variables = self.symboles[self.nom_fonction_en_cours]["listeVariables"]
        for objet in variables:
            if objet.nom == nom:
                return objet.zone_memoire

    def vider_listeParams(self):
        self.symboles[self.nom_fonction_en_cours]["listeVariables"] = None

    def afficher(self, indent=0):
        afficher("<tableSymboles>", indent)
        for symbole in self.symboles:
            afficher("<symbole nom=\"" + symbole + "\" type=\"" + self.symboles[symbole] + "\"/>", indent + 1)
        afficher("</tableSymboles>", indent)
