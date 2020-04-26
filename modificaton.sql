use khalid;
/* Creation des utilisateurs */

-- Creates the login askhatir with password 'Admin123'.  
CREATE LOGIN askhatir   
    WITH PASSWORD = 'Admin123';  
GO  

-- Creates a database user for the login created above.  
CREATE USER askhatir FOR LOGIN askhatir;  
GO  
 
GRANT all TO askhatir;  
GO 

-- Creates the login Utilisateur with password 'Utilisateur123'.  
CREATE LOGIN Utilisateur   
    WITH PASSWORD = 'Utilisateur123';  
GO  

-- Creates a database user for the login created above.  
CREATE USER Utilisateur FOR LOGIN Utilisateur;  
GO  
 
GRANT select,insert to Utilisateur ;  
GO 

-- Insertion --

-- Insert Into Table Recette --

insert into Recette values (1,'Artichauts poivrade','des petits artichauts violets','25500 Kcal','Facile',4) 
insert into Recette values (2,'Avocat au thon','avocat, thon, herbes hachées et mayonnaise','7000 Kcal','Moyenne',2) 
insert into Recette values (3,'Coleslaw Breton','salade de chou et carotte','37500 Kcal','Facile',5) 

-- Insert Into Table Rangement --

insert into Rangement values (1,'Rangement1')

-- Insert Into Table Ingredient --

insert into Ingredient values (1,'artichauts violets','2000 Lcal')

-- Insert Into Table Produit --

insert into Produit values (1,1,1,'salade avec des herbes',2,200.49)

-- Insert Into Table Association --

insert into Association_3 values (1,1)
insert into Association_3 values (1,2)

-- Select From All tables --

select * from Recette
select * from Rangement
select * from Ingredient
select * from Produit

-- Update -- 

UPDATE Recette
SET Calories_Recette='30087 Kcal', NbrPersonne=6
WHERE Ref_Recette=1;

UPDATE Rangement
SET Nom_Rangement='Rangement A'
WHERE Ref_Rangement=1;

UPDATE Ingredient
SET Calories_Ingredient='34000 Kcal'
WHERE Ref_Ingredient=1;

UPDATE Produit
SET Quantite_Produit=5
WHERE Ref_Ingredient=1;

-- Delete --

DELETE FROM Produit WHERE Ref_Produit=1;
DELETE FROM Rangement WHERE Ref_Rangement=1;
Delete From Association_3 Where Ref_Ingredient=1 and Ref_Recette=1;
Delete From Association_3 Where Ref_Ingredient=1 and Ref_Recette=2;
DELETE FROM Recette WHERE Ref_Recette=1;
DELETE FROM Ingredient WHERE Ref_Ingredient=1;

