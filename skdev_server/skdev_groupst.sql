CREATE TABLE IF NOT EXISTS skdev_groupstaff (
    nomedogrupo VARCHAR(250) NOT NULL DEFAULT '',
    imagemdogrupo VARCHAR(250) NOT NULL DEFAULT '',
    logdeenviarimagens VARCHAR(250) NOT NULL DEFAULT '',
    logdecriacaodeorgs VARCHAR(250) NOT NULL DEFAULT '',
    logdegerenciarorgs VARCHAR(250) NOT NULL DEFAULT '',
    logdegerenciarstaff VARCHAR(250) NOT NULL DEFAULT '',
    logdealteracaodelogs VARCHAR(250) NOT NULL DEFAULT '',
    logdegerenciarcidadoes VARCHAR(250) NOT NULL DEFAULT '',
    logdeupamentodemembros VARCHAR(250) NOT NULL DEFAULT '',
    logderebaixamentodemembros VARCHAR(250) NOT NULL DEFAULT '',
    logderemocaodemembros VARCHAR(250) NOT NULL DEFAULT '',
    logdeadicaodemembros VARCHAR(250) NOT NULL DEFAULT '',
    cargos VARCHAR(10000) NOT NULL DEFAULT ''
);


-- Criação da tabela skdev_groups
CREATE TABLE IF NOT EXISTS skdev_groups (
    grupo VARCHAR(250) NOT NULL DEFAULT '',
    valores VARCHAR(10000) NOT NULL DEFAULT ''
);

-- Criação da tabela skdev_permissoes
CREATE TABLE IF NOT EXISTS skdev_permissoes (
    user_id VARCHAR(250) NOT NULL DEFAULT '',
    imagemlink VARCHAR(250) NOT NULL DEFAULT '',
    cargos VARCHAR(10000) NOT NULL DEFAULT ''
);

-- Criação da tabela skdev_blacklist
CREATE TABLE IF NOT EXISTS skdev_blacklist (
    user_id VARCHAR(250) NOT NULL DEFAULT '',
    valor VARCHAR(250) NOT NULL DEFAULT ''
);


-- Criação das tabelas
CREATE TABLE IF NOT EXISTS skdev_groupstaff (
    nomedogrupo VARCHAR(250) NOT NULL DEFAULT '',
    imagemdogrupo VARCHAR(250) NOT NULL DEFAULT '',
    logdeenviarimagens VARCHAR(250) NOT NULL DEFAULT '',
    logdecriacaodeorgs VARCHAR(250) NOT NULL DEFAULT '',
    logdegerenciarorgs VARCHAR(250) NOT NULL DEFAULT '',
    logdegerenciarstaff VARCHAR(250) NOT NULL DEFAULT '',
    logdealteracaodelogs VARCHAR(250) NOT NULL DEFAULT '',
    logdegerenciarcidadoes VARCHAR(250) NOT NULL DEFAULT '',
    logdeupamentodemembros VARCHAR(250) NOT NULL DEFAULT '',
    logderebaixamentodemembros VARCHAR(250) NOT NULL DEFAULT '',
    logderemocaodemembros VARCHAR(250) NOT NULL DEFAULT '',
    logdeadicaodemembros VARCHAR(250) NOT NULL DEFAULT '',
    cargos VARCHAR(10000) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS skdev_groups (
    grupo VARCHAR(250) NOT NULL DEFAULT '',
    valores VARCHAR(10000) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS skdev_permissoes (
    user_id VARCHAR(250) NOT NULL DEFAULT '',
    imagemlink VARCHAR(250) NOT NULL DEFAULT '',
    cargos VARCHAR(10000) NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS skdev_blacklist (
    user_id VARCHAR(250) NOT NULL DEFAULT '',
    valor VARCHAR(250) NOT NULL DEFAULT ''
);

-- Selecionar todos os registros das tabelas
SELECT * FROM skdev_groupstaff;
SELECT * FROM skdev_groups;
SELECT * FROM skdev_groups WHERE grupo = @nomedogrupo;
SELECT * FROM skdev_blacklist;
SELECT * FROM skdev_permissoes;

-- Inserir registros nas tabelas
INSERT INTO skdev_groupstaff (nomedogrupo) VALUES ('Administração');
INSERT INTO skdev_groups (grupo, valores) VALUES (@grupo, @valores);
INSERT INTO skdev_blacklist (user_id, valor) VALUES (@user_id, @valor);
INSERT INTO skdev_permissoes (user_id, cargos) VALUES (@user_id, @cargos);
INSERT INTO skdev_permissoes (user_id, imagemlink) VALUES (@user_id, @imagemlink);

-- Atualizar registros nas tabelas
UPDATE skdev_groups SET grupo = @nomenovodogrupo, valores = @valoresnovos WHERE grupo = @nomeantigodogrupo;
UPDATE skdev_groups SET valores = @valoresnovos WHERE grupo = @nomedogrupo;
UPDATE skdev_groupstaff SET 
    logdeenviarimagens = @logdeenviarimagens,
    logdecriacaodeorgs = @logdecriacaodeorgs,
    logdegerenciarorgs = @logdegerenciarorgs,
    logdegerenciarstaff = @logdegerenciarstaff,
    logdealteracaodelogs = @logdealteracaodelogs,
    logdegerenciarcidadoes = @logdegerenciarcidadoes,
    logdeupamentodemembros = @logdeupamentodemembros,
    logderebaixamentodemembros = @logderebaixamentodemembros,
    logderemocaodemembros = @logderemocaodemembros,
    logdeadicaodemembros = @logdeadicaodemembros;
UPDATE skdev_groupstaff SET 
    nomedogrupo = @nomenovostaff, 
    imagemdogrupo = @imagemdogrupo, 
    cargos = @cargos;
UPDATE skdev_blacklist SET valor = @valor WHERE user_id = @user_id;
UPDATE skdev_permissoes SET cargos = @cargos WHERE user_id = @user_id;
UPDATE skdev_permissoes SET imagemlink = @imagemlink WHERE user_id = @user_id;

-- Deletar registros das tabelas
DELETE FROM skdev_blacklist WHERE user_id = @user_id;
DELETE FROM skdev_groups WHERE grupo = @nomedogrupo;
