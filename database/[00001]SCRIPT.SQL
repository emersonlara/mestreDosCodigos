/******************************************************************************/
/****        Generated by IBExpert 2015.12.21.1 21/04/2018 18:08:23        ****/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES ISO8859_1;

CREATE DATABASE '127.0.0.1:C:\Users\Ambiente\Documents\Delphi\mestreDosCodigos\database\OMestreDosCodigos.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET ISO8859_1 COLLATION PT_BR;



/******************************************************************************/
/****                               Domains                                ****/
/******************************************************************************/

CREATE DOMAIN BOOLEANO AS
CHAR(1)
DEFAULT 'N'
NOT NULL;

CREATE DOMAIN DATA AS
DATE;

CREATE DOMAIN DATA_HORA AS
TIMESTAMP;

CREATE DOMAIN HORA AS
TIME;

CREATE DOMAIN INTEIRO AS
INTEGER
DEFAULT -999;

CREATE DOMAIN INTEIRO_PK AS
INTEGER
NOT NULL;

CREATE DOMAIN STRING_100 AS
VARCHAR(100)
COLLATE PT_BR;

CREATE DOMAIN STRING_150 AS
VARCHAR(150)
COLLATE PT_BR;

CREATE DOMAIN STRING_200 AS
VARCHAR(200)
COLLATE PT_BR;

CREATE DOMAIN STRING_300 AS
VARCHAR(300)
COLLATE PT_BR;

CREATE DOMAIN STRING_TEXTO AS
VARCHAR(1500)
COLLATE PT_BR;

CREATE DOMAIN TELEFONE AS
VARCHAR(11);



/******************************************************************************/
/****                              Generators                              ****/
/******************************************************************************/

CREATE GENERATOR GEN_ALTERNATIVAS_ID;
SET GENERATOR GEN_ALTERNATIVAS_ID TO 0;

CREATE GENERATOR GEN_ENTIDADE_ID;
SET GENERATOR GEN_ENTIDADE_ID TO 0;

CREATE GENERATOR GEN_NEW_TABLE_ID;
SET GENERATOR GEN_NEW_TABLE_ID TO 0;

CREATE GENERATOR GEN_PERGUNTAS_ID;
SET GENERATOR GEN_PERGUNTAS_ID TO 0;

CREATE GENERATOR GEN_PESQUISA_ID;
SET GENERATOR GEN_PESQUISA_ID TO 0;

CREATE GENERATOR GEN_PESSOA_ID;
SET GENERATOR GEN_PESSOA_ID TO 0;

CREATE GENERATOR GEN_RESPOSTA_ID;
SET GENERATOR GEN_RESPOSTA_ID TO 0;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE ALTERNATIVAS (
    ID           INTEIRO_PK NOT NULL,
    PERGUNTA_ID  INTEIRO_PK NOT NULL,
    DESCRICAO    STRING_100
);


CREATE TABLE ENT_PROPRIEDADE (
    ID               INTEIRO_PK,
    ENTIDADE_ID      INTEIRO_PK,
    NOME             STRING_100 NOT NULL,
    DESCRICAO        STRING_100 NOT NULL,
    TAMANHO          INTEIRO DEFAULT -999 NOT NULL,
    CASAS_DECIMAIS   INTEIRO DEFAULT -999 NOT NULL,
    REQUERIDO        BOOLEANO,
    SOMENTE_LEITURA  BOOLEANO,
    VISIVEL          BOOLEANO,
    TAMANHO_DISPLAY  INTEIRO NOT NULL,
    POSICAO          INTEIRO DEFAULT 0 NOT NULL
);


CREATE TABLE ENTIDADE (
    ID         INTEIRO_PK,
    NOME       STRING_100 NOT NULL,
    DESCRICAO  STRING_100 NOT NULL
);


CREATE TABLE PERGUNTAS (
    ID          INTEIRO_PK,
    PEQUISA_ID  INTEIRO_PK,
    DESCRICAO   STRING_TEXTO NOT NULL
);


CREATE TABLE PESQUISA (
    ID             INTEIRO_PK,
    DATA_CADASTRO  DATA NOT NULL,
    DATA_INICIO    DATA_HORA NOT NULL,
    DATA_FIM       DATA_HORA NOT NULL,
    ATIVA          BOOLEANO
);


