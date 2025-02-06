
DROP TABLE IF EXISTS produit;
DROP TABLE IF EXISTS type_produit;
DROP TABLE IF EXISTS famille_produit;

CREATE TABLE famille_produit (
    id int,
    nom varchar(255),
    image varchar(255),
    PRIMARY KEY (id)
);

CREATE TABLE type_produit (
    id int,
    nom varchar(255),
    image varchar(255),
    idfamille int,
    PRIMARY KEY (id),
    FOREIGN KEY (idfamille) REFERENCES famille_produit(id)
);

CREATE TABLE produit (
    id int,
    nom varchar(255),
    desccourte varchar(255),
    desclongue varchar(1000),
    prix varchar(255),
    image1 varchar(255),
    image2 varchar(255),
    idtype int,
    PRIMARY KEY (id),
    FOREIGN KEY (idtype) REFERENCES type_produit(id)
);

INSERT INTO famille_produit VALUES (1, 'Bijoux en argent', 'argent.gif');
INSERT INTO famille_produit VALUES (2, 'Bijoux en cuivre', 'cuivre.gif');

INSERT INTO type_produit VALUES (1, 'Bagues', 'bague1.gif', 1);
INSERT INTO type_produit VALUES (2, 'Bracelets', 'bracelet1.gif', 1);
INSERT INTO type_produit VALUES (3, 'Chaines', 'chaine1.gif', 1);
INSERT INTO type_produit VALUES (4, 'Bagues', 'bague2.gif', 2);
INSERT INTO type_produit VALUES (5, 'Bracelets', 'bracelet2.gif', 2);
INSERT INTO type_produit VALUES (6, 'Chaines', 'chaine2.gif', 2);

INSERT INTO produit VALUES (1, 'test1', 'desc courte ...', 'desc longue .......', 20, 'test1.gif','test21.gif', 1);
INSERT INTO produit VALUES (2, 'test2', 'desc courte ...', 'desc longue .......', 20, 'test2.gif','test22.gif', 1);
INSERT INTO produit VALUES (3, 'test3', 'desc courte ...', 'desc longue .......', 20, 'test3.gif','test23.gif', 1);
INSERT INTO produit VALUES (4, 'test4', 'desc courte ...', 'desc longue .......', 20, 'test4.gif','test24.gif', 1);
INSERT INTO produit VALUES (5, 'test5', 'desc courte ...', 'desc longue .......', 20, 'test5.gif','test25.gif', 1);

INSERT INTO produit VALUES (6, 'test6', 'desc courte ...', 'desc longue .......', 30, 'test6.gif','test21.gif', 4);
INSERT INTO produit VALUES (7, 'test7', 'desc courte ...', 'desc longue .......', 30, 'test7.gif','test22.gif', 4);
INSERT INTO produit VALUES (8, 'test8', 'desc courte ...', 'desc longue .......', 30, 'test8.gif','test23.gif', 4);
INSERT INTO produit VALUES (9, 'test9', 'desc courte ...', 'desc longue .......', 30, 'test9.gif','test24.gif', 4);
INSERT INTO produit VALUES (10, 'test10', 'desc courte ...', 'desc longue .......', 30, 'test10.gif','test25.gif', 4);

INSERT INTO produit VALUES (11, 'test11', 'desc courte ...', 'desc longue .......', 20, 'test1.gif','test21.gif', 1);
INSERT INTO produit VALUES (12, 'test12', 'desc courte ...', 'desc longue .......', 20, 'test1.gif','test21.gif', 1);
