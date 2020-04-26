/*Creation Base De Donnée*/

Create database GRecette ;
use GRecette;



/*==============================================================*/
/* Table: Ingredient                                            */
/*==============================================================*/
create table Ingredient (
   Ref_Ingredient       int                  not null,
   Nom_Ingredient       varchar(254)         null,
   Calories_Ingredient  varchar(254)         null,
   constraint PK_INGREDIENT primary key nonclustered (Ref_Ingredient)
)
go

/*==============================================================*/
/* Table: Produit                                               */
/*==============================================================*/
create table Produit (
   Ref_Produit          int                  not null,
   Ref_Rangement        int                  not null,
   Ref_Ingredient       int                  not null,
   Description_Produit  varchar(254)         null,
   Quantite_Produit     int                  null,
   Prix_Produit         float                null,
   constraint PK_PRODUIT primary key nonclustered (Ref_Produit)
)
go

/*==============================================================*/
/* Table: Rangement                                             */
/*==============================================================*/
create table Rangement (
   Ref_Rangement        int                  not null,
   Nom_Rangement        varchar(254)         null,
   constraint PK_RANGEMENT primary key nonclustered (Ref_Rangement)
)
go

/*==============================================================*/
/* Table: Recette                                               */
/*==============================================================*/
create table Recette (
   Ref_Recette          int                  not null,
   Nom_Recette          varchar(254)         null,
   Description_Recette  varchar(254)         null,
   Calories_Recette     varchar(254)         null,
   Niveau_Difficulte    varchar(254)         null,
   NbrPersonne          int                  null,
   constraint PK_RECETTE primary key nonclustered (Ref_Recette)
)
go

/*==============================================================*/
/* Index: ASSOCIATION_1_FK                                      */
/*==============================================================*/
create index ASSOCIATION_1_FK on Produit (
Ref_Rangement ASC
)
go

/*==============================================================*/
/* Index: ASSOCIATION_2_FK                                      */
/*==============================================================*/
create index ASSOCIATION_2_FK on Produit (
Ref_Ingredient ASC
)
go

/*==============================================================*/
/* Table: Association_3                                         */
/*==============================================================*/
create table Association_3 (
   Ref_Ingredient       int                  not null,
   Ref_Recette          int                  not null,
   constraint PK_ASSOCIATION_3 primary key (Ref_Ingredient, Ref_Recette)
)
go


/*==============================================================*/
/* Index: ASSOCIATION_3_FK                                      */
/*==============================================================*/
create index ASSOCIATION_3_FK on Association_3 (
Ref_Ingredient ASC
)
go

/*==============================================================*/
/* Index: ASSOCIATION_3_FK2                                     */
/*==============================================================*/
create index ASSOCIATION_3_FK2 on Association_3 (
Ref_Recette ASC
)
go



alter table Association_3
   add constraint FK_ASSOCIAT_ASSOCIATI_INGREDIE foreign key (Ref_Ingredient)
      references Ingredient (Ref_Ingredient)
go

alter table Association_3
   add constraint FK_ASSOCIAT_ASSOCIATI_RECETTE foreign key (Ref_Recette)
      references Recette (Ref_Recette)
go

alter table Produit
   add constraint FK_PRODUIT_ASSOCIATI_RANGEMEN foreign key (Ref_Rangement)
      references Rangement (Ref_Rangement)
go

alter table Produit
   add constraint FK_PRODUIT_ASSOCIATI_INGREDIE foreign key (Ref_Ingredient)
      references Ingredient (Ref_Ingredient)
go