CREATE TABLE PESSOA (
    ID                       INTEIRO_PK NOT NULL,
    NOME                     STRING_100 NOT NULL,
    EMAIL                    STRING_200 NOT NULL,
    CELULAR                  TELEFONE,
    PODE_CRIAR_PESQUISA      BOOLEANO,
    PODE_RESPONDER_PESQUISA  BOOLEANO
);


CREATE TABLE RESPOSTA (
    ID                  INTEIRO_PK NOT NULL,
    ALTERNATIVA_ID      INTEIRO_PK,
    PESSOA_RESPONDEU    INTEIRO_PK,
    DATA_HORA_RESPOSTA  DATA_HORA DEFAULT CURRENT_TIMESTAMP NOT NULL
);




/******************************************************************************/
/****                             Primary keys                             ****/
/******************************************************************************/

ALTER TABLE ALTERNATIVAS ADD CONSTRAINT PK_ALTERNATIVAS PRIMARY KEY (ID);
ALTER TABLE ENTIDADE ADD CONSTRAINT PK_ENTIDADE PRIMARY KEY (ID)
USING INDEX IDX_PK_ENTIDADE;
ALTER TABLE ENT_PROPRIEDADE ADD CONSTRAINT PK_ENT_PROPRIEDADE PRIMARY KEY (ID)
USING INDEX IDX_PK_ENT_PROPRIEDADE;
ALTER TABLE PERGUNTAS ADD CONSTRAINT PK_PERGUNTAS PRIMARY KEY (ID)
USING INDEX IDX_PK_PERGUNTAS;
ALTER TABLE PESQUISA ADD CONSTRAINT PK_PESQUISA PRIMARY KEY (ID)
USING INDEX IDX_PK_PESQUISA;
ALTER TABLE PESSOA ADD CONSTRAINT PK_PESSOA PRIMARY KEY (ID)
USING INDEX IDX_PK_PESSOA;
ALTER TABLE RESPOSTA ADD CONSTRAINT PK_RESPOSTA PRIMARY KEY (ID);


/******************************************************************************/
/****                             Foreign keys                             ****/
/******************************************************************************/

ALTER TABLE ENT_PROPRIEDADE ADD CONSTRAINT FK_ENT_PROPRIEDADE FOREIGN KEY (ENTIDADE_ID) REFERENCES ENTIDADE (ID) ON DELETE CASCADE ON UPDATE CASCADE
  USING INDEX IDX_FK_ENT_PROPRIEDADE;


/******************************************************************************/
/****                               Triggers                               ****/
/******************************************************************************/



SET TERM ^ ;



/******************************************************************************/
/****                         Triggers for tables                          ****/
/******************************************************************************/



/* Trigger: ALTERNATIVAS_BI */
CREATE TRIGGER ALTERNATIVAS_BI FOR ALTERNATIVAS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if ((new.id is null) or (NEW.ID< 0)) then
    new.id = gen_id(gen_alternativas_id,1);
end
^


/* Trigger: ENTIDADE_BI */
CREATE TRIGGER ENTIDADE_BI FOR ENTIDADE
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if ((new.id is null) or (new.id < 0))  then
    new.id = gen_id(gen_entidade_id,1);
end
^


/* Trigger: PERGUNTAS_BI */
CREATE TRIGGER PERGUNTAS_BI FOR PERGUNTAS
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if ((new.id is null)OR(NEW.ID < 0)) then
    new.id = gen_id(gen_perguntas_id,1);
end
^


/* Trigger: PESQUISA_BI */
CREATE TRIGGER PESQUISA_BI FOR PESQUISA
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if ((new.id is null) or (NEW.ID < 0) ) then
    new.id = gen_id(gen_pesquisa_id,1);
end
^


/* Trigger: PESSOA_BI */
CREATE TRIGGER PESSOA_BI FOR PESSOA
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if ((new.id is null)OR(NEW.ID < 0)) then
    new.id = gen_id(gen_pessoa_id,1);
end
^


/* Trigger: RESPOSTA_BI */
CREATE TRIGGER RESPOSTA_BI FOR RESPOSTA
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if ((new.id is null)OR(NEW.ID <0)) then
    new.id = gen_id(gen_RESPOSTA_id,1);
end
^

SET TERM ; ^

