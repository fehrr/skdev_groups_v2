local Tunnel = module('vrp','lib/Tunnel')
local Proxy = module('vrp','lib/Proxy')
local vRP = Proxy.getInterface('vRP')
local vCLIENT = Tunnel.getInterface('skdev_groups_v2')
skdevs = {}
Tunnel.bindInterface('skdev_groups_v2',skdevs)

-- Prepares and Executes
CreateThread(function()
    if baseatual == 'creativev6' then
        vRP.Prepare("skdev_group/grupostaff", [[CREATE TABLE IF NOT EXISTS skdev_groupstaff(
            nomedogrupo varchar(250) NOT NULL DEFAULT "",
            imagemdogrupo varchar(250) NOT NULL DEFAULT "",
            logdeenviarimagens varchar(250) NOT NULL DEFAULT "",
            logdecriacaodeorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarstaff varchar(250) NOT NULL DEFAULT "",
            logdealteracaodelogs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarcidadoes varchar(250) NOT NULL DEFAULT "",
            logdeupamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderebaixamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderemocaodemembros varchar(250) NOT NULL DEFAULT "",
            logdeadicaodemembros varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.Query("skdev_group/grupostaff")
    
        vRP.Prepare("skdev_group/criargroups", [[CREATE TABLE IF NOT EXISTS skdev_groups(
            grupo varchar(250) NOT NULL DEFAULT "",
            valores varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.Query("skdev_group/criargroups")
    
        vRP.Prepare("skdev_group/criarpermissoes", [[CREATE TABLE IF NOT EXISTS skdev_permissoes(
            user_id varchar(250) NOT NULL DEFAULT "",
            imagemlink varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.Query("skdev_group/criarpermissoes")
    
        vRP.Prepare("skdev_group/criarblacklist", [[CREATE TABLE IF NOT EXISTS skdev_blacklist(
            user_id varchar(250) NOT NULL DEFAULT "",
            valor varchar(250) NOT NULL DEFAULT ""
        )]])
        vRP.Query("skdev_group/criarblacklist")
    
        vRP.Prepare("skdev_group/staffrecebervalor","SELECT * FROM skdev_groupstaff")
        vRP.Prepare("skdev_group/staffrecebergrupos","SELECT * FROM skdev_groups")
        vRP.Prepare("skdev_group/staffrecebergrupoinfosselecionado","SELECT * FROM skdev_groups WHERE grupo = @nomedogrupo")
        vRP.Prepare("skdev_group/staffinserirpadrao","INSERT INTO skdev_groupstaff (nomedogrupo) VALUES ('Administração')")
        vRP.Prepare("skdev_group/inserirorganizacoestaff","INSERT INTO skdev_groups (grupo, valores) VALUES (@grupo,@valores)")
        vRP.Prepare("skdev_group/editarorganizacao","UPDATE skdev_groups SET grupo = @nomenovodogrupo, valores = @valoresnovos WHERE grupo = @nomeantigodogrupo")
        vRP.Prepare("skdev_group/editarValoresOrg","UPDATE skdev_groups SET valores = @valoresnovos WHERE grupo = @nomedogrupo")
        vRP.Prepare("skdev_group/editarStaffLogs","UPDATE skdev_groupstaff SET logdeenviarimagens = @logdeenviarimagens,logdecriacaodeorgs = @logdecriacaodeorgs,logdegerenciarorgs = @logdegerenciarorgs,logdegerenciarstaff = @logdegerenciarstaff,logdealteracaodelogs = @logdealteracaodelogs,logdegerenciarcidadoes = @logdegerenciarcidadoes,logdeupamentodemembros = @logdeupamentodemembros,logderebaixamentodemembros = @logderebaixamentodemembros,logderemocaodemembros = @logderemocaodemembros,logdeadicaodemembros = @logdeadicaodemembros")
        vRP.Prepare("skdev_group/editarStaffPersonalidade","UPDATE skdev_groupstaff SET nomedogrupo = @nomenovostaff, imagemdogrupo = @imagemdogrupo, cargos = @cargos")
    
        vRP.Prepare("skdev_group/blacklistall","SELECT * FROM skdev_blacklist")
        vRP.Prepare("skdev_group/insertblacklist","INSERT INTO skdev_blacklist (user_id,valor) VALUES (@user_id,@valor)")
        vRP.Prepare("skdev_group/updateblacklist","UPDATE skdev_blacklist SET valor = @valor WHERE user_id = @user_id")
        vRP.Prepare("skdev_group/organizacoesMembrosPermissoes","SELECT * FROM skdev_permissoes")
        vRP.Prepare("skdev_group/insertGrupos","INSERT INTO skdev_permissoes (user_id,cargos) VALUES (@user_id,@cargos)")
        vRP.Prepare("skdev_group/updateGrupos","UPDATE skdev_permissoes SET cargos = @cargos WHERE user_id = @user_id")
        vRP.Prepare("skdev_group/insertImagenPropia","INSERT INTO skdev_permissoes (user_id,imagemlink) VALUES (@user_id,@imagemlink)")
        vRP.Prepare("skdev_group/updateImagenPropia","UPDATE skdev_permissoes SET imagemlink = @imagemlink WHERE user_id = @user_id")
    
        vRP.Prepare("skdev_group/deleteblacklist","DELETE FROM skdev_blacklist WHERE user_id = @user_id")
        vRP.Prepare("skdev_group/deleteGroup","DELETE FROM skdev_groups WHERE grupo = @nomedogrupo")
    
        local queryStaff = vRP.Query("skdev_group/staffrecebervalor")
        if #queryStaff == 0 then
            vRP.Query('skdev_group/staffinserirpadrao')
        end
    end
    if baseatual == 'creativev5' then
        vRP.prepare("skdev_group/grupostaff", [[CREATE TABLE IF NOT EXISTS skdev_groupstaff(
            nomedogrupo varchar(250) NOT NULL DEFAULT "",
            imagemdogrupo varchar(250) NOT NULL DEFAULT "",
            logdeenviarimagens varchar(250) NOT NULL DEFAULT "",
            logdecriacaodeorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarstaff varchar(250) NOT NULL DEFAULT "",
            logdealteracaodelogs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarcidadoes varchar(250) NOT NULL DEFAULT "",
            logdeupamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderebaixamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderemocaodemembros varchar(250) NOT NULL DEFAULT "",
            logdeadicaodemembros varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/grupostaff")
    
        vRP.prepare("skdev_group/criargroups", [[CREATE TABLE IF NOT EXISTS skdev_groups(
            grupo varchar(250) NOT NULL DEFAULT "",
            valores varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criargroups")
    
        vRP.prepare("skdev_group/criarpermissoes", [[CREATE TABLE IF NOT EXISTS skdev_permissoes(
            user_id varchar(250) NOT NULL DEFAULT "",
            imagemlink varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarpermissoes")
    
        vRP.prepare("skdev_group/criarblacklist", [[CREATE TABLE IF NOT EXISTS skdev_blacklist(
            user_id varchar(250) NOT NULL DEFAULT "",
            valor varchar(250) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarblacklist")
    
        vRP.prepare("skdev_group/staffrecebervalor","SELECT * FROM skdev_groupstaff")
        vRP.prepare("skdev_group/staffrecebergrupos","SELECT * FROM skdev_groups")
        vRP.prepare("skdev_group/staffrecebergrupoinfosselecionado","SELECT * FROM skdev_groups WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/staffinserirpadrao","INSERT INTO skdev_groupstaff (nomedogrupo) VALUES ('Administração')")
        vRP.prepare("skdev_group/inserirorganizacoestaff","INSERT INTO skdev_groups (grupo, valores) VALUES (@grupo,@valores)")
        vRP.prepare("skdev_group/editarorganizacao","UPDATE skdev_groups SET grupo = @nomenovodogrupo, valores = @valoresnovos WHERE grupo = @nomeantigodogrupo")
        vRP.prepare("skdev_group/editarValoresOrg","UPDATE skdev_groups SET valores = @valoresnovos WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/editarStaffLogs","UPDATE skdev_groupstaff SET logdeenviarimagens = @logdeenviarimagens,logdecriacaodeorgs = @logdecriacaodeorgs,logdegerenciarorgs = @logdegerenciarorgs,logdegerenciarstaff = @logdegerenciarstaff,logdealteracaodelogs = @logdealteracaodelogs,logdegerenciarcidadoes = @logdegerenciarcidadoes,logdeupamentodemembros = @logdeupamentodemembros,logderebaixamentodemembros = @logderebaixamentodemembros,logderemocaodemembros = @logderemocaodemembros,logdeadicaodemembros = @logdeadicaodemembros")
        vRP.prepare("skdev_group/editarStaffPersonalidade","UPDATE skdev_groupstaff SET nomedogrupo = @nomenovostaff, imagemdogrupo = @imagemdogrupo, cargos = @cargos")
    
        vRP.prepare("skdev_group/blacklistall","SELECT * FROM skdev_blacklist")
        vRP.prepare("skdev_group/insertblacklist","INSERT INTO skdev_blacklist (user_id,valor) VALUES (@user_id,@valor)")
        vRP.prepare("skdev_group/updateblacklist","UPDATE skdev_blacklist SET valor = @valor WHERE user_id = @user_id")
        vRP.prepare("skdev_group/organizacoesMembrosPermissoes","SELECT * FROM skdev_permissoes")
        vRP.prepare("skdev_group/insertGrupos","INSERT INTO skdev_permissoes (user_id,cargos) VALUES (@user_id,@cargos)")
        vRP.prepare("skdev_group/updateGrupos","UPDATE skdev_permissoes SET cargos = @cargos WHERE user_id = @user_id")
        vRP.prepare("skdev_group/insertImagenPropia","INSERT INTO skdev_permissoes (user_id,imagemlink) VALUES (@user_id,@imagemlink)")
        vRP.prepare("skdev_group/updateImagenPropia","UPDATE skdev_permissoes SET imagemlink = @imagemlink WHERE user_id = @user_id")
    
        vRP.prepare("skdev_group/deleteblacklist","DELETE FROM skdev_blacklist WHERE user_id = @user_id")
        vRP.prepare("skdev_group/deleteGroup","DELETE FROM skdev_groups WHERE grupo = @nomedogrupo")
    
        local queryStaff = vRP.query("skdev_group/staffrecebervalor")
        if #queryStaff == 0 then
            vRP.execute('skdev_group/staffinserirpadrao')
        end
    end
    if baseatual == 'creativev4' then
        vRP.prepare("skdev_group/grupostaff", [[CREATE TABLE IF NOT EXISTS skdev_groupstaff(
            nomedogrupo varchar(250) NOT NULL DEFAULT "",
            imagemdogrupo varchar(250) NOT NULL DEFAULT "",
            logdeenviarimagens varchar(250) NOT NULL DEFAULT "",
            logdecriacaodeorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarstaff varchar(250) NOT NULL DEFAULT "",
            logdealteracaodelogs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarcidadoes varchar(250) NOT NULL DEFAULT "",
            logdeupamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderebaixamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderemocaodemembros varchar(250) NOT NULL DEFAULT "",
            logdeadicaodemembros varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/grupostaff")
    
        vRP.prepare("skdev_group/criargroups", [[CREATE TABLE IF NOT EXISTS skdev_groups(
            grupo varchar(250) NOT NULL DEFAULT "",
            valores varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criargroups")
    
        vRP.prepare("skdev_group/criarpermissoes", [[CREATE TABLE IF NOT EXISTS skdev_permissoes(
            user_id varchar(250) NOT NULL DEFAULT "",
            imagemlink varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarpermissoes")
    
        vRP.prepare("skdev_group/criarblacklist", [[CREATE TABLE IF NOT EXISTS skdev_blacklist(
            user_id varchar(250) NOT NULL DEFAULT "",
            valor varchar(250) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarblacklist")
    
        vRP.prepare("skdev_group/staffrecebervalor","SELECT * FROM skdev_groupstaff")
        vRP.prepare("skdev_group/staffrecebergrupos","SELECT * FROM skdev_groups")
        vRP.prepare("skdev_group/staffrecebergrupoinfosselecionado","SELECT * FROM skdev_groups WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/staffinserirpadrao","INSERT INTO skdev_groupstaff (nomedogrupo) VALUES ('Administração')")
        vRP.prepare("skdev_group/inserirorganizacoestaff","INSERT INTO skdev_groups (grupo, valores) VALUES (@grupo,@valores)")
        vRP.prepare("skdev_group/editarorganizacao","UPDATE skdev_groups SET grupo = @nomenovodogrupo, valores = @valoresnovos WHERE grupo = @nomeantigodogrupo")
        vRP.prepare("skdev_group/editarValoresOrg","UPDATE skdev_groups SET valores = @valoresnovos WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/editarStaffLogs","UPDATE skdev_groupstaff SET logdeenviarimagens = @logdeenviarimagens,logdecriacaodeorgs = @logdecriacaodeorgs,logdegerenciarorgs = @logdegerenciarorgs,logdegerenciarstaff = @logdegerenciarstaff,logdealteracaodelogs = @logdealteracaodelogs,logdegerenciarcidadoes = @logdegerenciarcidadoes,logdeupamentodemembros = @logdeupamentodemembros,logderebaixamentodemembros = @logderebaixamentodemembros,logderemocaodemembros = @logderemocaodemembros,logdeadicaodemembros = @logdeadicaodemembros")
        vRP.prepare("skdev_group/editarStaffPersonalidade","UPDATE skdev_groupstaff SET nomedogrupo = @nomenovostaff, imagemdogrupo = @imagemdogrupo, cargos = @cargos")
    
        vRP.prepare("skdev_group/blacklistall","SELECT * FROM skdev_blacklist")
        vRP.prepare("skdev_group/insertblacklist","INSERT INTO skdev_blacklist (user_id,valor) VALUES (@user_id,@valor)")
        vRP.prepare("skdev_group/updateblacklist","UPDATE skdev_blacklist SET valor = @valor WHERE user_id = @user_id")
        vRP.prepare("skdev_group/organizacoesMembrosPermissoes","SELECT * FROM skdev_permissoes")
        vRP.prepare("skdev_group/insertGrupos","INSERT INTO skdev_permissoes (user_id,cargos) VALUES (@user_id,@cargos)")
        vRP.prepare("skdev_group/updateGrupos","UPDATE skdev_permissoes SET cargos = @cargos WHERE user_id = @user_id")
        vRP.prepare("skdev_group/insertImagenPropia","INSERT INTO skdev_permissoes (user_id,imagemlink) VALUES (@user_id,@imagemlink)")
        vRP.prepare("skdev_group/updateImagenPropia","UPDATE skdev_permissoes SET imagemlink = @imagemlink WHERE user_id = @user_id")
    
        vRP.prepare("skdev_group/deleteblacklist","DELETE FROM skdev_blacklist WHERE user_id = @user_id")
        vRP.prepare("skdev_group/deleteGroup","DELETE FROM skdev_groups WHERE grupo = @nomedogrupo")
    
        local queryStaff = vRP.query("skdev_group/staffrecebervalor")
        if #queryStaff == 0 then
            vRP.execute('skdev_group/staffinserirpadrao')
        end
    end
    if baseatual == 'creativev3' then
        vRP.prepare("skdev_group/grupostaff", [[CREATE TABLE IF NOT EXISTS skdev_groupstaff(
            nomedogrupo varchar(250) NOT NULL DEFAULT "",
            imagemdogrupo varchar(250) NOT NULL DEFAULT "",
            logdeenviarimagens varchar(250) NOT NULL DEFAULT "",
            logdecriacaodeorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarstaff varchar(250) NOT NULL DEFAULT "",
            logdealteracaodelogs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarcidadoes varchar(250) NOT NULL DEFAULT "",
            logdeupamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderebaixamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderemocaodemembros varchar(250) NOT NULL DEFAULT "",
            logdeadicaodemembros varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/grupostaff")
    
        vRP.prepare("skdev_group/criargroups", [[CREATE TABLE IF NOT EXISTS skdev_groups(
            grupo varchar(250) NOT NULL DEFAULT "",
            valores varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criargroups")
    
        vRP.prepare("skdev_group/criarpermissoes", [[CREATE TABLE IF NOT EXISTS skdev_permissoes(
            user_id varchar(250) NOT NULL DEFAULT "",
            imagemlink varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarpermissoes")
    
        vRP.prepare("skdev_group/criarblacklist", [[CREATE TABLE IF NOT EXISTS skdev_blacklist(
            user_id varchar(250) NOT NULL DEFAULT "",
            valor varchar(250) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarblacklist")
    
        vRP.prepare("skdev_group/staffrecebervalor","SELECT * FROM skdev_groupstaff")
        vRP.prepare("skdev_group/staffrecebergrupos","SELECT * FROM skdev_groups")
        vRP.prepare("skdev_group/staffrecebergrupoinfosselecionado","SELECT * FROM skdev_groups WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/staffinserirpadrao","INSERT INTO skdev_groupstaff (nomedogrupo) VALUES ('Administração')")
        vRP.prepare("skdev_group/inserirorganizacoestaff","INSERT INTO skdev_groups (grupo, valores) VALUES (@grupo,@valores)")
        vRP.prepare("skdev_group/editarorganizacao","UPDATE skdev_groups SET grupo = @nomenovodogrupo, valores = @valoresnovos WHERE grupo = @nomeantigodogrupo")
        vRP.prepare("skdev_group/editarValoresOrg","UPDATE skdev_groups SET valores = @valoresnovos WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/editarStaffLogs","UPDATE skdev_groupstaff SET logdeenviarimagens = @logdeenviarimagens,logdecriacaodeorgs = @logdecriacaodeorgs,logdegerenciarorgs = @logdegerenciarorgs,logdegerenciarstaff = @logdegerenciarstaff,logdealteracaodelogs = @logdealteracaodelogs,logdegerenciarcidadoes = @logdegerenciarcidadoes,logdeupamentodemembros = @logdeupamentodemembros,logderebaixamentodemembros = @logderebaixamentodemembros,logderemocaodemembros = @logderemocaodemembros,logdeadicaodemembros = @logdeadicaodemembros")
        vRP.prepare("skdev_group/editarStaffPersonalidade","UPDATE skdev_groupstaff SET nomedogrupo = @nomenovostaff, imagemdogrupo = @imagemdogrupo, cargos = @cargos")
    
        vRP.prepare("skdev_group/blacklistall","SELECT * FROM skdev_blacklist")
        vRP.prepare("skdev_group/insertblacklist","INSERT INTO skdev_blacklist (user_id,valor) VALUES (@user_id,@valor)")
        vRP.prepare("skdev_group/updateblacklist","UPDATE skdev_blacklist SET valor = @valor WHERE user_id = @user_id")
        vRP.prepare("skdev_group/organizacoesMembrosPermissoes","SELECT * FROM skdev_permissoes")
        vRP.prepare("skdev_group/insertGrupos","INSERT INTO skdev_permissoes (user_id,cargos) VALUES (@user_id,@cargos)")
        vRP.prepare("skdev_group/updateGrupos","UPDATE skdev_permissoes SET cargos = @cargos WHERE user_id = @user_id")
        vRP.prepare("skdev_group/insertImagenPropia","INSERT INTO skdev_permissoes (user_id,imagemlink) VALUES (@user_id,@imagemlink)")
        vRP.prepare("skdev_group/updateImagenPropia","UPDATE skdev_permissoes SET imagemlink = @imagemlink WHERE user_id = @user_id")
    
        vRP.prepare("skdev_group/deleteblacklist","DELETE FROM skdev_blacklist WHERE user_id = @user_id")
        vRP.prepare("skdev_group/deleteGroup","DELETE FROM skdev_groups WHERE grupo = @nomedogrupo")
    
        local queryStaff = vRP.query("skdev_group/staffrecebervalor")
        if #queryStaff == 0 then
            vRP.execute('skdev_group/staffinserirpadrao')
        end
    end
    if baseatual == 'creativev2' then
        vRP.prepare("skdev_group/grupostaff", [[CREATE TABLE IF NOT EXISTS skdev_groupstaff(
            nomedogrupo varchar(250) NOT NULL DEFAULT "",
            imagemdogrupo varchar(250) NOT NULL DEFAULT "",
            logdeenviarimagens varchar(250) NOT NULL DEFAULT "",
            logdecriacaodeorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarstaff varchar(250) NOT NULL DEFAULT "",
            logdealteracaodelogs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarcidadoes varchar(250) NOT NULL DEFAULT "",
            logdeupamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderebaixamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderemocaodemembros varchar(250) NOT NULL DEFAULT "",
            logdeadicaodemembros varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/grupostaff")
    
        vRP.prepare("skdev_group/criargroups", [[CREATE TABLE IF NOT EXISTS skdev_groups(
            grupo varchar(250) NOT NULL DEFAULT "",
            valores varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criargroups")
    
        vRP.prepare("skdev_group/criarpermissoes", [[CREATE TABLE IF NOT EXISTS skdev_permissoes(
            user_id varchar(250) NOT NULL DEFAULT "",
            imagemlink varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarpermissoes")
    
        vRP.prepare("skdev_group/criarblacklist", [[CREATE TABLE IF NOT EXISTS skdev_blacklist(
            user_id varchar(250) NOT NULL DEFAULT "",
            valor varchar(250) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarblacklist")
    
        vRP.prepare("skdev_group/staffrecebervalor","SELECT * FROM skdev_groupstaff")
        vRP.prepare("skdev_group/staffrecebergrupos","SELECT * FROM skdev_groups")
        vRP.prepare("skdev_group/staffrecebergrupoinfosselecionado","SELECT * FROM skdev_groups WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/staffinserirpadrao","INSERT INTO skdev_groupstaff (nomedogrupo) VALUES ('Administração')")
        vRP.prepare("skdev_group/inserirorganizacoestaff","INSERT INTO skdev_groups (grupo, valores) VALUES (@grupo,@valores)")
        vRP.prepare("skdev_group/editarorganizacao","UPDATE skdev_groups SET grupo = @nomenovodogrupo, valores = @valoresnovos WHERE grupo = @nomeantigodogrupo")
        vRP.prepare("skdev_group/editarValoresOrg","UPDATE skdev_groups SET valores = @valoresnovos WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/editarStaffLogs","UPDATE skdev_groupstaff SET logdeenviarimagens = @logdeenviarimagens,logdecriacaodeorgs = @logdecriacaodeorgs,logdegerenciarorgs = @logdegerenciarorgs,logdegerenciarstaff = @logdegerenciarstaff,logdealteracaodelogs = @logdealteracaodelogs,logdegerenciarcidadoes = @logdegerenciarcidadoes,logdeupamentodemembros = @logdeupamentodemembros,logderebaixamentodemembros = @logderebaixamentodemembros,logderemocaodemembros = @logderemocaodemembros,logdeadicaodemembros = @logdeadicaodemembros")
        vRP.prepare("skdev_group/editarStaffPersonalidade","UPDATE skdev_groupstaff SET nomedogrupo = @nomenovostaff, imagemdogrupo = @imagemdogrupo, cargos = @cargos")
    
        vRP.prepare("skdev_group/blacklistall","SELECT * FROM skdev_blacklist")
        vRP.prepare("skdev_group/insertblacklist","INSERT INTO skdev_blacklist (user_id,valor) VALUES (@user_id,@valor)")
        vRP.prepare("skdev_group/updateblacklist","UPDATE skdev_blacklist SET valor = @valor WHERE user_id = @user_id")
        vRP.prepare("skdev_group/organizacoesMembrosPermissoes","SELECT * FROM skdev_permissoes")
        vRP.prepare("skdev_group/insertGrupos","INSERT INTO skdev_permissoes (user_id,cargos) VALUES (@user_id,@cargos)")
        vRP.prepare("skdev_group/updateGrupos","UPDATE skdev_permissoes SET cargos = @cargos WHERE user_id = @user_id")
        vRP.prepare("skdev_group/insertImagenPropia","INSERT INTO skdev_permissoes (user_id,imagemlink) VALUES (@user_id,@imagemlink)")
        vRP.prepare("skdev_group/updateImagenPropia","UPDATE skdev_permissoes SET imagemlink = @imagemlink WHERE user_id = @user_id")
    
        vRP.prepare("skdev_group/deleteblacklist","DELETE FROM skdev_blacklist WHERE user_id = @user_id")
        vRP.prepare("skdev_group/deleteGroup","DELETE FROM skdev_groups WHERE grupo = @nomedogrupo")
    
        local queryStaff = vRP.query("skdev_group/staffrecebervalor")
        if #queryStaff == 0 then
            vRP.execute('skdev_group/staffinserirpadrao')
        end
    end
    if baseatual == 'creativev1' then
        vRP.prepare("skdev_group/grupostaff", [[CREATE TABLE IF NOT EXISTS skdev_groupstaff(
            nomedogrupo varchar(250) NOT NULL DEFAULT "",
            imagemdogrupo varchar(250) NOT NULL DEFAULT "",
            logdeenviarimagens varchar(250) NOT NULL DEFAULT "",
            logdecriacaodeorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarstaff varchar(250) NOT NULL DEFAULT "",
            logdealteracaodelogs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarcidadoes varchar(250) NOT NULL DEFAULT "",
            logdeupamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderebaixamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderemocaodemembros varchar(250) NOT NULL DEFAULT "",
            logdeadicaodemembros varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/grupostaff")
    
        vRP.prepare("skdev_group/criargroups", [[CREATE TABLE IF NOT EXISTS skdev_groups(
            grupo varchar(250) NOT NULL DEFAULT "",
            valores varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criargroups")
    
        vRP.prepare("skdev_group/criarpermissoes", [[CREATE TABLE IF NOT EXISTS skdev_permissoes(
            user_id varchar(250) NOT NULL DEFAULT "",
            imagemlink varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarpermissoes")
    
        vRP.prepare("skdev_group/criarblacklist", [[CREATE TABLE IF NOT EXISTS skdev_blacklist(
            user_id varchar(250) NOT NULL DEFAULT "",
            valor varchar(250) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarblacklist")
    
        vRP.prepare("skdev_group/staffrecebervalor","SELECT * FROM skdev_groupstaff")
        vRP.prepare("skdev_group/staffrecebergrupos","SELECT * FROM skdev_groups")
        vRP.prepare("skdev_group/staffrecebergrupoinfosselecionado","SELECT * FROM skdev_groups WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/staffinserirpadrao","INSERT INTO skdev_groupstaff (nomedogrupo) VALUES ('Administração')")
        vRP.prepare("skdev_group/inserirorganizacoestaff","INSERT INTO skdev_groups (grupo, valores) VALUES (@grupo,@valores)")
        vRP.prepare("skdev_group/editarorganizacao","UPDATE skdev_groups SET grupo = @nomenovodogrupo, valores = @valoresnovos WHERE grupo = @nomeantigodogrupo")
        vRP.prepare("skdev_group/editarValoresOrg","UPDATE skdev_groups SET valores = @valoresnovos WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/editarStaffLogs","UPDATE skdev_groupstaff SET logdeenviarimagens = @logdeenviarimagens,logdecriacaodeorgs = @logdecriacaodeorgs,logdegerenciarorgs = @logdegerenciarorgs,logdegerenciarstaff = @logdegerenciarstaff,logdealteracaodelogs = @logdealteracaodelogs,logdegerenciarcidadoes = @logdegerenciarcidadoes,logdeupamentodemembros = @logdeupamentodemembros,logderebaixamentodemembros = @logderebaixamentodemembros,logderemocaodemembros = @logderemocaodemembros,logdeadicaodemembros = @logdeadicaodemembros")
        vRP.prepare("skdev_group/editarStaffPersonalidade","UPDATE skdev_groupstaff SET nomedogrupo = @nomenovostaff, imagemdogrupo = @imagemdogrupo, cargos = @cargos")
    
        vRP.prepare("skdev_group/blacklistall","SELECT * FROM skdev_blacklist")
        vRP.prepare("skdev_group/insertblacklist","INSERT INTO skdev_blacklist (user_id,valor) VALUES (@user_id,@valor)")
        vRP.prepare("skdev_group/updateblacklist","UPDATE skdev_blacklist SET valor = @valor WHERE user_id = @user_id")
        vRP.prepare("skdev_group/organizacoesMembrosPermissoes","SELECT * FROM skdev_permissoes")
        vRP.prepare("skdev_group/insertGrupos","INSERT INTO skdev_permissoes (user_id,cargos) VALUES (@user_id,@cargos)")
        vRP.prepare("skdev_group/updateGrupos","UPDATE skdev_permissoes SET cargos = @cargos WHERE user_id = @user_id")
        vRP.prepare("skdev_group/insertImagenPropia","INSERT INTO skdev_permissoes (user_id,imagemlink) VALUES (@user_id,@imagemlink)")
        vRP.prepare("skdev_group/updateImagenPropia","UPDATE skdev_permissoes SET imagemlink = @imagemlink WHERE user_id = @user_id")
    
        vRP.prepare("skdev_group/deleteblacklist","DELETE FROM skdev_blacklist WHERE user_id = @user_id")
        vRP.prepare("skdev_group/deleteGroup","DELETE FROM skdev_groups WHERE grupo = @nomedogrupo")
    
        local queryStaff = vRP.query("skdev_group/staffrecebervalor")
        if #queryStaff == 0 then
            vRP.execute('skdev_group/staffinserirpadrao')
        end
    end
    if baseatual == 'vrpex' then
        vRP.prepare("skdev_group/grupostaff", [[CREATE TABLE IF NOT EXISTS skdev_groupstaff(
            nomedogrupo varchar(250) NOT NULL DEFAULT "",
            imagemdogrupo varchar(250) NOT NULL DEFAULT "",
            logdeenviarimagens varchar(250) NOT NULL DEFAULT "",
            logdecriacaodeorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarorgs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarstaff varchar(250) NOT NULL DEFAULT "",
            logdealteracaodelogs varchar(250) NOT NULL DEFAULT "",
            logdegerenciarcidadoes varchar(250) NOT NULL DEFAULT "",
            logdeupamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderebaixamentodemembros varchar(250) NOT NULL DEFAULT "",
            logderemocaodemembros varchar(250) NOT NULL DEFAULT "",
            logdeadicaodemembros varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/grupostaff")
    
        vRP.prepare("skdev_group/criargroups", [[CREATE TABLE IF NOT EXISTS skdev_groups(
            grupo varchar(250) NOT NULL DEFAULT "",
            valores varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criargroups")
    
        vRP.prepare("skdev_group/criarpermissoes", [[CREATE TABLE IF NOT EXISTS skdev_permissoes(
            user_id varchar(250) NOT NULL DEFAULT "",
            imagemlink varchar(250) NOT NULL DEFAULT "",
            cargos varchar(10000) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarpermissoes")
    
        vRP.prepare("skdev_group/criarblacklist", [[CREATE TABLE IF NOT EXISTS skdev_blacklist(
            user_id varchar(250) NOT NULL DEFAULT "",
            valor varchar(250) NOT NULL DEFAULT ""
        )]])
        vRP.execute("skdev_group/criarblacklist")
    
        vRP.prepare("skdev_group/staffrecebervalor","SELECT * FROM skdev_groupstaff")
        vRP.prepare("skdev_group/staffrecebergrupos","SELECT * FROM skdev_groups")
        vRP.prepare("skdev_group/staffrecebergrupoinfosselecionado","SELECT * FROM skdev_groups WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/staffinserirpadrao","INSERT INTO skdev_groupstaff (nomedogrupo) VALUES ('Administração')")
        vRP.prepare("skdev_group/inserirorganizacoestaff","INSERT INTO skdev_groups (grupo, valores) VALUES (@grupo,@valores)")
        vRP.prepare("skdev_group/editarorganizacao","UPDATE skdev_groups SET grupo = @nomenovodogrupo, valores = @valoresnovos WHERE grupo = @nomeantigodogrupo")
        vRP.prepare("skdev_group/editarValoresOrg","UPDATE skdev_groups SET valores = @valoresnovos WHERE grupo = @nomedogrupo")
        vRP.prepare("skdev_group/editarStaffLogs","UPDATE skdev_groupstaff SET logdeenviarimagens = @logdeenviarimagens,logdecriacaodeorgs = @logdecriacaodeorgs,logdegerenciarorgs = @logdegerenciarorgs,logdegerenciarstaff = @logdegerenciarstaff,logdealteracaodelogs = @logdealteracaodelogs,logdegerenciarcidadoes = @logdegerenciarcidadoes,logdeupamentodemembros = @logdeupamentodemembros,logderebaixamentodemembros = @logderebaixamentodemembros,logderemocaodemembros = @logderemocaodemembros,logdeadicaodemembros = @logdeadicaodemembros")
        vRP.prepare("skdev_group/editarStaffPersonalidade","UPDATE skdev_groupstaff SET nomedogrupo = @nomenovostaff, imagemdogrupo = @imagemdogrupo, cargos = @cargos")
    
        vRP.prepare("skdev_group/blacklistall","SELECT * FROM skdev_blacklist")
        vRP.prepare("skdev_group/insertblacklist","INSERT INTO skdev_blacklist (user_id,valor) VALUES (@user_id,@valor)")
        vRP.prepare("skdev_group/updateblacklist","UPDATE skdev_blacklist SET valor = @valor WHERE user_id = @user_id")
        vRP.prepare("skdev_group/organizacoesMembrosPermissoes","SELECT * FROM skdev_permissoes")
        vRP.prepare("skdev_group/insertGrupos","INSERT INTO skdev_permissoes (user_id,cargos) VALUES (@user_id,@cargos)")
        vRP.prepare("skdev_group/updateGrupos","UPDATE skdev_permissoes SET cargos = @cargos WHERE user_id = @user_id")
        vRP.prepare("skdev_group/insertImagenPropia","INSERT INTO skdev_permissoes (user_id,imagemlink) VALUES (@user_id,@imagemlink)")
        vRP.prepare("skdev_group/updateImagenPropia","UPDATE skdev_permissoes SET imagemlink = @imagemlink WHERE user_id = @user_id")
        vRP.prepare("skdev_group/obterUserData","SELECT * FROM vrp_user_data")
        vRP.prepare("skdev_group/updateUserData","UPDATE vrp_user_data SET dvalue = @dvalue WHERE user_id = @user_id AND dkey = 'vRP:datatable'")
    
        vRP.prepare("skdev_group/deleteblacklist","DELETE FROM skdev_blacklist WHERE user_id = @user_id")
        vRP.prepare("skdev_group/deleteGroup","DELETE FROM skdev_groups WHERE grupo = @nomedogrupo")
    
        local queryStaff = vRP.query("skdev_group/staffrecebervalor")
        if #queryStaff == 0 then
            vRP.execute('skdev_group/staffinserirpadrao')
        end
    end
end)

--
-- | Parte de functions
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

function subStrFind(str1, str2)
    if str1 ~= nil then
        str1 = str1:lower()
        str2 = str2:lower()
        if string.find(str1, str2) then
            return true
        else
            return false
        end
    end
end

function verificarPermissaoStaff(user_id)
    if baseatual == 'creativev6' then
        if vRP.HasPermission(user_id,cargoadministrador,false) then
            return true
        end
    end
    if baseatual == 'creativev5' then
        if vRP.hasPermission(user_id,cargoadministrador) then
            return true
        end
    end
    if baseatual == 'creativev4' then
        if vRP.hasPermission(user_id,cargoadministrador) then
            return true
        end
    end
    if baseatual == 'creativev3' then
        if vRP.hasPermission(user_id,cargoadministrador) then
            return true
        end
    end
    if baseatual == 'creativev2' then
        if vRP.hasPermission(user_id,cargoadministrador) then
            return true
        end
    end
    if baseatual == 'creativev1' then
        if vRP.hasPermission(user_id,cargoadministrador) then
            return true
        end
    end
    if baseatual == 'vrpex' then
        if vRP.hasPermission(user_id,cargoadministrador) then
            return true
        end
    end

    local queryPerms = {}
    if baseatual == 'creativev6' then
        queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local permDisponivel = #queryPerms > 0
    local queryStaff = {}
    if baseatual == 'creativev6' then
        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
    else
        queryStaff = vRP.query("skdev_group/staffrecebervalor")
    end
    local staffDisponivel = #queryStaff > 0
    if permDisponivel then
        for posicao,tabela in pairs(queryPerms) do
            local idusuarios = parseInt(tabela.user_id)
            local grupousuarios = json.decode(tabela.cargos)
            
            if idusuarios == user_id then
                if grupousuarios ~= nil then
                    for posicao,nomedogrupo in pairs(grupousuarios) do
                        if staffDisponivel then
                            for posicao,tabela in pairs(queryStaff) do
                                local cargosConfigurados = json.decode(tabela.cargos)
                                if cargosConfigurados ~= nil then
                                    for posicao,posicao2 in pairs(cargosConfigurados) do
                                        for nomedocargo,tabeladocargo in pairs(posicao2) do
                                            local nomedocargoingame = tabeladocargo.cargoingame[1]
        
                                            if nomedocargoingame == nomedogrupo then
                                                return true
                                            end
                                        end
                                    end
                                else
                                    return false
                                end
                            end
                        else
                            return false
                        end
                    end
                end
            end
        end
    else
        return false
    end

    return false
end

function skdevs.VerificarPermissaodeStaff()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    return verificarPermissaoStaff(user_id)
end

function skdevs.VerificarInformacoesPlayerLocalStaff()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local identidade = ''
    local nomedoplayer = ''
    local nomedoplayer2 = ''
    if baseatual == 'creativev6' then
        identidade = vRP.Identity(user_id)
        nomedoplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomedoplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev5' then
        identidade = vRP.userIdentity(user_id)
        nomedoplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomedoplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev4' then
        identidade = vRP.userIdentity(user_id)
        nomedoplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomedoplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev3' then
        identidade = vRP.userIdentity(user_id)
        nomedoplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomedoplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev2' then
        identidade = vRP.getUserIdentity(user_id)
        nomedoplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomedoplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev1' then
        identidade = vRP.userIdentity(user_id)
        nomedoplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomedoplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'vrpex' then
        identidade = vRP.getUserIdentity(user_id)
        nomedoplayer = identidade.name..' '..identidade.firstname..' #'..user_id
        nomedoplayer2 = identidade.name..' '..identidade.firstname
    end

    local nomeorganizacao = nil
    local nomedocargodoplayer = nil
    local _,quantidadedeajudantesonline,_,_ = nil
    local quantidadetotaldeorgs = nil
    local imagemplayer = nil
    local ultimalogstaff1 = logadmtabela[1]
    local ultimalogstaff2 = logadmtabela[2]
    local ultimalogstaff3 = logadmtabela[3]

    local staff = {}
    if baseatual == 'creativev6' then
        staff = vRP.Query('skdev_group/staffrecebervalor')
    else
        staff = vRP.query('skdev_group/staffrecebervalor')
    end

    local grupos = {}
    if baseatual == 'creativev6' then
        grupos = vRP.Query('skdev_group/staffrecebergrupos')
    else
        grupos = vRP.query('skdev_group/staffrecebergrupos')
    end

    if #staff == 0 then
        nomeorganizacao = 'Administração'
        nomedocargodoplayer = 'Staff'
        _,quantidadedeajudantesonline,_,_ = 0
        quantidadetotaldeorgs = #grupos
        imagemplayer = nil
        ultimalogstaff1 = logadmtabela[1]
        ultimalogstaff2 = logadmtabela[2]
        ultimalogstaff3 = logadmtabela[3]
    else
        if #staff[1].nomedogrupo > 0 then
            nomeorganizacao = staff[1].nomedogrupo
        else
            nomeorganizacao = 'Administração'
        end
        _,_,nomedocargodoplayer,_,_,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
        _,quantidadedeajudantesonline,_,_ = InformacoesMembrosdaStaff()
        quantidadetotaldeorgs = #grupos
        imagemplayer = nil
        ultimalogstaff1 = logadmtabela[1]
        ultimalogstaff2 = logadmtabela[2]
        ultimalogstaff3 = logadmtabela[3]
    end

    local queryPerms = {}
    if baseatual == 'creativev6' then
        queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end

    local permDisponivel = #queryPerms > 0
    if permDisponivel then
        for posicao,tabela in pairs(queryPerms) do
            local idusuarios = parseInt(tabela.user_id)

            if idusuarios == user_id then
                imagemplayer = tabela.imagemlink
            end
        end
    end

    return nomedoplayer2,nomedoplayer,nomeorganizacao,nomedocargodoplayer,quantidadedeajudantesonline,quantidadetotaldeorgs,imagemplayer,ultimalogstaff1,ultimalogstaff2,ultimalogstaff3
end

function skdevs.CriarOrganizacaoStaff(nomedaorganizacao, imagemdaorganizacao, maximodemembrosorganizacao, logsgeraisorganizacao, blackliststatus, blacklisthoras, permissoes)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    if skdevs.verificarPermissaoStaff(user_id,'Criar Organizações') then
        local valoresorganizacao = {}
        if blackliststatus then
            valoresorganizacao = {['imagemorg'] = imagemdaorganizacao, ['maximomembrosorg'] = maximodemembrosorganizacao, ['loggeral'] = logsgeraisorganizacao, ['blackliststatus'] = true, ['horasdablacklistorg'] = blacklisthoras, ['gruposorganizacao'] = permissoes, ['loggeral'] = '', ['logmembrosupados'] = '', ['logmembrosrebaixados'] = '', ['logmembrosexpulsos'] = '', ['logmembrosadicionados'] = '', ['logedicaodaorganizacao'] = '',['logalteracaodelog'] = ''}
        else
            valoresorganizacao = {['imagemorg'] = imagemdaorganizacao, ['maximomembrosorg'] = maximodemembrosorganizacao, ['loggeral'] = logsgeraisorganizacao, ['blackliststatus'] = false, ['horasdablacklistorg'] = 0, ['gruposorganizacao'] = permissoes, ['loggeral'] = '', ['logmembrosupados'] = '', ['logmembrosrebaixados'] = '', ['logmembrosexpulsos'] = '', ['logmembrosadicionados'] = '', ['logedicaodaorganizacao'] = '',['logalteracaodelog'] = ''}
        end
        local organizacao = json.encode(valoresorganizacao)

        local staff = {}
        if baseatual == 'creativev6' then
            staff = vRP.Query('skdev_group/staffrecebervalor')
        else
            staff = vRP.query('skdev_group/staffrecebervalor')
        end
        if #staff > 0 then
            SendWebhookMessage(staff[1].logdecriacaodeorgs,"```prolog\nNova Organizacao Criada!!!\n\n[ID]: "..user_id.." CRIOU A ORGANIZACAO: "..nomedaorganizacao.."```")
        end
        enviarLogNoPainelAdm("[ID]: "..user_id.." CRIOU A ORGANIZACAO: "..nomedaorganizacao.." ")

        if baseatual == 'creativev6' then
            vRP.Query("skdev_group/inserirorganizacoestaff",{grupo = nomedaorganizacao, valores = organizacao})
        else
            vRP.execute("skdev_group/inserirorganizacoestaff",{grupo = nomedaorganizacao, valores = organizacao})
        end
    end
end

function skdevs.obterWebhookImagemStaff()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local logstaffimagem = false
    local staff = {}
    if baseatual == 'creativev6' then
        staff = vRP.Query('skdev_group/staffrecebervalor')
    else
        staff = vRP.query('skdev_group/staffrecebervalor')
    end
    if #staff == 0 then
        logstaffimagem = false
    else
        if #staff[1].logdeenviarimagens > 0 then
            logstaffimagem = staff[1].logdeenviarimagens
        else
            logstaffimagem = false
        end
    end

    return logstaffimagem
end

function skdevs.ListaOrganizacoesStaff()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local tabelaorgs = {}

    local queryOrgs = {}
    if baseatual == 'creativev6' then
        queryOrgs = vRP.Query("skdev_group/staffrecebergrupos")
    else
        queryOrgs = vRP.query("skdev_group/staffrecebergrupos")
    end
    if #queryOrgs > 0 then
        local organizacoes = queryOrgs
        for k,v in pairs(organizacoes) do
            local valores2 = json.decode(v.valores)
            if valores2 ~= nil then
                tabelaorgs[#tabelaorgs+1] = {nomegrupo = v.grupo, maximodemembros = valores2.maximomembrosorg, blackliststatus = valores2.blackliststatus, blacklisthoras = valores2.horasdablacklistorg, cargosorganizacao = valores2.gruposorganizacao}
            end
        end

        return tabelaorgs
    else
        return false
    end
end

function skdevs.OrganizacoesGerenciar()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local tabelaorgs = {}

    local queryOrgs = {}
    if baseatual == 'creativev6' then
        queryOrgs = vRP.Query("skdev_group/staffrecebergrupos")
    else
        queryOrgs = vRP.query("skdev_group/staffrecebergrupos")
    end
    if #queryOrgs > 0 then
        local organizacoes = queryOrgs
        for k,v in pairs(organizacoes) do
            local valores2 = json.decode(v.valores)
            if valores2 ~= nil then
                tabelaorgs[#tabelaorgs+1] = {nomedogrupo = v.grupo, imagemdogrupo = valores2.imagemorg}
            end
        end

        return tabelaorgs
    else
        return false
    end
end

function InformacoesMembros(organizacaonome)
    local queryMembros = {}
    if baseatual == 'creativev6' then
        queryMembros = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryMembros = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end

    local totaldemembros = 0
    local membrosonline = 0
    local membrosoffline = 0
    local tabelamembros = {}

    if #queryMembros > 0 then
        for k,v in pairs(queryMembros) do
            local org = json.decode(v.cargos)
            if org ~= nil and #org > 0 then
                for p,o in pairs(org) do
                    local nomegrupoingame = o
    
                    local queryGrupos = {}
                    if baseatual == 'creativev6' then
                        queryGrupos = vRP.Query("skdev_group/staffrecebergrupos")
                    else
                        queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                    end
                    for b,c in pairs(queryGrupos) do
                        if c.grupo == organizacaonome then
                            local orgvalores = json.decode(c.valores)
                            if orgvalores ~= nil then
                                local orggrupos = orgvalores.gruposorganizacao
                                for x,y in pairs(orggrupos) do
                                    for l,m in pairs(y) do
                                        local nomedocargo = l
                                        local infcargo = m
                                        local cargoingame = infcargo.cargoingame[1]

                                        if baseatual ~= 'creativev6' then
                                            if nomegrupoingame == cargoingame then
                                                totaldemembros = totaldemembros+1
    
                                                if vRP.getUserSource(v.user_id) then
                                                    membrosonline = membrosonline+1
                                                else
                                                    membrosoffline = membrosoffline+1
                                                end

                                                if baseatual == 'creativev5' then
                                                    local identidadePlayer = vRP.userIdentity(v.user_id)
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = cargoingame}
                                                end
                                                if baseatual == 'creativev4' then
                                                    local identidadePlayer = vRP.userIdentity(v.user_id)
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = cargoingame}
                                                end
                                                if baseatual == 'creativev3' then
                                                    local identidadePlayer = vRP.userIdentity(v.user_id)
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = cargoingame}
                                                end
                                                if baseatual == 'creativev2' then
                                                    local identidadePlayer = vRP.getUserIdentity(v.user_id)
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = cargoingame}
                                                end
                                                if baseatual == 'creativev1' then
                                                    local identidadePlayer = vRP.userIdentity(v.user_id)
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = cargoingame}
                                                end
                                                if baseatual == 'vrpex' then
                                                    local identidadePlayer = vRP.getUserIdentity(v.user_id)
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.firstname, cargodomembro = cargoingame}
                                                end
                                            end
                                        else
                                            if subStrFind(nomegrupoingame,cargoingame) then
                                                totaldemembros = totaldemembros+1
    
                                                if vRP.Source(v.user_id) then
                                                    membrosonline = membrosonline+1
                                                else
                                                    membrosoffline = membrosoffline+1
                                                end
    
                                                local identidadePlayer = vRP.Identity(v.user_id)
                                                tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = cargoingame}
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        return totaldemembros,membrosonline,membrosoffline,tabelamembros
    else
        return 0,0,0
    end
end

function skdevs.OrganizacaoInformacoesVisualizar(nomedaorganizacao)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local imagemOrg = false
    local totaldemembros,_,_,_ = false
    local _,membrosonline,_,_ = false
    local _,_,membrosoffline,_ = false
    local cargos = false
    local _,_,_,membros = false

    local queryOrgs = {}
    if baseatual == 'creativev6' then
        queryOrgs = vRP.Query("skdev_group/staffrecebergrupos")
    else
        queryOrgs = vRP.query("skdev_group/staffrecebergrupos")
    end
    if #queryOrgs > 0 then
        local organizacoes = queryOrgs
        for k,v in pairs(organizacoes) do
            if v.grupo == nomedaorganizacao then
                local valores2 = json.decode(v.valores)
                if valores2 ~= nil then
                    imagemOrg = valores2.imagemorg
                    totaldemembros,_,_,_ = InformacoesMembros(nomedaorganizacao)
                    _,membrosonline,_,_ = InformacoesMembros(nomedaorganizacao)
                    _,_,membrosoffline,_ = InformacoesMembros(nomedaorganizacao)
                    cargos = valores2.gruposorganizacao
                    _,_,_,membros = InformacoesMembros(nomedaorganizacao)
                end
            end
        end

        return imagemOrg,totaldemembros,membrosonline,membrosoffline,cargos,membros
    else
        return false
    end
end

function skdevs.OrganizacaoInformacoesEditar(nomedaorg)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local tabelorg = {}

    local queryOrgs = {}
    if baseatual == 'creativev6' then
        queryOrgs = vRP.Query("skdev_group/staffrecebergrupos")
    else
        queryOrgs = vRP.query("skdev_group/staffrecebergrupos")
    end
    if #queryOrgs > 0 then
        local organizacoes = queryOrgs
        for k,v in pairs(organizacoes) do
            if v.grupo == nomedaorg then
                local valores2 = json.decode(v.valores)
                if valores2 ~= nil then
                    local cargos = valores2.gruposorganizacao
                    tabelorg = {nomegrupo = v.grupo, maximodemembros = valores2.maximomembrosorg, logsgerais = valores2.loggeral, blacklisthoras = valores2.horasdablacklistorg, cargosorganizacao = cargos, blackliststatus = valores2.blackliststatus, cargoinvisivelstatus = valores2.cargoinvisivelstatus}
                end

                return tabelorg
            end
        end
    else
        return false
    end
end

function skdevs.EditarInformacoesDaOrganizacao(nomeantigo, nomedaorganizacao, imagemdaorganizacao, maximodemembrosorganizacao, logsgeraisorganizacao, blackliststatus, blacklisthoras, permissoes)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    if skdevs.verificarPermissaoStaff(user_id,'Gerenciar Organicações') then
        local queryOrgs = {}
        if baseatual == 'creativev6' then
            queryOrgs = vRP.Query("skdev_group/staffrecebergrupos")
        else
            queryOrgs = vRP.query("skdev_group/staffrecebergrupos")
        end
        if #queryOrgs > 0 then
            local queryOrganizacao = {}
            if baseatual == 'creativev6' then
                queryOrganizacao = vRP.Query("skdev_group/staffrecebergrupoinfosselecionado",{nomedogrupo = nomeantigo})
            else
                queryOrganizacao = vRP.query("skdev_group/staffrecebergrupoinfosselecionado",{nomedogrupo = nomeantigo})
            end
            local OrganizacaoValores = json.decode(queryOrganizacao[1].valores)
            if OrganizacaoValores ~= nil then
                local valoresnovoorganizacao = {loggeral = OrganizacaoValores.loggeral,logmembrosadicionados = OrganizacaoValores.logmembrosadicionados,logmembrosrebaixados = OrganizacaoValores.logmembrosrebaixados,logmembrosupados = OrganizacaoValores.logmembrosupados,logmembrosexpulsos = OrganizacaoValores.logmembrosexpulsos,logedicaodaorganizacao = OrganizacaoValores.logedicaodaorganizacao,logalteracaodelog = OrganizacaoValores.logalteracaodelog,horasdablacklistorg = blacklisthoras,imagemorg = imagemdaorganizacao,blackliststatus = blackliststatus,maximomembrosorg = maximodemembrosorganizacao,gruposorganizacao = permissoes}
                local organizacao = json.encode(valoresnovoorganizacao)

                local staff = {}
                if baseatual == 'creativev6' then
                    staff = vRP.Query('skdev_group/staffrecebervalor')
                else
                    staff = vRP.query('skdev_group/staffrecebervalor')
                end
                if #staff > 0 then
                    SendWebhookMessage(staff[1].logdegerenciarorgs,"```prolog\nOrganização Editada!!!\n\n[ID]: "..user_id.." EDITOU A ORGANIZACAO: "..nomeantigo.." NOVO NOME: "..nomedaorganizacao.."```")
                end
                enviarLogNoPainelAdm("[ID]: "..user_id.." EDITOU A ORGANIZACAO: "..nomeantigo.." NOVO NOME: "..nomedaorganizacao.."")
    
                if baseatual == 'creativev6' then
                    vRP.Query("skdev_group/editarorganizacao",{nomeantigodogrupo = nomeantigo, nomenovodogrupo = nomedaorganizacao, valoresnovos = organizacao})
                else
                    vRP.execute("skdev_group/editarorganizacao",{nomeantigodogrupo = nomeantigo, nomenovodogrupo = nomedaorganizacao, valoresnovos = organizacao})
                end
            end
        end
    end
end

function InformacoesMembrosdaStaff()
    local queryMembros = {}
    if baseatual == 'creativev6' then
        queryMembros = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryMembros = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end

    local totaldemembros = 0
    local membrosonline = 0
    local membrosoffline = 0
    local tabelamembros = {}

    if #queryMembros > 0 then
        for k,v in pairs(queryMembros) do
            local org = json.decode(v.cargos)
            if org ~= nil then
                for p,o in pairs(org) do
                    local nomegrupoingame = o
    
                    local queryGrupos = {}
                    if baseatual == 'creativev6' then
                        queryGrupos = vRP.Query("skdev_group/staffrecebervalor")
                    else
                        queryGrupos = vRP.query("skdev_group/staffrecebervalor")
                    end
                    local orgvalores = json.decode(queryGrupos[1].cargos)
                    local cargosdisponiveis = #queryGrupos[1].cargos > 0

                    if cargosdisponiveis then
                        if orgvalores ~= nil then
                            for x,y in pairs(orgvalores) do
                                for l,m in pairs(y) do
                                    local nomedocargo = l
                                    local infcargo = m
                                    local cargoingame = m.cargoingame[1]
    
                                    if nomegrupoingame == cargoingame then
                                        if not m.cargoinvisivelstatus then
                                            totaldemembros = totaldemembros+1

                                            if baseatual == 'creativev6' then
                                                if vRP.Source(v.user_id) then
                                                    membrosonline = membrosonline+1
                                                else
                                                    membrosoffline = membrosoffline+1
                                                end
                                            else
                                                if vRP.getUserSource(v.user_id) then
                                                    membrosonline = membrosonline+1
                                                else
                                                    membrosoffline = membrosoffline+1
                                                end
                                            end
    
                                            if baseatual == 'creativev6' then
                                                local identidadePlayer = vRP.Identity(v.user_id)
                                                if vRP.Source(parseInt(v.user_id)) then
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'online'}
                                                else
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'offline'}
                                                end
                                            end
                                            if baseatual == 'creativev5' then
                                                local identidadePlayer = vRP.userIdentity(v.user_id)
                                                if vRP.getUserSource(parseInt(v.user_id)) then
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'online'}
                                                else
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'offline'}
                                                end
                                            end
                                            if baseatual == 'creativev4' then
                                                local identidadePlayer = vRP.userIdentity(v.user_id)
                                                if vRP.getUserSource(parseInt(v.user_id)) then
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'online'}
                                                else
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'offline'}
                                                end
                                            end
                                            if baseatual == 'creativev3' then
                                                local identidadePlayer = vRP.userIdentity(v.user_id)
                                                if vRP.getUserSource(parseInt(v.user_id)) then
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'online'}
                                                else
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'offline'}
                                                end
                                            end
                                            if baseatual == 'creativev2' then
                                                local identidadePlayer = vRP.getUserIdentity(v.user_id)
                                                if vRP.getUserSource(parseInt(v.user_id)) then
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'online'}
                                                else
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'offline'}
                                                end
                                            end
                                            if baseatual == 'creativev1' then
                                                local identidadePlayer = vRP.userIdentity(v.user_id)
                                                if vRP.getUserSource(parseInt(v.user_id)) then
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'online'}
                                                else
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.name2, cargodomembro = nomedocargo, status = 'offline'}
                                                end
                                            end
                                            if baseatual == 'vrpex' then
                                                local identidadePlayer = vRP.getUserIdentity(v.user_id)
                                                if vRP.getUserSource(parseInt(v.user_id)) then
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.firstname, cargodomembro = nomedocargo, status = 'online'}
                                                else
                                                    tabelamembros[#tabelamembros+1] = {iddomembro = v.user_id, nomedomembro = identidadePlayer.name..' '..identidadePlayer.firstname, cargodomembro = nomedocargo, status = 'offline'}
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        return totaldemembros,membrosonline,membrosoffline,tabelamembros
    end
    return 0,0,0
end

function skdevs.staffreceberInformacoes()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local queryStaff = {}
    if baseatual == 'creativev6' then
        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
    else
        queryStaff = vRP.query("skdev_group/staffrecebervalor")
    end
    if #queryStaff > 0 then
        local staff = queryStaff[1]

        local imagemorgstaff = staff.imagemdogrupo
        local nomeorgstaff = staff.nomedogrupo
        local membrostotaisstaff,_,_,_ = InformacoesMembrosdaStaff()
        local _,membrosonlinestaff,_,_ = InformacoesMembrosdaStaff()
        local _,_,membrosofflinestaff,_ = InformacoesMembrosdaStaff()
        local _,_,_,membrosorgpropia = InformacoesMembrosdaStaff()

        return imagemorgstaff,nomeorgstaff,membrostotaisstaff,membrosonlinestaff,membrosofflinestaff,membrosorgpropia
    else
        return false
    end
end

function skdevs.staffEditarInformacoes()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local queryStaff = {}
    if baseatual == 'creativev6' then
        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
    else
        queryStaff = vRP.query("skdev_group/staffrecebervalor")
    end
    if #queryStaff > 0 then
        local staff = queryStaff[1]
        local cargos = json.decode(staff.cargos)
        local organizacao = {nomegrupo = staff.nomedogrupo, cargosorganizacao = cargos, imagemstaff = staff.imagemdogrupo}
        return organizacao
    else
        return false
    end
end

function skdevs.editarStaffConfiguracoes(nomenovostaff,nomeantigostaff,imagemstaff,organizacaogrupo)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    if skdevs.verificarPermissaoStaff(user_id,'Gerenciar Staff') then
        local grupos = json.encode(organizacaogrupo)

        local staff = {}
        if baseatual == 'creativev6' then
            staff = vRP.Query('skdev_group/staffrecebervalor')
        else
            staff = vRP.query('skdev_group/staffrecebervalor')
        end
        if #staff > 0 then
            SendWebhookMessage(staff[1].logdegerenciarstaff,"```prolog\nPainel Staff Editado!!!\n\n[ID]: "..user_id.." EDITOU A STAFF NOME ANTIGO: "..nomeantigostaff.." NOME NOVO: "..nomenovostaff.."```")
        end
        enviarLogNoPainelAdm("[ID]: "..user_id.." EDITOU A STAFF NOME ANTIGO: "..nomeantigostaff.." NOME NOVO: "..nomenovostaff.."")

        if baseatual == 'creativev6' then
            vRP.Query("skdev_group/editarStaffPersonalidade",{nomenovostaff = nomenovostaff, imagemdogrupo = imagemstaff, cargos = grupos})
        else
            vRP.execute("skdev_group/editarStaffPersonalidade",{nomenovostaff = nomenovostaff, imagemdogrupo = imagemstaff, cargos = grupos})
        end
    end
end

function skdevs.getBlacklist(iddomembro)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local queryBlacklist = {}
    if baseatual == 'creativev6' then
        queryBlacklist = vRP.Query("skdev_group/blacklistall")
    else
        queryBlacklist = vRP.query("skdev_group/blacklistall")
    end
    if #queryBlacklist > 0 then
        for k,v in pairs(queryBlacklist) do
            local id = parseInt(v.user_id)
            local idusuario = parseInt(iddomembro)
            local valorbl = v.valor

            if id == idusuario then
                if #valorbl == 0 then
                    return true
                else
                    if #valorbl == 19 then
                        local data1_a = tostring(valorbl)
                        local data2_a = tostring(os.date("%X %d/%m/%Y"))
        
                        local horas1,minutos1,segundos1,dia1,mes1,ano1 = tonumber(string.sub(data1_a, 1, 2)),tonumber(string.sub(data1_a, 4, 5)),tonumber(string.sub(data1_a, 7, 8)),tonumber(string.sub(data1_a, 10, 11)),string.format("%02d", tonumber(string.sub(data1_a, 13, 14))),tonumber(string.sub(data1_a, 16, 19))
                        local horas2,minutos2,segundos2,dia2,mes2,ano2 = tonumber(string.sub(data2_a, 1, 2)),tonumber(string.sub(data2_a, 4, 5)),tonumber(string.sub(data2_a, 7, 8)),tonumber(string.sub(data2_a, 10, 11)),string.format("%02d", tonumber(string.sub(data2_a, 13, 14))),tonumber(string.sub(data2_a, 16, 19))
        
                        if (horas2 == horas1 and minutos2 == minutos1 and dia2 == dia1 and mes2 == mes1 and ano2 == ano1) or (horas2 > horas1 and dia2 >= dia1 and mes2 >= mes1 and ano2 >= ano1) or (minutos2 > minutos1 and horas2 >= horas1 and dia2 >= dia1 and mes2 >= mes1 and ano2 >= ano1) or (dia2 > dia1 and mes2 >= mes1 and ano2 >= ano1) or (mes2 > mes1 and ano2 >= ano1) or (ano2 > ano1) then
                            return true
                        else
                            return false
                        end
                    else
                        return true
                    end
                end
            end
        end
    else
        return true
    end

    return true
end

function skdevs.adicionarMembroCargo(iddomembro,cargos)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local posicaostaff = 0
    local cancelar = false
    local membroverificado = false

    if user_id ~= parseInt(iddomembro) then
        local idmembroverificar = parseInt(iddomembro)
        if skdevs.verificarPermissaoStaff(user_id,'Adicionar Membros') then
            if not skdevs.verificarPermissaoStaff(idmembroverificar,'Membros Protegidos') then
                local ValoresCargos = json.encode(cargos)

                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
    
                if #queryPermiss > 0 then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembro)

                        if idmembro == parseInt(user_id) then
                            local cargos = json.decode(v.cargos)
                            local cargosDisponivel = cargos ~= nil and #cargos > 0
                            if cargosDisponivel then
                                for _,nomedocargo in pairs(cargos) do
                                    local queryStaff = {}
                                    if baseatual == 'creativev6' then
                                        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                    else
                                        queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                    end
                                    local staffQuery = queryStaff
                                    for b,c in pairs(staffQuery) do
                                        local cargostaff = json.decode(c.cargos)
                                        if cargostaff ~= nil then
                                            for x,y in pairs(cargostaff) do
                                                for m,n in pairs(y) do
                                                    local cargoIngameStaff = n.cargoingame[1]

                                                    if nomedocargo == cargoIngameStaff then
                                                        if not n.cargoinvisivelstatus then
                                                            posicaostaff = x
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        if idmembro == idmembro2 then
                            membroverificado = true
                        end

                        if membroverificado then
                            if idmembro == idmembro2 then
                                local tabelacargosnovos = {}
                
                                local cargosdomembro = json.decode(v.cargos)
                                local cargosdomembro2 = json.decode(ValoresCargos)
                                if cargosdomembro2 ~= nil then
                                    for m,n in pairs(cargosdomembro2) do
                                        local nomecargoset = n
                                        
                                        for b,c in pairs(cargosdomembro) do
                                            local nomecargomembro = c
                                            
                                            local queryStaff = {}
                                            if baseatual == 'creativev6' then
                                                queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                            else
                                                queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                            end
                                            if #queryStaff > 0 then
                                                local staff = queryStaff[1]
                                                local cargos = json.decode(staff.cargos)
                                                if cargos ~= nil then
                                                    for m,n in pairs(cargos) do
                                                        for x,y in pairs(n) do
                                                            local cargoingamestaff = y.cargoingame[1]
                                                            local nomedocargostaff = x
                        
                                                            if nomecargoset == nomedocargostaff then
                                                                if nomecargomembro == cargoingamestaff then
                                                                    table.remove(cargosdomembro,b)
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    for m,n in pairs(cargosdomembro2) do
                                        local nomedocargo = n
                                        local queryStaff = {}
                                        if baseatual == 'creativev6' then
                                            queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                        else
                                            queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                        end
                                        if #queryStaff > 0 then
                                            local staff = queryStaff[1]
                                            local cargos = json.decode(staff.cargos)
                                            if cargos ~= nil then
                                                for m,n in pairs(cargos) do
                                                    for x,y in pairs(n) do
                                                        local cargoingamestaff = y.cargoingame[1]
                                                        local nomedocargostaff = x
                
                                                        if nomedocargo == nomedocargostaff then
                                                            if m <= posicaostaff then
                                                                cancelar = true
                                                            end
                
                                                            if not cancelar then
                                                                table.insert(tabelacargosnovos,cargoingamestaff)

                                                                if baseatual == 'creativev6' then
                                                                    local vRPGroupsCFG = vRP.Groups()
                                                                    if vRPGroupsCFG[staff["nomedogrupo"]] then
                                                                        for hIdx,HGrupo in pairs(vRPGroupsCFG[staff["nomedogrupo"]]["Hierarchy"]) do
                                                                            if subStrFind(HGrupo,cargoingamestaff) then
                                                                                vRP.SetPermission(idmembro2,staff["nomedogrupo"],hIdx,false)
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                                if baseatual == 'creativev5' then
                                                                    vRP.setPermission(idmembro2,cargoingamestaff)
                                                                end
                                                                if baseatual == 'creativev4' then
                                                                    vRP.setPermission(idmembro2,cargoingamestaff)
                                                                end
                                                                if baseatual == 'creativev3' then
                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                                    vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                                end
                                                                if baseatual == 'creativev2' then
                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                                    vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                                end
                                                                if baseatual == 'creativev1' then
                                                                    vRP.setPermission(idmembro2,cargoingamestaff)
                                                                end

                                                                if baseatual ~= 'creativev6' then
                                                                    if vRP.getUserSource(idmembro2) then
                                                                        if baseatual == 'vrpex' then
                                                                            vRP.addUserGroup(idmembro2,cargoingamestaff)
                                                                        end
    
                                                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                        if #staff > 0 then
                                                                            SendWebhookMessage(staff[1].logdeadicaodemembros,"```prolog\nMembro Adicionado da Staff!!!\n\n[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.."```")
                                                                        end
                                                                        enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.." ")
                                                                    else
                                                                        if baseatual == 'vrpex' then
                                                                            local queryUserData = vRP.query("skdev_group/obterUserData")
                                                                            if #queryUserData > 0 then
                                                                                for k,v in pairs(queryUserData) do
                                                                                    if v.dkey == 'vRP:datatable' then
                                                                                        local idusuario = v.user_id
    
                                                                                        if idusuario == idmembro2 then
                                                                                            local dvalue = json.decode(v.dvalue)
                                                                                            local gruposplayer = dvalue.groups
    
                                                                                            local tabelaNovaUserData = {}
    
                                                                                            for cargo,_ in pairs(gruposplayer) do
                                                                                                if cargo ~= nomedocargo then
                                                                                                    tabelaNovaUserData[cargo] = true
                                                                                                end
                                                                                            end
    
                                                                                            local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                                            if #staff > 0 then
                                                                                                SendWebhookMessage(staff[1].logdeadicaodemembros,"```prolog\nMembro Adicionado da Staff!!!\n\n[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.."```")
                                                                                            end
                                                                                            enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.." ")
                                                                                            tabelaNovaUserData[cargoingamestaff] = true
                                                                                            dvalue.groups = tabelaNovaUserData
                                                                                            vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                                                            break
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if cargosdomembro ~= nil then
                                    for m,n in pairs(cargosdomembro) do
                                        table.insert(tabelacargosnovos,n)
                                    end
                                end

                                if baseatual == 'creativev6' then
                                    vRP.Query("skdev_group/updateGrupos",{user_id = iddomembro, cargos = json.encode(tabelacargosnovos)})
                                else
                                    vRP.execute("skdev_group/updateGrupos",{user_id = iddomembro, cargos = json.encode(tabelacargosnovos)})
                                end
                                vCLIENT.updateMembrosStaff(source)
                            end
                        end
                    end
                    if not membroverificado then
                        local tabelacargosnovos = {}
                        local cargosdomembro2 = json.decode(ValoresCargos)
                        if cargosdomembro2 ~= nil then
                            for m,n in pairs(cargosdomembro2) do
                                local nomedocargo = n
                                local queryStaff = {}
                                if baseatual == 'creativev6' then
                                    queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                else
                                    queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                end
                                if #queryStaff > 0 then
                                    local staff = queryStaff[1]
                                    local cargos = json.decode(staff.cargos)
                                    if cargos ~= nil then
                                        for m,n in pairs(cargos) do
                                            for x,y in pairs(n) do
                                                local cargoingamestaff = y.cargoingame[1]
                                                local nomedocargostaff = x
        
                                                if nomedocargo == nomedocargostaff then
                                                    if m > posicaostaff then
                                                        table.insert(tabelacargosnovos,cargoingamestaff)
        
                                                        if baseatual == 'creativev6' then
                                                            local vRPGroupsCFG = vRP.Groups()
                                                            if vRPGroupsCFG[staff["nomedogrupo"]] then
                                                                for hIdx,HGrupo in pairs(vRPGroupsCFG[staff["nomedogrupo"]]["Hierarchy"]) do
                                                                    if subStrFind(HGrupo,cargoingamestaff) then
                                                                        vRP.SetPermission(idmembro2,staff["nomedogrupo"],hIdx,false)
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        if baseatual == 'creativev5' then
                                                            vRP.setPermission(idmembro2,cargoingamestaff)
                                                        end
                                                        if baseatual == 'creativev4' then
                                                            vRP.setPermission(idmembro2,cargoingamestaff)
                                                        end
                                                        if baseatual == 'creativev3' then
                                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                            vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                        end
                                                        if baseatual == 'creativev2' then
                                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                            vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                        end
                                                        if baseatual == 'creativev1' then
                                                            vRP.setPermission(idmembro2,cargoingamestaff)
                                                        end

                                                        if baseatual ~= 'creativev6' then
                                                            if vRP.getUserSource(idmembro2) then
                                                                if baseatual == 'vrpex' then
                                                                    vRP.addUserGroup(idmembro2,cargoingamestaff)
                                                                end
                        
                                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                if #staff > 0 then
                                                                    SendWebhookMessage(staff[1].logdeadicaodemembros,"```prolog\nMembro Adicionado da Staff!!!\n\n[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.."```")
                                                                end
                                                                enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.." ")
                                                            else
                                                                if baseatual == 'vrpex' then
                                                                    local queryUserData = vRP.query("skdev_group/obterUserData")
                                                                    if #queryUserData > 0 then
                                                                        for k,v in pairs(queryUserData) do
                                                                            if v.dkey == 'vRP:datatable' then
                                                                                local idusuario = v.user_id
                                    
                                                                                if idusuario == idmembro2 then
                                                                                    local dvalue = json.decode(v.dvalue)
                                                                                    local gruposplayer = dvalue.groups
                                    
                                                                                    local tabelaNovaUserData = {}
                                    
                                                                                    for cargo,_ in pairs(gruposplayer) do
                                                                                        if cargo ~= nomedocargo then
                                                                                            tabelaNovaUserData[cargo] = true
                                                                                        end
                                                                                    end
                            
                                                                                    local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                                    if #staff > 0 then
                                                                                        SendWebhookMessage(staff[1].logdeadicaodemembros,"```prolog\nMembro Adicionado da Staff!!!\n\n[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.."```")
                                                                                    end
                                                                                    enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.." ")
                                                                                    tabelaNovaUserData[cargoingamestaff] = true
                                                                                    dvalue.groups = tabelaNovaUserData
                                                                                    vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                                                    break
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        if baseatual == 'creativev6' then
                            vRP.Query("skdev_group/insertGrupos",{user_id = iddomembro,cargos = json.encode(tabelacargosnovos)})
                        else
                            vRP.execute("skdev_group/insertGrupos",{user_id = iddomembro,cargos = json.encode(tabelacargosnovos)})
                        end
                        vCLIENT.updateMembrosStaff(source)
                    end
                else
                    local tabelacargosnovos = {}
                    local cargosdomembro2 = json.decode(ValoresCargos)
                    if cargosdomembro2 ~= nil then
                        for m,n in pairs(cargosdomembro2) do
                            local nomedocargo = n
                            local queryStaff = {}
                            if baseatual == 'creativev6' then
                                queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                            else
                                queryStaff = vRP.query("skdev_group/staffrecebervalor")
                            end
                            if #queryStaff > 0 then
                                local staff = queryStaff[1]
                                local cargos = json.decode(staff.cargos)
                                if cargos ~= nil then
                                    for m,n in pairs(cargos) do
                                        for x,y in pairs(n) do
                                            local cargoingamestaff = y.cargoingame[1]
                                            local nomedocargostaff = x
                    
                                            if nomedocargo == nomedocargostaff then
                                                table.insert(tabelacargosnovos,cargoingamestaff)
        
                                                if baseatual == 'creativev6' then
                                                    local vRPGroupsCFG = vRP.Groups()
                                                    if vRPGroupsCFG[staff["nomedogrupo"]] then
                                                        for hIdx,HGrupo in pairs(vRPGroupsCFG[staff["nomedogrupo"]]["Hierarchy"]) do
                                                            if subStrFind(HGrupo,cargoingamestaff) then
                                                                vRP.SetPermission(idmembro2,staff["nomedogrupo"],hIdx,false)
                                                            end
                                                        end
                                                    end
                                                end
                                                if baseatual == 'creativev5' then
                                                    vRP.setPermission(idmembro2,cargoingamestaff)
                                                end
                                                if baseatual == 'creativev4' then
                                                    vRP.setPermission(idmembro2,cargoingamestaff)
                                                end
                                                if baseatual == 'creativev3' then
                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                    vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                end
                                                if baseatual == 'creativev2' then
                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                    vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = cargoingamestaff})
                                                end
                                                if baseatual == 'creativev1' then
                                                    vRP.setPermission(idmembro2,cargoingamestaff)
                                                end

                                                if baseatual == 'creativev6' then
                                                    if vRP.getUserSource(idmembro2) then
                                                        if baseatual == 'vrpex' then
                                                            vRP.addUserGroup(idmembro2,cargoingamestaff)
                                                        end
                
                                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                                        if #staff > 0 then
                                                            SendWebhookMessage(staff[1].logdeadicaodemembros,"```prolog\nMembro Adicionado da Staff!!!\n\n[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.."```")
                                                        end
                                                        enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.." ")
                                                    else
                                                        if baseatual == 'vrpex' then
                                                            local queryUserData = vRP.query("skdev_group/obterUserData")
                                                            if #queryUserData > 0 then
                                                                for k,v in pairs(queryUserData) do
                                                                    if v.dkey == 'vRP:datatable' then
                                                                        local idusuario = v.user_id
                            
                                                                        if idusuario == idmembro2 then
                                                                            local dvalue = json.decode(v.dvalue)
                                                                            local gruposplayer = dvalue.groups
                            
                                                                            local tabelaNovaUserData = {}
                            
                                                                            for cargo,_ in pairs(gruposplayer) do
                                                                                if cargo ~= nomedocargo then
                                                                                    tabelaNovaUserData[cargo] = true
                                                                                end
                                                                            end
                    
                                                                            local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                            if #staff > 0 then
                                                                                SendWebhookMessage(staff[1].logdeadicaodemembros,"```prolog\nMembro Adicionado da Staff!!!\n\n[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.."```")
                                                                            end
                                                                            enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O MEMBRO DE ID: "..idmembro2.." NO CARGO: "..cargoingamestaff.." ")
                                                                            tabelaNovaUserData[cargoingamestaff] = true
                                                                            dvalue.groups = tabelaNovaUserData
                                                                            vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                                            break
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if baseatual == 'creativev6' then
                        vRP.Query("skdev_group/insertGrupos",{user_id = iddomembro,cargos = json.encode(tabelacargosnovos)})
                    else
                        vRP.execute("skdev_group/insertGrupos",{user_id = iddomembro,cargos = json.encode(tabelacargosnovos)})
                    end
                    vCLIENT.updateMembrosStaff(source)
                end
            end
        end
    end
end

function skdevs.uparMembroStaff(iddomembro)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local posicaostaff = 0

    if user_id ~= parseInt(iddomembro) then
        if skdevs.verificarPermissaoStaff(user_id,'Upar Membros') then
            if not skdevs.verificarPermissaoStaff(parseInt(iddomembro),'Membros Protegidos') then
                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
                if #queryPermiss > 0 then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembro)

                        if idmembro == parseInt(user_id) then
                            local cargos = json.decode(v.cargos)
                            local cargosDisponivel = cargos ~= nil and #cargos > 0
                            if cargosDisponivel then
                                for _,nomedocargo in pairs(cargos) do
                                    local queryStaff = {}
                                    if baseatual == 'creativev6' then
                                        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                    else
                                        queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                    end
                                    local staffQuery = queryStaff
                                    for b,c in pairs(staffQuery) do
                                        local cargostaff = json.decode(c.cargos)
                                        if cargostaff ~= nil then
                                            for x,y in pairs(cargostaff) do
                                                for m,n in pairs(y) do
                                                    local cargoIngameStaff = n.cargoingame[1]
        
                                                    if nomedocargo == cargoIngameStaff then
                                                        if not n.cargoinvisivelstatus then
                                                            posicaostaff = x
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        if idmembro == idmembro2 then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c
        
                                    local queryStaff = {}
                                    if baseatual == 'creativev6' then
                                        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                    else
                                        queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                    end
                                    if #queryStaff > 0 then
                                        local staff = queryStaff[1]
                                        local cargos = json.decode(staff.cargos)
                                        if cargos ~= nil then
                                            for m,n in pairs(cargos) do
                                                for x,y in pairs(n) do
                                                    local nomedocargostaff = y.cargoingame[1]
                    
                                                    if nomedocargo == nomedocargostaff then
                                                        if not y.cargoinvisivelstatus then
                                                            local upar = m - 1 ~= 0
                                                            
                                                            if upar then
                                                                if m-1 > posicaostaff then
                                                                    for o,p in pairs(cargos[m-1]) do
                                                                        local nomedocargosupar = p.cargoingame[1]
                                                                        
                                                                        local tabelaNova = {}
                            
                                                                        table.remove(cargosMembro,b)
                                                                        for index,cargo in pairs(cargosMembro) do
                                                                            table.insert(tabelaNova,cargo)
                                                                        end
                                                                        table.insert(tabelaNova,nomedocargosupar)
                            
                                                                        if baseatual == 'creativev6' then
                                                                            vRP.Query("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelaNova)})
                                                                        else
                                                                            vRP.execute("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelaNova)})
                                                                        end
        
                                                                        if baseatual == 'creativev6' then
                                                                            vRP.SetPermission(idmembro2,staff["nomedogrupo"],false,"Upar")
                                                                        end
                                                                        if baseatual == 'creativev5' then
                                                                            vRP.setPermission(idmembro2,nomedocargosupar)
                                                                            vRP.remPermission(idmembro2,nomedocargo)
                                                                        end
                                                                        if baseatual == 'creativev4' then
                                                                            vRP.setPermission(idmembro2,nomedocargosupar)
                                                                            vRP.remPermission(idmembro2,nomedocargo)
                                                                        end
                                                                        if baseatual == 'creativev3' then
                                                                            vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargosupar})
                                                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                        end
                                                                        if baseatual == 'creativev2' then
                                                                            vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargosupar})
                                                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                        end
                                                                        if baseatual == 'creativev1' then
                                                                            vRP.setPermission(idmembro2,nomedocargosupar)
                                                                            vRP.remPermission(idmembro2,nomedocargo)
                                                                        end
        
                                                                        if baseatual ~= 'creativev6' then
                                                                            if vRP.getUserSource(idmembro2) then
                                                                                if baseatual == 'vrpex' then
                                                                                    vRP.addUserGroup(idmembro2,nomedocargosupar)
                                                                                    vRP.removeUserGroup(idmembro2,nomedocargo)
                                                                                end
                                                                            else
                                                                                if baseatual == 'vrpex' then
                                                                                    local queryUserData = vRP.query("skdev_group/obterUserData")
                                                                                    if #queryUserData > 0 then
                                                                                        for k,v in pairs(queryUserData) do
                                                                                            if v.dkey == 'vRP:datatable' then
                                                                                                local idusuario = v.user_id
                                    
                                                                                                if idusuario == idmembro2 then
                                                                                                    local dvalue = json.decode(v.dvalue)
                                                                                                    local gruposplayer = dvalue.groups
                                    
                                                                                                    local tabelaNovaUserData = {}
                                    
                                                                                                    for cargo,_ in pairs(gruposplayer) do
                                                                                                        if cargo ~= nomedocargo then
                                                                                                            tabelaNovaUserData[cargo] = true
                                                                                                        end
                                                                                                    end
                                                                                                    
                                                                                                    tabelaNovaUserData[nomedocargosupar] = true
                                                                                                    dvalue.groups = tabelaNovaUserData
                                                                                                    vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                    
                                    
                                                                                                    break
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                    
                                                                        local staff = {}
                                                                        if baseatual == 'creativev6' then
                                                                            staff = vRP.Query('skdev_group/staffrecebervalor')
                                                                        else
                                                                            staff = vRP.query('skdev_group/staffrecebervalor')
                                                                        end
                                                                        if #staff > 0 then
                                                                            SendWebhookMessage(staff[1].logdeupamentodemembros,"```prolog\nMembro Upado da Staff!!!\n\n[ID]: "..user_id.." UPOU O MEMBRO DE ID: "..idmembro2.."```")
                                                                        end
                                                                        enviarLogNoPainelAdm("[ID]: "..user_id.." UPOU O MEMBRO DE ID: "..idmembro2.." ")
                                                                        vCLIENT.updateMembrosStaff(source)
                                                                        break
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.rebaixarMembroStaff(iddomembro)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local posicaostaff = 0

    if user_id ~= parseInt(iddomembro) then
        if skdevs.verificarPermissaoStaff(user_id,'Rebaixar Membros') then
            if not skdevs.verificarPermissaoStaff(parseInt(iddomembro),'Membros Protegidos') then
                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
                if #queryPermiss > 0 then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembro)
    
                        if idmembro == parseInt(user_id) then
                            local cargos = json.decode(v.cargos)
                            local cargosDisponivel = cargos ~= nil and #cargos > 0
                            if cargosDisponivel then
                                for _,nomedocargo in pairs(cargos) do
                                    local queryStaff = {}
                                    if baseatual == 'creativev6' then
                                        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                    else
                                        queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                    end
                                    local staffQuery = queryStaff
                                    for b,c in pairs(staffQuery) do
                                        local cargostaff = json.decode(c.cargos)
                                        if cargostaff ~= nil then
                                            for x,y in pairs(cargostaff) do
                                                for m,n in pairs(y) do
                                                    local cargoIngameStaff = n.cargoingame[1]
        
                                                    if nomedocargo == cargoIngameStaff then
                                                        if not n.cargoinvisivelstatus then
                                                            posicaostaff = x
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
    
                        if idmembro == idmembro2 then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c
                
                                    local queryStaff = {}
                                    if baseatual == 'creativev6' then
                                        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                    else
                                        queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                    end
                                    if #queryStaff > 0 then
                                        local staff = queryStaff[1]
                                        local cargos = json.decode(staff.cargos)
                                        if cargos ~= nil then
                                            for m,n in pairs(cargos) do
                                                for x,y in pairs(n) do
                                                    local nomedocargostaff = y.cargoingame[1]
        
                                                    if nomedocargo == nomedocargostaff then
                                                        local rebaixar = m + 1 <= #cargos
                                                        
                                                        if rebaixar then
                                                            if posicaostaff+1 < m+1 then
                                                                for o,p in pairs(cargos[m+1]) do
                                                                    local nomedocargorebaixar = p.cargoingame[1]
                                                                    if not p.cargoinvisivelstatus then
                                                                        local tabelaNova = {}
                            
                                                                        table.remove(cargosMembro,b)
                                                                        for index,cargo in pairs(cargosMembro) do
                                                                            table.insert(tabelaNova,cargo)
                                                                        end
                                                                        table.insert(tabelaNova,nomedocargorebaixar)
                            
                                                                        if baseatual == 'creativev6' then
                                                                            vRP.Query("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelaNova)})
                                                                        else
                                                                            vRP.execute("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelaNova)})
                                                                        end
        
                                                                        if baseatual == 'creativev6' then
                                                                            vRP.SetPermission(idmembro2,staff["nomedogrupo"],false,"Demote")
                                                                        end
                                                                        if baseatual == 'creativev5' then
                                                                            vRP.setPermission(idmembro2,nomedocargorebaixar)
                                                                            vRP.remPermission(idmembro2,nomedocargo)
                                                                        end
                                                                        if baseatual == 'creativev4' then
                                                                            vRP.setPermission(idmembro2,nomedocargorebaixar)
                                                                            vRP.remPermission(idmembro2,nomedocargo)
                                                                        end
                                                                        if baseatual == 'creativev3' then
                                                                            vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargorebaixar})
                                                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                        end
                                                                        if baseatual == 'creativev2' then
                                                                            vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargorebaixar})
                                                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                        end
                                                                        if baseatual == 'creativev1' then
                                                                            vRP.setPermission(idmembro2,nomedocargorebaixar)
                                                                            vRP.remPermission(idmembro2,nomedocargo)
                                                                        end
            
                                                                        if baseatual ~= 'creativev6' then
                                                                            if vRP.getUserSource(idmembro2) then
                                                                                if baseatual == 'vrpex' then
                                                                                    vRP.addUserGroup(idmembro2,nomedocargorebaixar)
                                                                                    vRP.removeUserGroup(idmembro2,nomedocargo)
                                                                                end
                                                                            else
                                                                                if baseatual == 'vrpex' then
                                                                                    local queryUserData = vRP.query("skdev_group/obterUserData")
                                                                                    if #queryUserData > 0 then
                                                                                        for k,v in pairs(queryUserData) do
                                                                                            if v.dkey == 'vRP:datatable' then
                                                                                                local idusuario = v.user_id
                                    
                                                                                                if idusuario == idmembro2 then
                                                                                                    local dvalue = json.decode(v.dvalue)
                                                                                                    local gruposplayer = dvalue.groups
                                    
                                                                                                    local tabelaNovaUserData = {}
                                    
                                                                                                    for cargo,_ in pairs(gruposplayer) do
                                                                                                        if cargo ~= nomedocargo then
                                                                                                            tabelaNovaUserData[cargo] = true
                                                                                                        end
                                                                                                    end
                                                                                                    
                                                                                                    tabelaNovaUserData[nomedocargorebaixar] = true
                                                                                                    dvalue.groups = tabelaNovaUserData
                                                                                                    vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                    
                                    
                                                                                                    break
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                    
                    
                                                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                        if baseatual == 'creativev6' then
                                                                            staff = vRP.Query('skdev_group/staffrecebervalor')
                                                                        else
                                                                            staff = vRP.query('skdev_group/staffrecebervalor')
                                                                        end
                                                                        if #staff > 0 then
                                                                            SendWebhookMessage(staff[1].logderebaixamentodemembros,"```prolog\nMembro Rebaixado da Staff!!!\n\n[ID]: "..user_id.." REBAIXOU O MEMBRO DE ID: "..idmembro2.."```")
                                                                        end
                                                                        enviarLogNoPainelAdm("[ID]: "..user_id.." REBAIXOU O MEMBRO DE ID: "..idmembro2.." ")
                                                                        vCLIENT.updateMembrosStaff(source)
                                                                        break
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.removerMembroStaff(iddomembro)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local posicaostaff = 0
    local cargosNovosMembro = {}

    if user_id ~= parseInt(iddomembro) then
        if skdevs.verificarPermissaoStaff(user_id,'Remover Membros') then
            if not skdevs.verificarPermissaoStaff(parseInt(iddomembro),'Membros Protegidos') then
                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
                if #queryPermiss > 0 then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembro)
    
                        if idmembro == parseInt(user_id) then
                            local cargos = json.decode(v.cargos)
                            local cargosDisponivel = cargos ~= nil and #cargos > 0
                            if cargosDisponivel then
                                for _,nomedocargo in pairs(cargos) do
                                    local queryStaff = {}
                                    if baseatual == 'creativev6' then
                                        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                    else
                                        queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                    end
                                    local staffQuery = queryStaff
                                    for b,c in pairs(staffQuery) do
                                        local cargostaff = json.decode(c.cargos)
                                        if cargostaff ~= nil then
                                            for x,y in pairs(cargostaff) do
                                                for m,n in pairs(y) do
                                                    local cargoIngameStaff = n.cargoingame[1]
        
                                                    if nomedocargo == cargoIngameStaff then
                                                        if not n.cargoinvisivelstatus then
                                                            posicaostaff = x
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
            
                        if idmembro == idmembro2 then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c
                                    local cargoDiferente = false
                                    
                                    local queryStaff = {}
                                    if baseatual == 'creativev6' then
                                        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                                    else
                                        queryStaff = vRP.query("skdev_group/staffrecebervalor")
                                    end
                                    if #queryStaff > 0 then
                                        local staff = queryStaff[1]
                                        local cargos = json.decode(staff.cargos)
                                        if cargos ~= nil then
                                            for m,n in pairs(cargos) do
                                                for x,y in pairs(n) do
                                                    local nomedocargostaff = y.cargoingame[1]
                                                    if nomedocargo == nomedocargostaff then
                                                        if m > posicaostaff then
                                                            cargoDiferente = true
        
                                                            if baseatual == 'creativev6' then
                                                                vRP.RemovePermission(idmembro2,staff["nomedogrupo"])
                                                            end
                                                            if baseatual == 'creativev5' then
                                                                vRP.remPermission(idmembro2,nomedocargostaff)
                                                            end
                                                            if baseatual == 'creativev4' then
                                                                vRP.remPermission(idmembro2,nomedocargostaff)
                                                            end
                                                            if baseatual == 'creativev3' then
                                                                vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargostaff})
                                                            end
                                                            if baseatual == 'creativev2' then
                                                                vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargostaff})
                                                            end
                                                            if baseatual == 'creativev1' then
                                                                vRP.remPermission(idmembro2,nomedocargostaff)
                                                            end
        
                                                            if baseatual ~= 'creativev6' then
                                                                if vRP.getUserSource(idmembro2) then
                                                                    if baseatual == 'vrpex' then
                                                                        vRP.removeUserGroup(idmembro2,nomedocargostaff)
                                                                    end
                                                                else
                                                                    if baseatual == 'vrpex' then
                                                                        local queryUserData = vRP.query("skdev_group/obterUserData")
                                                                        if #queryUserData > 0 then
                                                                            for k,v in pairs(queryUserData) do
                                                                                if v.dkey == 'vRP:datatable' then
                                                                                    local idusuario = v.user_id
                        
                                                                                    if idusuario == idmembro2 then
                                                                                        local dvalue = json.decode(v.dvalue)
                                                                                        local gruposplayer = dvalue.groups
                        
                                                                                        local tabelaNovaUserData = {}
                        
                                                                                        for cargo,_ in pairs(gruposplayer) do
                                                                                            if cargo ~= nomedocargostaff then
                                                                                                tabelaNovaUserData[cargo] = true
                                                                                            end
                                                                                        end
                        
                                                                                        dvalue.groups = tabelaNovaUserData
                                                                                        vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})    
                                                                                        break
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                            break
                                                        end
                                                    end
                                                end
                                            end
                                        end
    
                                        if not cargoDiferente then
                                            table.insert(cargosNovosMembro, nomedocargo)
                                        end
                                    end
                                end
                            end

                            if baseatual == 'creativev6' then
                                vRP.Query("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(cargosNovosMembro)})
                            else
                                vRP.execute("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(cargosNovosMembro)})
                            end
                            local staff = {}
                            if baseatual == 'creativev6' then
                                staff = vRP.Query('skdev_group/staffrecebervalor')
                            else
                                staff = vRP.query('skdev_group/staffrecebervalor')
                            end
                            if #staff > 0 then
                                SendWebhookMessage(staff[1].logderemocaodemembros,"```prolog\nMembro Removido da Staff!!!\n\n[ID]: "..user_id.." REMOVEU O MEMBRO: "..idmembro2.."```")
                            end
                            enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O MEMBRO: "..idmembro2.." ")
                            vCLIENT.updateMembrosStaff(source)
                        end
                    end
                end
            end
        end
    end
end

function informacoesStaffIdPropio(userid)
    local orgplayer = false
    local cargoplayer = 'Ajudante'
    local logdeimagens = false
    local logdecriacaodeorgs = false
    local logdegerenciarorgs = false
    local logdegerenciarstaff = false
    local logdealteracaodelogs = false
    local logdegerenciarcidadoes = false
    local logupamentodemembros = false
    local logrebaixamentodemembros = false
    local logremocaodemembros = false
    local logadicaodemembros = false
    local imagemperfil = false

    local queryStaff = {}
    local queryPermiss = {}
    if baseatual == 'creativev6' then
        queryStaff = vRP.Query("skdev_group/staffrecebervalor")
        queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryStaff = vRP.query("skdev_group/staffrecebervalor")
        queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local staff = #queryStaff > 0
    local Permiss = #queryPermiss > 0

    if staff then
        orgplayer = queryStaff[1].nomedogrupo
        if Permiss then
            for k,v in pairs(queryPermiss) do
                local idmembro = parseInt(v.user_id)
                local cargos = json.decode(v.cargos)

                if idmembro == parseInt(userid) then
                    local cargosDisponivel = cargos ~= nil and #cargos > 0
                    if cargosDisponivel then
                        for _,nomedocargo in pairs(cargos) do
                            local staffQuery = queryStaff
                            for b,c in pairs(staffQuery) do
                                local cargostaff = json.decode(c.cargos)
                                if cargostaff ~= nil then
                                    for x,y in pairs(cargostaff) do
                                        for m,n in pairs(y) do
                                            local cargoIngameStaff = n.cargoingame[1]

                                            if not n.cargoinvisivelstatus then
                                                if nomedocargo == cargoIngameStaff then
                                                    cargoplayer = m
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        logdeimagens = queryStaff[1].logdeenviarimagens
        logdecriacaodeorgs = queryStaff[1].logdecriacaodeorgs
        logdegerenciarorgs = queryStaff[1].logdegerenciarorgs
        logdegerenciarstaff = queryStaff[1].logdegerenciarstaff
        logdealteracaodelogs = queryStaff[1].logdealteracaodelogs
        logdegerenciarcidadoes = queryStaff[1].logdegerenciarcidadoes
        logupamentodemembros = queryStaff[1].logdeupamentodemembros
        logrebaixamentodemembros = queryStaff[1].logderebaixamentodemembros
        logremocaodemembros = queryStaff[1].logderemocaodemembros
        logadicaodemembros = queryStaff[1].logdeadicaodemembros
        if Permiss then
            for k,v in pairs(queryPermiss) do
                local idplayer = parseInt(v.user_id)
                local imagemplayer = v.imagemlink
                local imagemdisponivel = #imagemplayer > 0

                if idplayer == userid then
                    if imagemdisponivel then
                        imagemperfil = imagemplayer
                    else
                        imagemperfil = false
                    end
                else
                    imagemperfil = false
                end
            end
        else
            imagemperfil = false
        end
    else
        orgplayer = 'Administração'
        cargoplayer = 'Ajudante'
        logdeimagens = ''
        logdecriacaodeorgs = ''
        logdegerenciarorgs = ''
        logdegerenciarstaff = ''
        logdealteracaodelogs = ''
        logdegerenciarcidadoes = ''
        logupamentodemembros = ''
        logrebaixamentodemembros = ''
        logremocaodemembros = ''
        logadicaodemembros = ''
        imagemperfil = ''
    end

    return nomeplayer,orgplayer,cargoplayer,logdeimagens,logdecriacaodeorgs,logdegerenciarorgs,logdegerenciarstaff,logdealteracaodelogs,logdegerenciarcidadoes,logupamentodemembros,logrebaixamentodemembros,logremocaodemembros,logadicaodemembros,imagemperfil
end

function skdevs.VerificarInformacoesGerenciarPainel()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local identidade = ''
    local nomeplayer = ''
    if baseatual == 'creativev6' then
        identidade = vRP.Identity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
    end
    if baseatual == 'creativev5' then
        identidade = vRP.userIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
    end
    if baseatual == 'creativev4' then
        identidade = vRP.userIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
    end
    if baseatual == 'creativev3' then
        identidade = vRP.userIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
    end
    if baseatual == 'creativev2' then
        identidade = vRP.getUserIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
    end
    if baseatual == 'creativev1' then
        identidade = vRP.userIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
    end
    if baseatual == 'vrpex' then
        identidade = vRP.getUserIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.firstname..' #'..user_id
    end
    _,orgplayer,_,_,_,_,_,_,_,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,cargoplayer,_,_,_,_,_,_,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,logdeimagens,_,_,_,_,_,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,logdecriacaodeorgs,_,_,_,_,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,logdegerenciarorgs,_,_,_,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,_,logdegerenciarstaff,_,_,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,_,_,logdealteracaodelogs,_,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,_,_,_,logdegerenciarcidadoes,_,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,_,_,_,_,logupamentodemembros,_,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,_,_,_,_,_,logrebaixamentodemembros,_,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,_,_,_,_,_,_,logremocaodemembros,_,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,_,_,_,_,_,_,_,logadicaodemembros,_ = informacoesStaffIdPropio(user_id)
    _,_,_,_,_,_,_,_,_,_,_,_,_,imagemperfil = informacoesStaffIdPropio(user_id)


    return nomeplayer,orgplayer,cargoplayer,logdeimagens,logdecriacaodeorgs,logdegerenciarorgs,logdegerenciarstaff,logdealteracaodelogs,logdegerenciarcidadoes,logupamentodemembros,logrebaixamentodemembros,logremocaodemembros,logadicaodemembros,imagemperfil
end

function skdevs.alterarlogsStaff(logdeimagens,logdecriacaodeorgs,logdegerenciarorgs,logdegerenciarstaff,logdealteracaodelogs,logdegerenciarcidadoes,logupamentodemembros,logrebaixamentodemembros,logremocaodemembros,logadicaodemembros)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    if skdevs.verificarPermissaoStaff(user_id,'Alterar Logs') then

        local staff = {}
        if baseatual == 'creativev6' then
            staff = vRP.Query('skdev_group/staffrecebervalor')
        else
            staff = vRP.query('skdev_group/staffrecebervalor')
        end
        if #staff > 0 then
            SendWebhookMessage(staff[1].logdealteracaodelogs,"```prolog\nLogs Alteradas!!!!\n\n[ID]: "..user_id.." ALTEROU AS LOGS DE STAFFS!```")
        end
        enviarLogNoPainelAdm("[ID]: "..user_id.." ALTEROU AS LOGS DE STAFFS!")
        if baseatual == 'creativev6' then
            vRP.Query("skdev_group/editarStaffLogs",{logdeenviarimagens = logdeimagens,logdecriacaodeorgs = logdecriacaodeorgs,logdegerenciarorgs = logdegerenciarorgs,logdegerenciarstaff = logdegerenciarstaff,logdealteracaodelogs = logdealteracaodelogs,logdegerenciarcidadoes = logdegerenciarcidadoes,logdeupamentodemembros = logupamentodemembros,logderebaixamentodemembros = logrebaixamentodemembros,logderemocaodemembros = logremocaodemembros,logdeadicaodemembros = logadicaodemembros})
        else
            vRP.execute("skdev_group/editarStaffLogs",{logdeenviarimagens = logdeimagens,logdecriacaodeorgs = logdecriacaodeorgs,logdegerenciarorgs = logdegerenciarorgs,logdegerenciarstaff = logdegerenciarstaff,logdealteracaodelogs = logdealteracaodelogs,logdegerenciarcidadoes = logdegerenciarcidadoes,logdeupamentodemembros = logupamentodemembros,logderebaixamentodemembros = logrebaixamentodemembros,logderemocaodemembros = logremocaodemembros,logdeadicaodemembros = logadicaodemembros})
        end
    end
end

function skdevs.alteraimagemusuarioperfil(linkdaimagem)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local queryPermiss = {}
    if baseatual == 'creativev6' then
        queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end

    if #queryPermiss > 0 then
        for k,v in pairs(queryPermiss) do
            local idmembro = parseInt(v.user_id)
            local idmembro2 = parseInt(user_id)

            if idmembro == idmembro2 then
                if baseatual == 'creativev6' then
                    vRP.Query("skdev_group/updateImagenPropia",{user_id = user_id,imagemlink = linkdaimagem})
                else
                    vRP.execute("skdev_group/updateImagenPropia",{user_id = user_id,imagemlink = linkdaimagem})
                end
            end
        end
    else
        if baseatual == 'creativev6' then
            vRP.Query("skdev_group/insertImagenPropia",{user_id = user_id,imagemlink = linkdaimagem})
        else
            vRP.execute("skdev_group/insertImagenPropia",{user_id = user_id,imagemlink = linkdaimagem})
        end
    end
end

function skdevs.gerenciarReceberInformacoesId(idcidadao)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local cargosplayer = {}
    local cargogrupos = {}
    local blacklistdata = '00/00/0000'

    local queryPermiss = {}
    if baseatual == 'creativev6' then
        queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local PermissDisponivel = queryPermiss ~= nil and #queryPermiss > 0
    if PermissDisponivel then
        for posicao,tabela in pairs(queryPermiss) do
            local idusuarios = parseInt(tabela.user_id)
            local gruposusuarios = json.decode(tabela.cargos)
            local gruposDisponivel = gruposusuarios ~= nil and #gruposusuarios > 0
            if idusuarios == parseInt(idcidadao) then
                if gruposDisponivel then
                    for posicao,nomedogrupo in pairs(gruposusuarios) do
                        cargosplayer[#cargosplayer+1] = {cargodoplayer = nomedogrupo}
                    end
                else
                    cargosplayer = false
                end
            end
        end
    else
        cargosplayer = false
    end

    local queryGroups = {}
    if baseatual == 'creativev6' then
        queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
    else
        queryGroups = vRP.query("skdev_group/staffrecebergrupos")
    end
    local GroupsDisponivel = queryGroups ~= nil and #queryGroups > 0
    if GroupsDisponivel then
        for posicao,tabela in pairs(queryGroups) do
            local nomedogrupo = tabela.grupo
            local grupoValores = json.decode(tabela.valores)
            local grupoDisponiveis = grupoValores ~= nil
            if grupoDisponiveis then
                for posicao,tabelagroup in pairs(grupoValores.gruposorganizacao) do
                    for um,dois in pairs(tabelagroup) do
                        local cargoingame = dois.cargoingame[1]
                        if baseatual == 'creativev6' then
                            cargogrupos[#cargogrupos+1] = {cargogrupo = cargoingame.."-"..nomedogrupo}
                        else
                            cargogrupos[#cargogrupos+1] = {cargogrupo = cargoingame}
                        end
                    end
                end
            else
                cargogrupos = false
            end
        end
    else
        cargogrupos = false
    end

    local existe = false
    local valorBlacklist = '00/00/0000'
    local idusuario = parseInt(idcidadao)
    local queryBlacklist = {}
    if baseatual == 'creativev6' then
        queryBlacklist = vRP.Query("skdev_group/blacklistall")
    else
        queryBlacklist = vRP.query("skdev_group/blacklistall")
    end
    local BlacklistDisponivel = queryBlacklist ~= nil and #queryBlacklist > 0
    if BlacklistDisponivel then
        for posicao,tabela in pairs(queryBlacklist) do
            local idusuarios = parseInt(tabela.user_id)
            local bldps = #valorBlacklist > 0

            if idusuario == idusuarios then
                valorBlacklist = tabela.valor
                existe = true
            end
        end

        if existe then
            blacklistdata = valorBlacklist
        else
            blacklistdata = '00/00/0000'
        end
    else
        blacklistdata = '00/00/0000'
    end

    return cargogrupos,cargosplayer,blacklistdata
end

function skdevs.atualizarcargoscidadao(iddocidadao,cargos)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    if baseatual == 'creativev6' then
        if not vRP.HasPermission(user_id,cargoadministrador,false) then
            return false
        end
    else
        if not vRP.hasPermission(user_id,cargoadministrador) then
            return false
        end
    end
    if user_id ~= parseInt(iddocidadao) then
        if skdevs.verificarPermissaoStaff(user_id,'Gerenciar Cidadoes') then
            local iddomembro = parseInt(iddocidadao)
            if not skdevs.verificarPermissaoStaff(iddomembro,'Membros Protegidos') then
                local ValoresCargos = json.encode(cargos)
                
                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
                local PermissDisponivel = queryPermiss ~= nil and #queryPermiss > 0
                if PermissDisponivel then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembro)
                        
                        if idmembro == idmembro2 then
                            local cargosdomembro2 = json.decode(ValoresCargos)
                            if cargosdomembro2 ~= nil then
                                if #cargosdomembro2 > 0 then
                                    if baseatual ~= 'creativev6' then
                                        if vRP.getUserSource(iddomembro) then
                                            if baseatual == 'vrpex' then
                                                local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                                for b,c in pairs(queryGrupos) do
                                                    local orgvalores = json.decode(c.valores)
                                                    if orgvalores ~= nil then
                                                        local orggrupos = orgvalores.gruposorganizacao
                                                        for x,y in pairs(orggrupos) do
                                                            for l,m in pairs(y) do
                                                                local infcargo = m
                                                                local gruporemover = infcargo.cargoingame[1]

                                                                vRP.removeUserGroup(iddomembro,gruporemover)

                                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                if #staff > 0 then
                                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                                end
                                                                enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            if baseatual == 'creativev5' then
                                                local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                                for b,c in pairs(queryGrupos) do
                                                    local orgvalores = json.decode(c.valores)
                                                    if orgvalores ~= nil then
                                                        local orggrupos = orgvalores.gruposorganizacao
                                                        for x,y in pairs(orggrupos) do
                                                            for l,m in pairs(y) do
                                                                local infcargo = m
                                                                local gruporemover = infcargo.cargoingame[1]

                                                                vRP.remPermission(iddomembro,gruporemover)
                
                                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                if #staff > 0 then
                                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                                end
                                                                enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            if baseatual == 'creativev4' then
                                                local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                                for b,c in pairs(queryGrupos) do
                                                    local orgvalores = json.decode(c.valores)
                                                    if orgvalores ~= nil then
                                                        local orggrupos = orgvalores.gruposorganizacao
                                                        for x,y in pairs(orggrupos) do
                                                            for l,m in pairs(y) do
                                                                local infcargo = m
                                                                local gruporemover = infcargo.cargoingame[1]

                                                                vRP.remPermission(iddomembro,gruporemover)
                
                                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                if #staff > 0 then
                                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                                end
                                                                enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            if baseatual == 'creativev3' then
                                                local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                                for b,c in pairs(queryGrupos) do
                                                    local orgvalores = json.decode(c.valores)
                                                    if orgvalores ~= nil then
                                                        local orggrupos = orgvalores.gruposorganizacao
                                                        for x,y in pairs(orggrupos) do
                                                            for l,m in pairs(y) do
                                                                local infcargo = m
                                                                local gruporemover = infcargo.cargoingame[1]

                                                                vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = gruporemover})
                                                                
                                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                if #staff > 0 then
                                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                                end
                                                                enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            if baseatual == 'creativev2' then
                                                local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                                for b,c in pairs(queryGrupos) do
                                                    local orgvalores = json.decode(c.valores)
                                                    if orgvalores ~= nil then
                                                        local orggrupos = orgvalores.gruposorganizacao
                                                        for x,y in pairs(orggrupos) do
                                                            for l,m in pairs(y) do
                                                                local infcargo = m
                                                                local gruporemover = infcargo.cargoingame[1]

                                                                vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = gruporemover})
                
                                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                if #staff > 0 then
                                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                                end
                                                                enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                            if baseatual == 'creativev1' then
                                                local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                                for b,c in pairs(queryGrupos) do
                                                    local orgvalores = json.decode(c.valores)
                                                    if orgvalores ~= nil then
                                                        local orggrupos = orgvalores.gruposorganizacao
                                                        for x,y in pairs(orggrupos) do
                                                            for l,m in pairs(y) do
                                                                local infcargo = m
                                                                local gruporemover = infcargo.cargoingame[1]

                                                                vRP.remPermission(iddomembro,gruporemover)

                                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                if #staff > 0 then
                                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                                end
                                                                enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        if baseatual == 'creativev6' then
                                            if vRP.Source(iddomembro) then
                                                local grupos = vRP.Query("skdev_group/staffrecebergrupos")
                                                for f,g in pairs(grupos) do
                                                    local gruporemover = g.grupo
                                                    vRP.RemovePermission(iddomembro,gruporemover)
    
                                                    local staff = vRP.Query('skdev_group/staffrecebervalor')
                                                    if #staff > 0 then
                                                        SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                    end
                                                    enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                end
                                            end
                                        end
                                    end

                                    for m,n in pairs(cargosdomembro2) do
                                        local nomedocargo = n

                                        if baseatual == 'creativev6' then
                                            local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                            vRP.RemovePermission(iddomembro,grupoCFG)
                                        end
                                        if baseatual == 'creativev5' then
                                            vRP.remPermission(iddomembro,nomedocargo)
                                        end
                                        if baseatual == 'creativev4' then
                                            vRP.remPermission(iddomembro,nomedocargo)
                                        end
                                        if baseatual == 'creativev3' then
                                            vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                                        end
                                        if baseatual == 'creativev2' then
                                            vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                                        end
                                        if baseatual == 'creativev1' then
                                            vRP.remPermission(iddomembro,nomedocargo)
                                        end
                                        
                                        if baseatual == 'creativev6' then
                                            local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                            local vRPGroupsCFG = vRP.Groups()
                                            if vRPGroupsCFG[grupoCFG] then
                                                for hIdx,HGrupo in pairs(vRPGroupsCFG[grupoCFG]["Hierarchy"]) do
                                                    if subStrFind(HGrupo,permissaoCFG) then
                                                        vRP.SetPermission(idmembro2,grupoCFG,hIdx,false)
                                                    end
                                                end
                                            end
                                        end
                                        if baseatual == 'creativev5' then
                                            vRP.setPermission(idmembro2,nomedocargo)
                                        end
                                        if baseatual == 'creativev4' then
                                            vRP.setPermission(idmembro2,nomedocargo)
                                        end
                                        if baseatual == 'creativev3' then
                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                            vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargo})
                                        end
                                        if baseatual == 'creativev2' then
                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                            vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargo})
                                        end
                                        if baseatual == 'creativev1' then
                                            vRP.setPermission(idmembro2,nomedocargo)
                                        end

                                        if baseatual ~= 'creativev6' then
                                            if vRP.getUserSource(idmembro2) then
                                                if baseatual == 'vrpex' then
                                                    vRP.addUserGroup(idmembro2,nomedocargo)
                                                end
            
                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                if #staff > 0 then
                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..idmembro2.."```")
                                                end
                                                enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..idmembro2.."")
                                            else
                                                if baseatual == 'vrpex' then
                                                    local queryUserData = vRP.query("skdev_group/obterUserData")
                                                    if #queryUserData > 0 then
                                                        for k,v in pairs(queryUserData) do
                                                            if v.dkey == 'vRP:datatable' then
                                                                local idusuario = v.user_id
                            
                                                                if idusuario == idmembro2 then
                                                                    local dvalue = json.decode(v.dvalue)
                                                                    local gruposplayer = dvalue.groups
                            
                                                                    local tabelaNovaUserData = {}
                            
                                                                    for _,p in pairs(cargosdomembro2) do
                                                                        local nomedocargo2 = p
                            
                                                                        tabelaNovaUserData[nomedocargo2] = true
                                                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                                                        if #staff > 0 then
                                                                            SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo2.." DO JOGADOR DE ID: "..idmembro2.."```")
                                                                        end
                                                                        enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo2.." DO JOGADOR DE ID: "..idmembro2.."")
                                                                    end
                                                                    dvalue.groups = tabelaNovaUserData
                                                                    vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                                    break
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                else
                                    if vRP.getUserSource(idmembro2) then
                                        if baseatual == 'vrpex' then
                                            local gruposplayeronline = vRP.getUserGroups(idmembro2)
                                            for gruporemover,_ in pairs(gruposplayeronline) do
                                                vRP.removeUserGroup(idmembro2,gruporemover)
            
                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                if #staff > 0 then
                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..idmembro2.."```")
                                                end
                                                enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..idmembro2.."")
                                            end
                                        end
                                    else
                                        if baseatual == 'vrpex' then
                                            local queryUserData = vRP.query("skdev_group/obterUserData")
                                            if #queryUserData > 0 then
                                                for k,v in pairs(queryUserData) do
                                                    if v.dkey == 'vRP:datatable' then
                                                        local idusuario = v.user_id
                        
                                                        if idusuario == idmembro2 then
                                                            local dvalue = json.decode(v.dvalue)
                                                            local gruposplayer = dvalue.groups
                        
                                                            local tabelaNovaUserData = {}
                        
                                                            dvalue.groups = tabelaNovaUserData
                                                            vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                            break
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                    if baseatual == 'creativev6' then
                                        local grupos = vRP.Query("skdev_group/staffrecebergrupos")
                                        for f,g in pairs(grupos) do
                                            local permissaoremover = g.grupo
                                            vRP.RemovePermission(idmembro2,permissaoremover)
                                        end
                                    end
                                    if baseatual == 'creativev5' then
                                        local grupos = vRP.query("skdev_group/staffrecebergrupos")
                                        for f,g in pairs(grupos) do
                                            local permissaoremover = g.grupo
                                            vRP.remPermission(idmembro2,permissaoremover)
                                        end
                                    end
                                    if baseatual == 'creativev4' then
                                        local grupos = vRP.query("skdev_group/staffrecebergrupos")
                                        for f,g in pairs(grupos) do
                                            local permissaoremover = g.grupo
                                            vRP.remPermission(idmembro2,permissaoremover)
                                        end
                                    end
                                    if baseatual == 'creativev3' then
                                        local grupos = vRP.query("skdev_group/staffrecebergrupos")
                                        for f,g in pairs(grupos) do
                                            local permissaoremover = g.grupo
                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = permissaoremover})
                                        end
                                    end
                                    if baseatual == 'creativev2' then
                                        local grupos = vRP.query("skdev_group/staffrecebergrupos")
                                        for f,g in pairs(grupos) do
                                            local permissaoremover = g.grupo
                                            vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = permissaoremover})
                                        end
                                    end
                                    if baseatual == 'creativev1' then
                                        local grupos = vRP.query("skdev_group/staffrecebergrupos")
                                        for f,g in pairs(grupos) do
                                            local permissaoremover = g.grupo
                                            vRP.remPermission(idmembro2,permissaoremover)
                                        end
                                    end
                                end
                            else
                                if baseatual == 'creativev6' then
                                    local grupos = vRP.Query("skdev_group/staffrecebergrupos")
                                    for f,g in pairs(grupos) do
                                        local permissaoremover = g.grupo
                                        vRP.RemovePermission(iddomembro,permissaoremover)
                                    end
                                end
                                if baseatual == 'vrpex' then
                                    if vRP.getUserSource(idmembro2) then
                                        local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                        for b,c in pairs(queryGrupos) do
                                            local orgvalores = json.decode(c.valores)
                                            if orgvalores ~= nil then
                                                local orggrupos = orgvalores.gruposorganizacao
                                                for x,y in pairs(orggrupos) do
                                                    for l,m in pairs(y) do
                                                        local infcargo = m
                                                        local gruporemover = infcargo.cargoingame[1]

                                                        vRP.removeUserGroup(idmembro2,gruporemover)
                        
                                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                                        if #staff > 0 then
                                                            SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..idmembro2.."```")
                                                        end
                                                        enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..idmembro2.."")
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        if baseatual == 'vrpex' then
                                            local queryUserData = vRP.query("skdev_group/obterUserData")
                                            if #queryUserData > 0 then
                                                for k,v in pairs(queryUserData) do
                                                    if v.dkey == 'vRP:datatable' then
                                                        local idusuario = v.user_id

                                                        if idusuario == idmembro2 then
                                                            local dvalue = json.decode(v.dvalue)
                                                            local gruposplayer = dvalue.groups

                                                            local tabelaNovaUserData = {}

                                                            dvalue.groups = tabelaNovaUserData
                                                            vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                            break
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if baseatual == 'creativev5' then
                                    local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                    for b,c in pairs(queryGrupos) do
                                        local orgvalores = json.decode(c.valores)
                                        if orgvalores ~= nil then
                                            local orggrupos = orgvalores.gruposorganizacao
                                            for x,y in pairs(orggrupos) do
                                                for l,m in pairs(y) do
                                                    local infcargo = m
                                                    local gruporemover = infcargo.cargoingame[1]

                                                    vRP.remPermission(iddomembro,gruporemover)

                                                    local staff = vRP.query('skdev_group/staffrecebervalor')
                                                    if #staff > 0 then
                                                        SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                    end
                                                    enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                end
                                            end
                                        end
                                    end
                                end
                                if baseatual == 'creativev4' then
                                    local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                    for b,c in pairs(queryGrupos) do
                                        local orgvalores = json.decode(c.valores)
                                        if orgvalores ~= nil then
                                            local orggrupos = orgvalores.gruposorganizacao
                                            for x,y in pairs(orggrupos) do
                                                for l,m in pairs(y) do
                                                    local infcargo = m
                                                    local gruporemover = infcargo.cargoingame[1]

                                                    vRP.remPermission(iddomembro,gruporemover)

                                                    local staff = vRP.query('skdev_group/staffrecebervalor')
                                                    if #staff > 0 then
                                                        SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                    end
                                                    enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                end
                                            end
                                        end
                                    end
                                end
                                if baseatual == 'creativev3' then
                                    local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                    for b,c in pairs(queryGrupos) do
                                        local orgvalores = json.decode(c.valores)
                                        if orgvalores ~= nil then
                                            local orggrupos = orgvalores.gruposorganizacao
                                            for x,y in pairs(orggrupos) do
                                                for l,m in pairs(y) do
                                                    local infcargo = m
                                                    local gruporemover = infcargo.cargoingame[1]

                                                    vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = gruporemover})

                                                    local staff = vRP.query('skdev_group/staffrecebervalor')
                                                    if #staff > 0 then
                                                        SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                    end
                                                    enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                end
                                            end
                                        end
                                    end
                                end
                                if baseatual == 'creativev2' then
                                    local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                    for b,c in pairs(queryGrupos) do
                                        local orgvalores = json.decode(c.valores)
                                        if orgvalores ~= nil then
                                            local orggrupos = orgvalores.gruposorganizacao
                                            for x,y in pairs(orggrupos) do
                                                for l,m in pairs(y) do
                                                    local infcargo = m
                                                    local gruporemover = infcargo.cargoingame[1]

                                                    vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = gruporemover})

                                                    local staff = vRP.query('skdev_group/staffrecebervalor')
                                                    if #staff > 0 then
                                                        SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                    end
                                                    enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                end
                                            end
                                        end
                                    end
                                end
                                if baseatual == 'creativev1' then
                                    local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                    for b,c in pairs(queryGrupos) do
                                        local orgvalores = json.decode(c.valores)
                                        if orgvalores ~= nil then
                                            local orggrupos = orgvalores.gruposorganizacao
                                            for x,y in pairs(orggrupos) do
                                                for l,m in pairs(y) do
                                                    local infcargo = m
                                                    local gruporemover = infcargo.cargoingame[1]

                                                    vRP.remPermission(iddomembro,gruporemover)

                                                    local staff = vRP.query('skdev_group/staffrecebervalor')
                                                    if #staff > 0 then
                                                        SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                    end
                                                    enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                                end
                                            end
                                        end
                                    end
                                end
                            end

                            if baseatual == 'creativev6' then
                                vRP.Query("skdev_group/updateGrupos",{user_id = iddomembro, cargos = ValoresCargos})
                            else
                                vRP.execute("skdev_group/updateGrupos",{user_id = iddomembro, cargos = ValoresCargos})
                            end
                        end
                    end
            
                    local existe = false
                    for b,c in pairs(queryPermiss) do
                        local idmembro = parseInt(c.user_id)
                        local idmembro2 = parseInt(iddomembro)
            
                        local verificar = idmembro2 == idmembro
                        if verificar then
                            existe = true
                        end
                    end
                    
                    
                    if not existe then
                        local tabelacargosnovos = {}
                        local cargosdomembro2 = json.decode(ValoresCargos)

                        if baseatual == 'creativev6' then
                            local grupos = vRP.Query("skdev_group/staffrecebergrupos")
                            for f,g in pairs(grupos) do
                                local permissaoremover = g.grupo
                                vRP.RemovePermission(iddomembro,permissaoremover)
                            end
                        end
                        if baseatual == 'vrpex' then
                            if vRP.getUserSource(idmembro2) then
                                local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                                for b,c in pairs(queryGrupos) do
                                    local orgvalores = json.decode(c.valores)
                                    if orgvalores ~= nil then
                                        local orggrupos = orgvalores.gruposorganizacao
                                        for x,y in pairs(orggrupos) do
                                            for l,m in pairs(y) do
                                                local infcargo = m
                                                local gruporemover = infcargo.cargoingame[1]

                                                vRP.removeUserGroup(idmembro2,gruporemover)
                
                                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                                if #staff > 0 then
                                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..idmembro2.."```")
                                                end
                                                enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..idmembro2.."")
                                            end
                                        end
                                    end
                                end
                            else
                                if baseatual == 'vrpex' then
                                    local queryUserData = vRP.query("skdev_group/obterUserData")
                                    if #queryUserData > 0 then
                                        for k,v in pairs(queryUserData) do
                                            if v.dkey == 'vRP:datatable' then
                                                local idusuario = v.user_id

                                                if idusuario == idmembro2 then
                                                    local dvalue = json.decode(v.dvalue)
                                                    local gruposplayer = dvalue.groups

                                                    local tabelaNovaUserData = {}

                                                    dvalue.groups = tabelaNovaUserData
                                                    vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        if baseatual == 'creativev5' then
                            local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                            for b,c in pairs(queryGrupos) do
                                local orgvalores = json.decode(c.valores)
                                if orgvalores ~= nil then
                                    local orggrupos = orgvalores.gruposorganizacao
                                    for x,y in pairs(orggrupos) do
                                        for l,m in pairs(y) do
                                            local infcargo = m
                                            local gruporemover = infcargo.cargoingame[1]

                                            vRP.remPermission(iddomembro,gruporemover)

                                            local staff = vRP.query('skdev_group/staffrecebervalor')
                                            if #staff > 0 then
                                                SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                            end
                                            enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                        end
                                    end
                                end
                            end
                        end
                        if baseatual == 'creativev4' then
                            local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                            for b,c in pairs(queryGrupos) do
                                local orgvalores = json.decode(c.valores)
                                if orgvalores ~= nil then
                                    local orggrupos = orgvalores.gruposorganizacao
                                    for x,y in pairs(orggrupos) do
                                        for l,m in pairs(y) do
                                            local infcargo = m
                                            local gruporemover = infcargo.cargoingame[1]

                                            vRP.remPermission(iddomembro,gruporemover)

                                            local staff = vRP.query('skdev_group/staffrecebervalor')
                                            if #staff > 0 then
                                                SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                            end
                                            enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                        end
                                    end
                                end
                            end
                        end
                        if baseatual == 'creativev3' then
                            local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                            for b,c in pairs(queryGrupos) do
                                local orgvalores = json.decode(c.valores)
                                if orgvalores ~= nil then
                                    local orggrupos = orgvalores.gruposorganizacao
                                    for x,y in pairs(orggrupos) do
                                        for l,m in pairs(y) do
                                            local infcargo = m
                                            local gruporemover = infcargo.cargoingame[1]

                                            vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = gruporemover})

                                            local staff = vRP.query('skdev_group/staffrecebervalor')
                                            if #staff > 0 then
                                                SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                            end
                                            enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                        end
                                    end
                                end
                            end
                        end
                        if baseatual == 'creativev2' then
                            local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                            for b,c in pairs(queryGrupos) do
                                local orgvalores = json.decode(c.valores)
                                if orgvalores ~= nil then
                                    local orggrupos = orgvalores.gruposorganizacao
                                    for x,y in pairs(orggrupos) do
                                        for l,m in pairs(y) do
                                            local infcargo = m
                                            local gruporemover = infcargo.cargoingame[1]

                                            vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = gruporemover})

                                            local staff = vRP.query('skdev_group/staffrecebervalor')
                                            if #staff > 0 then
                                                SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                            end
                                            enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                        end
                                    end
                                end
                            end
                        end
                        if baseatual == 'creativev1' then
                            local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                            for b,c in pairs(queryGrupos) do
                                local orgvalores = json.decode(c.valores)
                                if orgvalores ~= nil then
                                    local orggrupos = orgvalores.gruposorganizacao
                                    for x,y in pairs(orggrupos) do
                                        for l,m in pairs(y) do
                                            local infcargo = m
                                            local gruporemover = infcargo.cargoingame[1]

                                            vRP.remPermission(iddomembro,gruporemover)

                                            local staff = vRP.query('skdev_group/staffrecebervalor')
                                            if #staff > 0 then
                                                SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                            end
                                            enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                        end
                                    end
                                end
                            end
                        end

                        for m,n in pairs(cargosdomembro2) do
                            local nomedocargo = n

                            if baseatual == 'creativev6' then
                                local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                vRP.RemovePermission(iddomembro,grupoCFG)
                            end
                            if baseatual == 'creativev5' then
                                vRP.remPermission(iddomembro,nomedocargo)
                            end
                            if baseatual == 'creativev4' then
                                vRP.remPermission(iddomembro,nomedocargo)
                            end
                            if baseatual == 'creativev3' then
                                vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                            end
                            if baseatual == 'creativev2' then
                                vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                            end
                            if baseatual == 'creativev1' then
                                vRP.remPermission(iddomembro,nomedocargo)
                            end

                            table.insert(tabelacargosnovos,nomedocargo)
                            if baseatual == 'creativev6' then
                                local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                local vRPGroupsCFG = vRP.Groups()
                                if vRPGroupsCFG[grupoCFG] then
                                    for hIdx,HGrupo in pairs(vRPGroupsCFG[grupoCFG]["Hierarchy"]) do
                                        if subStrFind(HGrupo,permissaoCFG) then
                                            vRP.SetPermission(idmembro2,grupoCFG,hIdx,false)
                                        end
                                    end
                                end
                            end
                            if baseatual == 'creativev5' then
                                vRP.setPermission(iddomembro,nomedocargo)
                            end
                            if baseatual == 'creativev4' then
                                vRP.setPermission(iddomembro,nomedocargo)
                            end
                            if baseatual == 'creativev3' then
                                vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                                vRP.execute("vRP/add_group",{user_id = iddomembro, permiss = nomedocargo})
                            end
                            if baseatual == 'creativev2' then
                                vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                                vRP.execute("vRP/add_group",{user_id = iddomembro, permiss = nomedocargo})
                            end
                            if baseatual == 'creativev1' then
                                vRP.setPermission(iddomembro,nomedocargo)
                            end

                            if baseatual ~= 'creativev6' then
                                if vRP.getUserSource(iddomembro) then
                                    if baseatual == 'vrpex' then
                                        vRP.addUserGroup(iddomembro,nomedocargo)
                                    end
        
                                    local staff = vRP.query('skdev_group/staffrecebervalor')
                                    if #staff > 0 then
                                        SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..iddomembro.."```")
                                    end
                                    enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..iddomembro.."")
                                else
                                    if baseatual == 'vrpex' then
                                        local queryUserData = vRP.query("skdev_group/obterUserData")
                                        if #queryUserData > 0 then
                                            for k,v in pairs(queryUserData) do
                                                if v.dkey == 'vRP:datatable' then
                                                    local idusuario = v.user_id
                        
                                                    if idusuario == iddomembro then
                                                        local dvalue = json.decode(v.dvalue)
                                                        local gruposplayer = dvalue.groups
                        
                                                        local tabelaNovaUserData = {}
                                                        
                                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                                        if #staff > 0 then
                                                            SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                        end
                                                        enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..iddomembro.."")
                                                        tabelaNovaUserData[nomedocargo] = true
                                                        dvalue.groups = tabelaNovaUserData
                                                        vRP.execute("skdev_group/updateUserData",{user_id = iddomembro, dvalue = json.encode(dvalue)})
                                                        break
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        if baseatual == 'creativev6' then
                            vRP.Query("skdev_group/insertGrupos",{user_id = iddomembro,cargos = json.encode(tabelacargosnovos)})
                        else
                            vRP.execute("skdev_group/insertGrupos",{user_id = iddomembro,cargos = json.encode(tabelacargosnovos)})
                        end
                        return
                    end
                else
                    local tabelacargosnovos = {}
                    local cargosdomembro2 = json.decode(ValoresCargos)

                    if baseatual == 'creativev6' then
                        local grupos = vRP.Query("skdev_group/staffrecebergrupos")
                        for f,g in pairs(grupos) do
                            local permissaoremover = g.grupo
                            vRP.RemovePermission(iddomembro,permissaoremover)
                        end
                    end
                    if baseatual == 'vrpex' then
                        if vRP.getUserSource(idmembro2) then
                            local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                            for b,c in pairs(queryGrupos) do
                                local orgvalores = json.decode(c.valores)
                                if orgvalores ~= nil then
                                    local orggrupos = orgvalores.gruposorganizacao
                                    for x,y in pairs(orggrupos) do
                                        for l,m in pairs(y) do
                                            local infcargo = m
                                            local gruporemover = infcargo.cargoingame[1]

                                            vRP.removeUserGroup(idmembro2,gruporemover)
            
                                            local staff = vRP.query('skdev_group/staffrecebervalor')
                                            if #staff > 0 then
                                                SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..idmembro2.."```")
                                            end
                                            enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..idmembro2.."")
                                        end
                                    end
                                end
                            end
                        else
                            if baseatual == 'vrpex' then
                                local queryUserData = vRP.query("skdev_group/obterUserData")
                                if #queryUserData > 0 then
                                    for k,v in pairs(queryUserData) do
                                        if v.dkey == 'vRP:datatable' then
                                            local idusuario = v.user_id

                                            if idusuario == idmembro2 then
                                                local dvalue = json.decode(v.dvalue)
                                                local gruposplayer = dvalue.groups

                                                local tabelaNovaUserData = {}

                                                dvalue.groups = tabelaNovaUserData
                                                vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                break
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if baseatual == 'creativev5' then
                        local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                        for b,c in pairs(queryGrupos) do
                            local orgvalores = json.decode(c.valores)
                            if orgvalores ~= nil then
                                local orggrupos = orgvalores.gruposorganizacao
                                for x,y in pairs(orggrupos) do
                                    for l,m in pairs(y) do
                                        local infcargo = m
                                        local gruporemover = infcargo.cargoingame[1]

                                        vRP.remPermission(iddomembro,gruporemover)

                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                        if #staff > 0 then
                                            SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                        end
                                        enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                    end
                                end
                            end
                        end
                    end
                    if baseatual == 'creativev4' then
                        local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                        for b,c in pairs(queryGrupos) do
                            local orgvalores = json.decode(c.valores)
                            if orgvalores ~= nil then
                                local orggrupos = orgvalores.gruposorganizacao
                                for x,y in pairs(orggrupos) do
                                    for l,m in pairs(y) do
                                        local infcargo = m
                                        local gruporemover = infcargo.cargoingame[1]

                                        vRP.remPermission(iddomembro,gruporemover)

                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                        if #staff > 0 then
                                            SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                        end
                                        enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                    end
                                end
                            end
                        end
                    end
                    if baseatual == 'creativev3' then
                        local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                        for b,c in pairs(queryGrupos) do
                            local orgvalores = json.decode(c.valores)
                            if orgvalores ~= nil then
                                local orggrupos = orgvalores.gruposorganizacao
                                for x,y in pairs(orggrupos) do
                                    for l,m in pairs(y) do
                                        local infcargo = m
                                        local gruporemover = infcargo.cargoingame[1]

                                        vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = gruporemover})

                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                        if #staff > 0 then
                                            SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                        end
                                        enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                    end
                                end
                            end
                        end
                    end
                    if baseatual == 'creativev2' then
                        local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                        for b,c in pairs(queryGrupos) do
                            local orgvalores = json.decode(c.valores)
                            if orgvalores ~= nil then
                                local orggrupos = orgvalores.gruposorganizacao
                                for x,y in pairs(orggrupos) do
                                    for l,m in pairs(y) do
                                        local infcargo = m
                                        local gruporemover = infcargo.cargoingame[1]

                                        vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = gruporemover})

                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                        if #staff > 0 then
                                            SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                        end
                                        enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                    end
                                end
                            end
                        end
                    end
                    if baseatual == 'creativev1' then
                        local queryGrupos = vRP.query("skdev_group/staffrecebergrupos")
                        for b,c in pairs(queryGrupos) do
                            local orgvalores = json.decode(c.valores)
                            if orgvalores ~= nil then
                                local orggrupos = orgvalores.gruposorganizacao
                                for x,y in pairs(orggrupos) do
                                    for l,m in pairs(y) do
                                        local infcargo = m
                                        local gruporemover = infcargo.cargoingame[1]

                                        vRP.remPermission(iddomembro,gruporemover)

                                        local staff = vRP.query('skdev_group/staffrecebervalor')
                                        if #staff > 0 then
                                            SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."```")
                                        end
                                        enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU O GRUPO: "..gruporemover.." DO JOGADOR DE ID: "..iddomembro.."")
                                    end
                                end
                            end
                        end
                    end
                    
                    for m,n in pairs(cargosdomembro2) do
                        local nomedocargo = n

                        if baseatual == 'creativev6' then
                            local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                            vRP.RemovePermission(iddomembro,grupoCFG)
                        end
                        if baseatual == 'creativev5' then
                            vRP.remPermission(iddomembro,nomedocargo)
                        end
                        if baseatual == 'creativev4' then
                            vRP.remPermission(iddomembro,nomedocargo)
                        end
                        if baseatual == 'creativev3' then
                            vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                        end
                        if baseatual == 'creativev2' then
                            vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                        end
                        if baseatual == 'creativev1' then
                            vRP.remPermission(iddomembro,nomedocargo)
                        end
                        
                        table.insert(tabelacargosnovos,nomedocargo)
                        if baseatual == 'creativev6' then
                            local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                            local vRPGroupsCFG = vRP.Groups()
                            if vRPGroupsCFG[grupoCFG] then
                                for hIdx,HGrupo in pairs(vRPGroupsCFG[grupoCFG]["Hierarchy"]) do
                                    if subStrFind(HGrupo,permissaoCFG) then
                                        vRP.SetPermission(iddomembro,grupoCFG,hIdx,false)
                                    end
                                end
                            end
                        end
                        if baseatual == 'creativev5' then
                            vRP.setPermission(iddomembro,nomedocargo)
                        end
                        if baseatual == 'creativev4' then
                            vRP.setPermission(iddomembro,nomedocargo)
                        end
                        if baseatual == 'creativev3' then
                            vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                            vRP.execute("vRP/add_group",{user_id = iddomembro, permiss = nomedocargo})
                        end
                        if baseatual == 'creativev2' then
                            vRP.execute("vRP/del_group",{user_id = iddomembro, permiss = nomedocargo})
                            vRP.execute("vRP/add_group",{user_id = iddomembro, permiss = nomedocargo})
                        end
                        if baseatual == 'creativev1' then
                            vRP.setPermission(iddomembro,nomedocargo)
                        end

                        if baseatual ~= 'creativev6' then
                            if vRP.getUserSource(iddomembro) then
                                if baseatual == 'vrpex' then
                                    vRP.addUserGroup(iddomembro,nomedocargo)
                                end
        
                                local staff = vRP.query('skdev_group/staffrecebervalor')
                                if #staff > 0 then
                                    SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..iddomembro.."```")
                                end
                                enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..iddomembro.."")
                            else
                                if baseatual == 'vrpex' then
                                    local queryUserData = vRP.query("skdev_group/obterUserData")
                                    if #queryUserData > 0 then
                                        for k,v in pairs(queryUserData) do
                                            if v.dkey == 'vRP:datatable' then
                                                local idusuario = v.user_id
                    
                                                if idusuario == iddomembro then
                                                    local dvalue = json.decode(v.dvalue)
                                                    local gruposplayer = dvalue.groups
                    
                                                    local tabelaNovaUserData = {}
            
                                                    local staff = vRP.query('skdev_group/staffrecebervalor')
                                                    if #staff > 0 then
                                                        SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..iddomembro.."```")
                                                    end
                                                    enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU O GRUPO: "..nomedocargo.." DO JOGADOR DE ID: "..iddomembro.."")
                                                    tabelaNovaUserData[nomedocargo] = true
                                                    dvalue.groups = tabelaNovaUserData
                                                    vRP.execute("skdev_group/updateUserData",{user_id = iddomembro, dvalue = json.encode(dvalue)})
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
            
                    if baseatual == 'creativev6' then
                        vRP.Query("skdev_group/insertGrupos",{user_id = iddomembro,cargos = json.encode(tabelacargosnovos)})
                    else
                        vRP.execute("skdev_group/insertGrupos",{user_id = iddomembro,cargos = json.encode(tabelacargosnovos)})
                    end
                end
            end
        end
    end
end

function skdevs.adicionarHorasBlacklist(iddocidadao,horasblacklist)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    if skdevs.verificarPermissaoStaff(user_id,'Gerenciar Cidadoes') then
        if not skdevs.verificarPermissaoStaff(parseInt(iddocidadao),'Membros Protegidos') then
            local horasamais = parseInt(horasblacklist)
            local data_atual = os.time()
            local data_futura = data_atual + (horasamais * 3600)
            local formato_data = os.date("%X %d/%m/%Y", data_futura)
        
            local existe = false
            local queryBlacklist = {}
            if baseatual == 'creativev6' then
                queryBlacklist = vRP.Query("skdev_group/blacklistall")
            else
                queryBlacklist = vRP.query("skdev_group/blacklistall")
            end
            local dispoBlacklist = #queryBlacklist > 0

            local staff = {}
            if baseatual == 'creativev6' then
                staff = vRP.Query('skdev_group/staffrecebervalor')
            else
                staff = vRP.query('skdev_group/staffrecebervalor')
            end
            if #staff > 0 then
                SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." ADICIONOU BLACKLIST NO JOGADOR DE ID: "..parseInt(iddocidadao).." HORAS ADICIONADAS: "..formato_data.."```")
            end
            enviarLogNoPainelAdm("[ID]: "..user_id.." ADICIONOU BLACKLIST NO JOGADOR DE ID: "..parseInt(iddocidadao).." HORAS ADICIONADAS: "..formato_data.."")
            if dispoBlacklist then
                for posicao,tabela in pairs(queryBlacklist) do
                    local idusuarios = parseInt(tabela.user_id)
                    local idusuario = parseInt(iddocidadao)
        
                    if idusuario == idusuarios then
                        existe = true
                    end
                end

                if not existe then
                    if baseatual == 'creativev6' then
                        vRP.Query("skdev_group/insertblacklist",{user_id = iddocidadao, valor = formato_data})
                    else
                        vRP.execute("skdev_group/insertblacklist",{user_id = iddocidadao, valor = formato_data})
                    end
                else
                    if baseatual == 'creativev6' then
                        vRP.Query("skdev_group/updateblacklist",{user_id = iddocidadao, valor = formato_data})
                    else
                        vRP.execute("skdev_group/updateblacklist",{user_id = iddocidadao, valor = formato_data})
                    end
                end
            else
                if baseatual == 'creativev6' then
                    vRP.Query("skdev_group/insertblacklist",{user_id = iddocidadao, valor = formato_data})
                else
                    vRP.execute("skdev_group/insertblacklist",{user_id = iddocidadao, valor = formato_data})
                end
            end
        end
    end
end

function skdevs.removerBlacklistHoras(iddocidadao)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local idusuario = parseInt(iddocidadao)

    if skdevs.verificarPermissaoStaff(user_id,'Gerenciar Cidadoes') then
        if not skdevs.verificarPermissaoStaff(idusuario,'Membros Protegidos') then
            local horasamais = parseInt(horasblacklist)
            local data_atual = os.time()
            local data_futura = data_atual + (horasamais * 3600)
            local formato_data = os.date("%X %d/%m/%Y", data_futura)
        
            local existe = false
            local queryBlacklist = {}
            if baseatual == 'creativev6' then
                queryBlacklist = vRP.Query("skdev_group/blacklistall")
            else
                queryBlacklist = vRP.query("skdev_group/blacklistall")
            end
            local dispoBlacklist = #queryBlacklist > 0

            local staff = {}
            if baseatual == 'creativev6' then
                staff = vRP.Query('skdev_group/staffrecebervalor')
            else
                staff = vRP.query('skdev_group/staffrecebervalor')
            end
            if #staff > 0 then
                SendWebhookMessage(staff[1].logdegerenciarcidadoes,"```prolog\nNovo Cidadao Gerenciado!!!!\n\n[ID]: "..user_id.." REMOVEU BLACKLIST NO JOGADOR DE ID: "..parseInt(idusuario).."```")
            end
            enviarLogNoPainelAdm("[ID]: "..user_id.." REMOVEU BLACKLIST NO JOGADOR DE ID: "..parseInt(idusuario).."")
            if dispoBlacklist then
                for posicao,tabela in pairs(queryBlacklist) do
                    local idusuarios = parseInt(tabela.user_id)
        
                    if idusuario == idusuarios then
                        existe = true
                    end
                end
        
                if existe then
                    if baseatual == 'creativev6' then
                        vRP.Query("skdev_group/deleteblacklist",{user_id = idusuario})
                    else
                        vRP.execute("skdev_group/deleteblacklist",{user_id = idusuario})
                    end
                end
            end
        end
    end
end

function skdevs.verificarPermissaoStaff(idusuario,nomedapermissao)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local idpesquisa = 0

    if idusuario then
        idpesquisa = parseInt(idusuario)
    else
        idpesquisa = parseInt(user_id)
    end

    if baseatual == 'creativev6' then
        if vRP.HasPermission(idpesquisa,cargoadministrador,false) then
            return true
        end
    else
        if vRP.hasPermission(idpesquisa,cargoadministrador) then
            return true
        end
    end

    local queryPermiss = {}
    if baseatual == 'creativev6' then
        queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    if #queryPermiss > 0 then
        for posicao,tabela in pairs(queryPermiss) do
            local idusuarios = parseInt(tabela.user_id)
            local grupos = json.decode(tabela.cargos)

            if idusuarios == idpesquisa then
                if grupos ~= nil then
                    if #grupos > 0 then
                        for posicao,nomedocargo in pairs(grupos) do
                            local nomedocargoplayer = nomedocargo
    
                            local queryStaff = {}
                            if baseatual == 'creativev6' then
                                queryStaff = vRP.Query("skdev_group/staffrecebervalor")
                            else
                                queryStaff = vRP.query("skdev_group/staffrecebervalor")
                            end
                            if #queryStaff > 0 then
                                local grupos = json.decode(queryStaff[1].cargos)
                                local gruposDispo = grupos ~= nil
                                if gruposDispo then
                                    local gruposDispo2 = #grupos > 0
                                    if gruposDispo2 then
                                        for posicao,grupos2 in pairs(grupos) do
                                            for cargonome,detalhes in pairs(grupos) do
                                                for cargonome,detalhes in pairs(detalhes) do
                                                    local cargoingamestaff = detalhes.cargoingame[1]
                                                    
                                                    if cargoingamestaff == nomedocargoplayer then
                                                        local permissoescargo = detalhes.permissoes[1]
                                                        if #permissoescargo > 0 then
                                                            for _,nomedapermissaodocargo in pairs(permissoescargo) do
                                                                if nomedapermissaodocargo == nomedapermissao then
                                                                    return true
                                                                end
                                                            end
                                                        else
                                                            return false
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        return false
                                    end
                                else
                                    return false
                                end
                            else
                                return false
                            end
                        end
                    end
                end
            end
        end
    else
        return false
    end

    return false
end

logadmtabela = {nil,nil,nil}

posicaodelogatual = 0
function enviarLogNoPainelAdm(logmensagem)
    if posicaodelogatual == 3 then
        posicaodelogatual = 0
    end

    posicaodelogatual = posicaodelogatual+1

    logadmtabela[posicaodelogatual] = logmensagem
end

function skdevs.deletarOrganizacaoStaffGrupo(nomedaorg)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    if skdevs.verificarPermissaoStaff(user_id,'Gerenciar Organizações') then
        if baseatual == 'creativev6' then
            vRP.Query("skdev_group/deleteGroup",{nomedogrupo = nomedaorg})
        else
            vRP.execute("skdev_group/deleteGroup",{nomedogrupo = nomedaorg})
        end
    end
end

-- Parte de Organizações

function verificarPermissaoOrg(user_id)
    local atualorganizacao = ""

    local queryPerms = {}
    if baseatual == 'creativev6' then
        queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local permDisponivel = #queryPerms > 0
    local queryOrgs = {}
    if baseatual == 'creativev6' then
        queryOrgs = vRP.Query("skdev_group/staffrecebergrupos")
    else
        queryOrgs = vRP.query("skdev_group/staffrecebergrupos")
    end
    local orgsDisponivel = #queryOrgs > 0
    if permDisponivel then
        for posicao,tabela in pairs(queryPerms) do
            local idusuarios = parseInt(tabela.user_id)
            local grupousuarios = json.decode(tabela.cargos)
            
            if idusuarios == user_id then
                if grupousuarios ~= nil then
                    for posicao,nomedogrupo in pairs(grupousuarios) do
                        if orgsDisponivel then
                            for posicao,tabela in pairs(queryOrgs) do
                                for k,v in pairs(tabela) do
                                    if k == 'valores' then
                                        local grupos = json.decode(v)
                                        if grupos ~= nil then
                                            if #grupos.gruposorganizacao > 0 then
                                                for b,c in pairs(grupos.gruposorganizacao) do
                                                    for nomedocargo,valores in pairs(c) do
                                                        local cargoingame = valores.cargoingame[1]
                                                        atualorganizacao = tabela.grupo

                                                        if baseatual == 'creativev6' then
                                                            if subStrFind(nomedogrupo,atualorganizacao) then
                                                                return true
                                                            end
                                                        else
                                                            if cargoingame == nomedogrupo then
                                                                return true
                                                            end
                                                        end
                                                    end
                                                end
                                            else
                                                return false
                                            end
                                        else
                                            return false
                                        end
                                    end
                                end
                            end
                        else
                            return false
                        end
                    end
                end
            end
        end
    else
        return false
    end

    return false
end

function skdevs.verificarPermOrganizacao()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    return verificarPermissaoOrg(user_id)
end

function skdevs.VerificarInformacoesPlayerLocalOrganizacoes()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local identidade = ''
    local nomeplayer = ''
    local nomeplayer2 = ''
    local atualorganizacao = ''
    if baseatual == 'creativev6' then
        identidade = vRP.Identity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomeplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev5' then
        identidade = vRP.userIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomeplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev4' then
        identidade = vRP.userIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomeplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev3' then
        identidade = vRP.userIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomeplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev2' then
        identidade = vRP.getUserIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomeplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'creativev1' then
        identidade = vRP.userIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.name2..' #'..user_id
        nomeplayer2 = identidade.name..' '..identidade.name2
    end
    if baseatual == 'vrpex' then
        identidade = vRP.getUserIdentity(user_id)
        nomeplayer = identidade.name..' '..identidade.firstname..' #'..user_id
        nomeplayer2 = identidade.name..' '..identidade.firstname
    end

    local orgplayer = false
    local cargoplayer = false
    local membrostotais = 0
    local membrosonline = 0
    local membrosoffline = 0
    local imagemplayer = false
    local Ultimalogorganizacao1 = false
    local Ultimalogorganizacao2 = false
    local Ultimalogorganizacao3 = false

    local queryPerms = {}
    if baseatual == 'creativev6' then
        queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local dispoPerms = #queryPerms > 0
    if dispoPerms then
        for posicao,tabela in pairs(queryPerms) do
            local idusuarios = parseInt(tabela.user_id)
            local idusuario = parseInt(user_id)
            local imagemlink = tabela.imagemlink
            local cargos = json.decode(tabela.cargos)

            if idusuarios == idusuario then
                if #imagemlink > 0 then
                    imagemplayer = imagemlink
                end

                if cargos ~= nil then
                    if #cargos > 0 then
                        for posicao,nomedocargo in pairs(cargos) do
                            local nomedocargoset = nomedocargo
    
                            local queryGroups = {}
                            if baseatual == 'creativev6' then
                                queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                            else
                                queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                            end
                            local dispoGroups = #queryGroups > 0
                            if dispoGroups then
                                for posicao,tabela in pairs(queryGroups) do
                                    for k,v in pairs(tabela) do
                                        if k == 'valores' then
                                            local grupos = json.decode(v)
                                            if grupos ~= nil then
                                                if #grupos.gruposorganizacao > 0 then
                                                    for b,c in pairs(grupos.gruposorganizacao) do
                                                        for nomedocargo,valores in pairs(c) do
                                                            local cargoingame = valores.cargoingame[1]
                                                            atualorganizacao = tabela.grupo

                                                            if baseatual == 'creativev6' then
                                                                local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                if subStrFind(permissaoCFG,cargoingame) then
                                                                    if not valores.cargoinvisivelstatus then
                                                                        orgplayer = tabela.grupo
    
                                                                        Ultimalogorganizacao1 = visualizarLogOrgPropia(orgplayer,1)
                                                                        Ultimalogorganizacao2 = visualizarLogOrgPropia(orgplayer,2)
                                                                        Ultimalogorganizacao3 = visualizarLogOrgPropia(orgplayer,3)
    
                                                                        cargoplayer = nomedocargo
                                                                    end
                                                                end
                                                            else
                                                                if nomedocargoset == cargoingame then
                                                                    if not valores.cargoinvisivelstatus then
                                                                        orgplayer = tabela.grupo
    
                                                                        Ultimalogorganizacao1 = visualizarLogOrgPropia(orgplayer,1)
                                                                        Ultimalogorganizacao2 = visualizarLogOrgPropia(orgplayer,2)
                                                                        Ultimalogorganizacao3 = visualizarLogOrgPropia(orgplayer,3)
    
                                                                        cargoplayer = nomedocargo
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if cargos ~= nil then
                if #cargos > 0 then
                    for posicao,nomedocargo in pairs(cargos) do
                        local nomedocargoset = nomedocargo

                        local queryGroups = {}
                        if baseatual == 'creativev6' then
                            queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                        else
                            queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                        end
                        local dispoGroups = #queryGroups > 0
                        if dispoGroups then
                            for posicao,tabela in pairs(queryGroups) do
                                for k,v in pairs(tabela) do
                                    if k == 'valores' then
                                        if tabela.grupo == orgplayer then
                                            local grupos = json.decode(v)
                                            if grupos ~= nil then
                                                if #grupos.gruposorganizacao > 0 then
                                                    for b,c in pairs(grupos.gruposorganizacao) do
                                                        for nomedocargo,valores in pairs(c) do
                                                            local cargoingame = valores.cargoingame[1]

                                                            if baseatual == 'creativev6' then
                                                                local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                if subStrFind(permissaoCFG,cargoingame) then
                                                                    if not valores.cargoinvisivelstatus then
                                                                        membrostotais = membrostotais+1
                
                                                                        if vRP.Source(idusuarios) then
                                                                            membrosonline = membrosonline+1
                                                                        else
                                                                            membrosoffline = membrosoffline+1
                                                                        end
                                                                    end
                                                                end
                                                            else
                                                                if nomedocargoset == cargoingame then
                                                                    if not valores.cargoinvisivelstatus then
                                                                        membrostotais = membrostotais+1

                                                                        if vRP.getUserSource(idusuarios) then
                                                                            membrosonline = membrosonline+1
                                                                        else
                                                                            membrosoffline = membrosoffline+1
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return nomeplayer2,nomeplayer,orgplayer,cargoplayer,membrostotais,membrosonline,membrosoffline,imagemplayer,Ultimalogorganizacao1,Ultimalogorganizacao2,Ultimalogorganizacao3
end

function skdevs.grupopropioreceberInformacoes(iddomembro)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local idpesquisa = 0
    if iddomembro then
        idpesquisa = parseInt(iddomembro)
    else
        idpesquisa = parseInt(user_id)
    end

    local imagemorgpropia = ''
    local nomeorgpropia = ''
    local membrostotaisorgpropia = 0
    local membrosonlineorgpropia = 0
    local membrosofflineorgpropia = 0
    local membrosorgpropia = {}

    local queryPerms = {}
    if baseatual == 'creativev6' then
        queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local dispoPerms = #queryPerms > 0
    if dispoPerms then
        for posicao,tabela in pairs(queryPerms) do
            local idusuarios = parseInt(tabela.user_id)
            local idusuario = parseInt(idpesquisa)
            local cargos = json.decode(tabela.cargos)

            if idusuarios == idusuario then   
                if cargos ~= nil then
                    if #cargos > 0 then
                        for posicao,nomedocargo in pairs(cargos) do
                            local nomedocargoset = nomedocargo
    
                            local queryGroups = {}
                            if baseatual == 'creativev6' then
                                queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                            else
                                queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                            end
                            local dispoGroups = #queryGroups > 0
                            if dispoGroups then
                                for posicao,tabela in pairs(queryGroups) do
                                    for k,v in pairs(tabela) do
                                        if k == 'valores' then
                                            local grupos = json.decode(v)
                                            if grupos ~= nil then
                                                if #grupos.gruposorganizacao > 0 then
                                                    for b,c in pairs(grupos.gruposorganizacao) do
                                                        for nomedocargo,valores in pairs(c) do
                                                            local cargoingame = valores.cargoingame[1]

                                                            if baseatual == 'creativev6' then
                                                                local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                if subStrFind(permissaoCFG,cargoingame) then
                                                                    imagemorgpropia = grupos.imagemorg
                                                                    nomeorgpropia = tabela.grupo
                                                                end
                                                            else
                                                                if nomedocargoset == cargoingame then
                                                                    imagemorgpropia = grupos.imagemorg
                                                                    nomeorgpropia = tabela.grupo
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if cargos ~= nil then
                if #cargos > 0 then
                    for posicao,nomedocargo in pairs(cargos) do
                        local nomedocargoset = nomedocargo

                        local queryGroups = {}
                        if baseatual == 'creativev6' then
                            queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                        else
                            queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                        end
                        local dispoGroups = #queryGroups > 0
                        if dispoGroups then
                            for posicao,tabela in pairs(queryGroups) do
                                for k,v in pairs(tabela) do
                                    if k == 'valores' then
                                        if tabela.grupo == nomeorgpropia then
                                            local grupos = json.decode(v)
                                            if grupos ~= nil then
                                                if #grupos.gruposorganizacao > 0 then
                                                    for b,c in pairs(grupos.gruposorganizacao) do
                                                        for nomedocargo,valores in pairs(c) do
                                                            local cargoingame = valores.cargoingame[1]

                                                            if baseatual == 'creativev6' then
                                                                local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                if subStrFind(permissaoCFG,cargoingame) then
                                                                    if not valores.cargoinvisivelstatus then
                                                                        membrostotaisorgpropia = membrostotaisorgpropia+1
    
                                                                        if vRP.Source(idusuarios) then
                                                                            membrosonlineorgpropia = membrosonlineorgpropia+1
        
                                                                            identidadeusuarios = ''

                                                                            identidadeusuarios = vRP.Identity(idusuarios)
                                                                            membrosorgpropia[#membrosorgpropia+1] = {status = 'online', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                        else
                                                                            membrosofflineorgpropia = membrosofflineorgpropia+1
        
                                                                            identidadeusuarios = ''

                                                                            identidadeusuarios = vRP.Identity(idusuarios)
                                                                            membrosorgpropia[#membrosorgpropia+1] = {status = 'offline', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                        end
                                                                    end
                                                                end
                                                            else
                                                                if nomedocargoset == cargoingame then
                                                                    if not valores.cargoinvisivelstatus then
                                                                        membrostotaisorgpropia = membrostotaisorgpropia+1

                                                                        if vRP.getUserSource(idusuarios) then
                                                                            membrosonlineorgpropia = membrosonlineorgpropia+1
        
                                                                            identidadeusuarios = ''
                                                                            if baseatual == 'creativev5' then
                                                                                identidadeusuarios = vRP.userIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'online', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'creativev4' then
                                                                                identidadeusuarios = vRP.userIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'online', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'creativev3' then
                                                                                identidadeusuarios = vRP.userIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'online', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'creativev2' then
                                                                                identidadeusuarios = vRP.getUserIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'online', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'creativev1' then
                                                                                identidadeusuarios = vRP.userIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'online', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'vrpex' then
                                                                                identidadeusuarios = vRP.getUserIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'online', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.firstname..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                        else
                                                                            membrosofflineorgpropia = membrosofflineorgpropia+1
        
                                                                            identidadeusuarios = ''
                                                                            if baseatual == 'creativev5' then
                                                                                identidadeusuarios = vRP.userIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'offline', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'creativev4' then
                                                                                identidadeusuarios = vRP.userIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'offline', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'creativev3' then
                                                                                identidadeusuarios = vRP.userIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'offline', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'creativev2' then
                                                                                identidadeusuarios = vRP.getUserIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'offline', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'creativev1' then
                                                                                identidadeusuarios = vRP.userIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'offline', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.name2..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                            if baseatual == 'vrpex' then
                                                                                identidadeusuarios = vRP.getUserIdentity(idusuarios)
                                                                                membrosorgpropia[#membrosorgpropia+1] = {status = 'offline', iddomembro = idusuarios, nomedomembro = identidadeusuarios.name..' '..identidadeusuarios.firstname..' #'..idusuarios, cargodomembro = nomedocargo}
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return imagemorgpropia,nomeorgpropia,membrostotaisorgpropia,membrosonlineorgpropia,membrosofflineorgpropia,membrosorgpropia
end

function skdevs.editarInformacoesOrgPropia(nomeantigoorg,nomenovodaorg,imagemdaorg)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    if skdevs.verificarPermissoesOrgPropia(user_id,'Gerenciar Grupo') then
        local queryPerms = {}
        if baseatual == 'creativev6' then
            queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
        else
            queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
        end
        local dispoPerms = #queryPerms > 0
        if dispoPerms then
            for posicao,tabela in pairs(queryPerms) do
                local idusuarios = parseInt(tabela.user_id)
                local idusuario = parseInt(user_id)
                local cargos = json.decode(tabela.cargos)
    
                if idusuarios == idusuario then   
                    if cargos ~= nil then
                        if #cargos > 0 then
                            for posicao,nomedocargo in pairs(cargos) do
                                local nomedocargoset = nomedocargo
        
                                local queryGroups = {}
                                if baseatual == 'creativev6' then
                                    queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                else
                                    queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                end
                                local dispoGroups = #queryGroups > 0
                                if dispoGroups then
                                    for posicao,tabela in pairs(queryGroups) do
                                        for k,v in pairs(tabela) do
                                            if k == 'valores' then
                                                local grupos = json.decode(v)
                                                if grupos ~= nil then
                                                    if #grupos.gruposorganizacao > 0 then
                                                        for b,c in pairs(grupos.gruposorganizacao) do
                                                            for nomedocargo,valores in pairs(c) do
                                                                local cargoingame = valores.cargoingame[1]

                                                                if baseatual ~= 'creativev6' then
                                                                    if nomedocargoset == cargoingame then
                                                                        grupos.imagemorg = imagemdaorg
        
                                                                        SendWebhookMessage(grupos.logedicaodaorganizacao,"```prolog\nOrganizacao Editada!!!\n\n[ID]: "..user_id.." EDITOU A ORGANIZACAO, NOME NOVO: "..nomenovodaorg.."```")
                                                                        SendWebhookMessage(grupos.loggeral,"```prolog\nOrganizacao Editada!!!\n\n[ID]: "..user_id.." EDITOU A ORGANIZACAO, NOME NOVO: "..nomenovodaorg.."```")
                                                                        enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." EDITOU A ORGANIZACAO, NOME NOVO: "..nomenovodaorg.." ")
    
                                                                        if baseatual == 'creativev6' then
                                                                            vRP.Query("skdev_group/editarorganizacao",{nomeantigodogrupo = nomeantigoorg, nomenovodogrupo = nomenovodaorg, valoresnovos = json.encode(grupos)})
                                                                        else
                                                                            vRP.execute("skdev_group/editarorganizacao",{nomeantigodogrupo = nomeantigoorg, nomenovodogrupo = nomenovodaorg, valoresnovos = json.encode(grupos)})
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.orgpropiareceberinformacoes()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local organizacao = {}
    local queryPerms = {}
    if baseatual == 'creativev6' then
        queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local dispoPerms = #queryPerms > 0
    if dispoPerms then
        for posicao,tabela in pairs(queryPerms) do
            local idusuarios = parseInt(tabela.user_id)
            local idusuario = parseInt(user_id)
            local cargos = json.decode(tabela.cargos)
            
            if idusuarios == idusuario then   
                if cargos ~= nil then
                    if #cargos > 0 then
                        for posicao,nomedocargo in pairs(cargos) do
                            local nomedocargoset = nomedocargo
                            
                            local queryGroups = {}
                            if baseatual == 'creativev6' then
                                queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                            else
                                queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                            end
                            local dispoGroups = #queryGroups > 0
                            if dispoGroups then
                                for posicao,tabela in pairs(queryGroups) do
                                    for k,v in pairs(tabela) do
                                        if k == 'valores' then
                                            local nomeorganizacao = queryGroups[posicao]["grupo"]
                                            local grupos = json.decode(v)
                                            if grupos ~= nil then
                                                if #grupos.gruposorganizacao > 0 then
                                                    for b,c in pairs(grupos.gruposorganizacao) do
                                                        for nomedocargo,valores in pairs(c) do
                                                            local cargoingame = valores.cargoingame[1]
    
                                                            if baseatual == 'creativev6' then
                                                                local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                if subStrFind(permissaoCFG,cargoingame) then
                                                                    for m,n in pairs(grupos.gruposorganizacao) do
                                                                        for p,o in pairs(n) do
                                                                            organizacao[#organizacao+1] = {nomedocargo = p, nomedocargoingame = o.cargoingame[1].."-"..nomeorganizacao}
                                                                        end
                                                                    end
        
                                                                    return organizacao
                                                                end
                                                            else
                                                                if nomedocargoset == cargoingame then
                                                                    for m,n in pairs(grupos.gruposorganizacao) do
                                                                        for p,o in pairs(n) do
                                                                            organizacao[#organizacao+1] = {nomedocargo = p, nomedocargoingame = o.cargoingame[1]}
                                                                        end
                                                                    end
        
                                                                    return organizacao
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.adicionarCargosNoMembro(iddomembroset,cargosreceber)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local staffposicao = 0
    local cancelar = false
    local membroverificado = false
    local acheiposicao = false

    local orgReceber = ''

    if user_id ~= parseInt(iddomembroset) then
        local LogMembrosAdicionados = ''
        local LogMembrosAcoesGeral = ''
        local nomeOrgPropia = ''

        local queryGroups = {}
        if baseatual == 'creativev6' then
            queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
        else
            queryGroups = vRP.query("skdev_group/staffrecebergrupos")
        end
        local dispoGroups = #queryGroups > 0
        if dispoGroups then
            for posicao,tabela in pairs(queryGroups) do
                for k,v in pairs(tabela) do
                    if k == 'valores' then
                        local grupos = json.decode(v)
                        if grupos ~= nil then
                            if #grupos.gruposorganizacao > 0 then
                                for b,c in pairs(grupos.gruposorganizacao) do
                                    for nomedocargo,valores in pairs(c) do
                                        local cargoingame = valores.cargoingame[1]

                                        for k,v in pairs(cargosreceber) do
                                            if baseatual == 'creativev6' then
                                                local permissaoCFG, grupoCFG = string.match(v, "([^%-]+)%-(.+)")
                                                if subStrFind(permissaoCFG,cargoingame) then
                                                    orgReceber = tabela.grupo
                                                end
                                            else
                                                if v == cargoingame then
                                                    orgReceber = tabela.grupo
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        local queryPerms = {}
        if baseatual == 'creativev6' then
            queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
        else
            queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
        end
        local dispoPerms = #queryPerms > 0
        if dispoPerms then
            for posicao,tabela in pairs(queryPerms) do
                local idusuarios = parseInt(tabela.user_id)
                local cargos = json.decode(tabela.cargos)
                
                if idusuarios == user_id then
                    if cargos ~= nil then
                        if #cargos > 0 then
                            for posicao,nomedocargo in pairs(cargos) do
                                local nomedocargoset = nomedocargo
                                
                                local queryGroups = {}
                                if baseatual == 'creativev6' then
                                    queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                else
                                    queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                end
                                local dispoGroups = #queryGroups > 0
                                if dispoGroups then
                                    for posicao,tabela in pairs(queryGroups) do
                                        for k,v in pairs(tabela) do
                                            if k == 'valores' then
                                                local grupos = json.decode(v)
                                                if grupos ~= nil then
                                                    if #grupos.gruposorganizacao > 0 then
                                                        for b,c in pairs(grupos.gruposorganizacao) do
                                                            for nomedocargo,valores in pairs(c) do
                                                                local cargoingame = valores.cargoingame[1]

                                                                if baseatual == 'creativev6' then
                                                                    local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                    if subStrFind(permissaoCFG,cargoingame) then
                                                                        if not valores.cargoinvisivelstatus then
                                                                            if orgReceber == tabela.grupo then
                                                                                if not acheiposicao then
                                                                                    staffposicao = b
                                                                                    LogMembrosAdicionados = grupos.logmembrosadicionados
                                                                                    LogMembrosAcoesGeral = grupos.loggeral
                                                                                    nomeOrgPropia = tabela.grupo
                                                                                    
                                                                                    local maximodemembros = grupos.maximomembrosorg
                                                                                    local _,_,membrostotais,_,_,_ = skdevs.grupopropioreceberInformacoes(user_id)
                                                                                    
                                                                                    if parseInt(membrostotais) >= parseInt(maximodemembros) then
                                                                                        return false
                                                                                    end
                                                                                    acheiposicao = true
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                else
                                                                    if nomedocargoset == cargoingame then
                                                                        if not valores.cargoinvisivelstatus then
                                                                            if orgReceber == tabela.grupo then
                                                                                if not acheiposicao then
                                                                                    staffposicao = b
                                                                                    LogMembrosAdicionados = grupos.logmembrosadicionados
                                                                                    LogMembrosAcoesGeral = grupos.loggeral
                                                                                    nomeOrgPropia = tabela.grupo
                                                                                    
                                                                                    local maximodemembros = grupos.maximomembrosorg
                                                                                    local _,_,membrostotais,_,_,_ = skdevs.grupopropioreceberInformacoes(user_id)
                                                                                    
                                                                                    if parseInt(membrostotais) >= parseInt(maximodemembros) then
                                                                                        return false
                                                                                    end
                                                                                    acheiposicao = true
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        if skdevs.verificarPermissoesOrgPropia(user_id,'Adicionar Membros',orgReceber) then
            if not skdevs.verificarPermissoesOrgPropia(parseInt(iddomembroset),'Membros Protegidos',orgReceber) then
                local ValoresCargos = json.encode(cargosreceber)
                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
                if #queryPermiss > 0 then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembroset)

                        if idmembro == idmembro2 then
                            membroverificado = true
                        end

                        if membroverificado then
                            if idmembro == idmembro2 then
                                if baseatual == 'creativev6' then
                                    if vRP.Source(idmembro2) then
                                        local conviteAdicionar = vRP.Request(vRP.Source(idmembro2),'Deseja entrar para a organização: '..nomeOrgPropia..'?',"Sim","Não")
                                        if conviteAdicionar then
                                            local tabelacargosnovos = {}
    
                                            local cargosdomembro = json.decode(v.cargos)
                                            local cargosdomembro2 = json.decode(ValoresCargos)
                                            if cargosdomembro ~= nil then
                                                for b,c in pairs(cargosdomembro) do
                                                    local nomecargomembro = c
    
                                                    for m,n in pairs(cargosdomembro2) do
                                                        local nomecargoset = n
                                                        
                                                        if nomecargomembro == nomecargoset then
                                                            table.remove(cargosdomembro,b)
                                                        end
                                                    end
                                                end
                                            end
                                            if cargosdomembro2 ~= nil then
                                                for m,n in pairs(cargosdomembro2) do
                                                    local nomedocargo = n
        
                                                    local queryGroups = {}
                                                    queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                                    local dispoGroups = #queryGroups > 0
                                                    if dispoGroups then
                                                        for posicao,tabela in pairs(queryGroups) do
                                                            for k,v in pairs(tabela) do
                                                                if k == 'valores' then
                                                                    local grupos = json.decode(v)
                                                                    if grupos ~= nil then
                                                                        if #grupos.gruposorganizacao > 0 then
                                                                            for m,n in pairs(grupos.gruposorganizacao) do
                                                                                for nomedocargo2,valores in pairs(n) do
                                                                                    local cargoingame = valores.cargoingame[1]

                                                                                    local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                                                    if subStrFind(permissaoCFG,cargoingame) then
                                                                                        if m <= staffposicao then
                                                                                            cancelar = true
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end

                                                    if not cancelar then
                                                        table.insert(tabelacargosnovos,nomedocargo)

                                                        local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                        local vRPGroupsCFG = vRP.Groups()
                                                        if vRPGroupsCFG[grupoCFG] then
                                                            for hIdx,HGrupo in pairs(vRPGroupsCFG[grupoCFG]["Hierarchy"]) do
                                                                if subStrFind(HGrupo,permissaoCFG) then
                                                                    vRP.SetPermission(idmembro2,grupoCFG,hIdx,false)
                                                                end
                                                            end
                                                        end

                                                        SendWebhookMessage(LogMembrosAdicionados,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..idmembro2.." NO GRUPO: "..nomedocargo.."```")
                                                        SendWebhookMessage(LogMembrosAcoesGeral,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..idmembro2.." NO GRUPO: "..nomedocargo.."```")
                                                        enviarLogNoPainelOrgPropia(nomeOrgPropia,"[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..idmembro2.." NO GRUPO: "..nomedocargo.."")
                                                    end
                                                end
    
                                            end
                                            if cargosdomembro ~= nil then
                                                for m,n in pairs(cargosdomembro) do
                                                    table.insert(tabelacargosnovos,n)
                                                end
                                            end

                                            vRP.Query("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelacargosnovos)})
                                            vCLIENT.updateMembrosOrgPropia(source)
                                        end
                                    end
                                else
                                    if vRP.getUserSource(idmembro2) then
                                        local conviteAdicionar = vRP.request(vRP.getUserSource(idmembro2),'Deseja entrar para a organização: '..nomeOrgPropia..'?',30)
                                        if conviteAdicionar then
                                            local tabelacargosnovos = {}
    
                                            local cargosdomembro = json.decode(v.cargos)
                                            local cargosdomembro2 = json.decode(ValoresCargos)
                                            if cargosdomembro ~= nil then
                                                for b,c in pairs(cargosdomembro) do
                                                    local nomecargomembro = c
    
                                                    for m,n in pairs(cargosdomembro2) do
                                                        local nomecargoset = n
                                                        
                                                        if nomecargomembro == nomecargoset then
                                                            table.remove(cargosdomembro,b)
                                                        end
                                                    end
                                                end
                                            end
                                            if cargosdomembro2 ~= nil then
                                                for m,n in pairs(cargosdomembro2) do
                                                    local nomedocargo = n
        
                                                    local queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                                    local dispoGroups = #queryGroups > 0
                                                    if dispoGroups then
                                                        for posicao,tabela in pairs(queryGroups) do
                                                            for k,v in pairs(tabela) do
                                                                if k == 'valores' then
                                                                    local grupos = json.decode(v)
                                                                    if grupos ~= nil then
                                                                        if #grupos.gruposorganizacao > 0 then
                                                                            for m,n in pairs(grupos.gruposorganizacao) do
                                                                                for nomedocargo2,valores in pairs(n) do
                                                                                    local cargoingame = valores.cargoingame[1]
                                                                                    
                                                                                    if nomedocargo == cargoingame then
                                                                                        if m <= staffposicao then
                                                                                            cancelar = true
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
        
                                                    if not cancelar then
                                                        table.insert(tabelacargosnovos,nomedocargo)
                                                        if vRP.getUserSource(idmembro2) then
                                                            if baseatual == 'creativev5' then
                                                                vRP.setPermission(idmembro2,nomedocargo)
                                                            end
                                                            if baseatual == 'creativev4' then
                                                                vRP.setPermission(idmembro2,nomedocargo)
                                                            end
                                                            if baseatual == 'creativev3' then
                                                                vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargo})
                                                            end
                                                            if baseatual == 'creativev2' then
                                                                vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargo})
                                                            end
                                                            if baseatual == 'creativev1' then
                                                                vRP.setPermission(idmembro2,nomedocargo)
                                                            end
                                                            if baseatual == 'vrpex' then
                                                                vRP.addUserGroup(idmembro2,nomedocargo)
                                                            end
        
                                                            SendWebhookMessage(LogMembrosAdicionados,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..idmembro2.." NO GRUPO: "..nomedocargo.."```")
                                                            SendWebhookMessage(LogMembrosAcoesGeral,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..idmembro2.." NO GRUPO: "..nomedocargo.."```")
                                                            enviarLogNoPainelOrgPropia(nomeOrgPropia,"[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..idmembro2.." NO GRUPO: "..nomedocargo.."")
                                                        end
                                                    end
                                                end
    
                                            end
                                            if cargosdomembro ~= nil then
                                                for m,n in pairs(cargosdomembro) do
                                                    table.insert(tabelacargosnovos,n)
                                                end
                                            end
                            
                                            vRP.execute("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelacargosnovos)})
                                            vCLIENT.updateMembrosOrgPropia(source)
                                        end
                                    end
                                end
                            end
                        end
                    end

                    if not membroverificado then
                        if baseatual == 'creativev6' then
                            if vRP.Source(parseInt(iddomembroset)) then
                                local conviteAdicionar = vRP.Request(vRP.Source(parseInt(iddomembroset)),'Deseja entrar para a organização: '..nomeOrgPropia..'?',"Sim","Não")
                                if conviteAdicionar then
                                    local tabelacargosnovos = {}
                                    local cargosdomembro2 = json.decode(ValoresCargos)
                                    if cargosdomembro2 ~= nil then
                                        for m,n in pairs(cargosdomembro2) do
                                            local nomedocargo = n
                
                                            local queryGroups = {}
                                            queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                            local dispoGroups = #queryGroups > 0
                                            if dispoGroups then
                                                for posicao,tabela in pairs(queryGroups) do
                                                    for k,v in pairs(tabela) do
                                                        if k == 'valores' then
                                                            local grupos = json.decode(v)
                                                            if grupos ~= nil then
                                                                if #grupos.gruposorganizacao > 0 then
                                                                    for m,n in pairs(grupos.gruposorganizacao) do
                                                                        for nomedocargo2,valores in pairs(n) do
                                                                            local cargoingame = valores.cargoingame[1]

                                                                            local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                                            if subStrFind(permissaoCFG,cargoingame) then
                                                                                if m <= staffposicao then
                                                                                    cancelar = true
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
    
                                            if not cancelar then
                                                table.insert(tabelacargosnovos,nomedocargo)

                                                local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                local vRPGroupsCFG = vRP.Groups()
                                                if vRPGroupsCFG[grupoCFG] then
                                                    for hIdx,HGrupo in pairs(vRPGroupsCFG[grupoCFG]["Hierarchy"]) do
                                                        if subStrFind(HGrupo,permissaoCFG) then
                                                            vRP.SetPermission(iddomembroset,grupoCFG,hIdx,false)
                                                        end
                                                    end
                                                end

                                                enviarLogNoPainelOrgPropia(nomeOrgPropia,"[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..parseInt(iddomembroset).." NO GRUPO: "..nomedocargo.."")
                                                SendWebhookMessage(LogMembrosAdicionados,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..iddomembroset.." NO GRUPO: "..nomedocargo.."```")
                                                SendWebhookMessage(LogMembrosAcoesGeral,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..iddomembroset.." NO GRUPO: "..nomedocargo.."```")
                                            end
                                        end
                                    end

                                    vRP.Query("skdev_group/insertGrupos",{user_id = parseInt(iddomembroset),cargos = json.encode(tabelacargosnovos)})
                                    vCLIENT.updateMembrosOrgPropia(source)
                                end
                            end
                        else
                            if vRP.getUserSource(parseInt(iddomembroset)) then
                                local conviteAdicionar = vRP.request(vRP.getUserSource(parseInt(iddomembroset)),'Deseja entrar para a organização: '..nomeOrgPropia..'?',30)
                                if conviteAdicionar then
                                    local tabelacargosnovos = {}
                                    local cargosdomembro2 = json.decode(ValoresCargos)
                                    if cargosdomembro2 ~= nil then
                                        for m,n in pairs(cargosdomembro2) do
                                            local nomedocargo = n
                
                                            local queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                            local dispoGroups = #queryGroups > 0
                                            if dispoGroups then
                                                for posicao,tabela in pairs(queryGroups) do
                                                    for k,v in pairs(tabela) do
                                                        if k == 'valores' then
                                                            local grupos = json.decode(v)
                                                            if grupos ~= nil then
                                                                if #grupos.gruposorganizacao > 0 then
                                                                    for m,n in pairs(grupos.gruposorganizacao) do
                                                                        for nomedocargo2,valores in pairs(n) do
                                                                            local cargoingame = valores.cargoingame[1]
    
                                                                            if nomedocargo == cargoingame then
                                                                                if m <= staffposicao then
                                                                                    cancelar = true
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
    
                                            if not cancelar then
                                                table.insert(tabelacargosnovos,nomedocargo)
                                                if vRP.getUserSource(parseInt(iddomembroset)) then
                                                    if baseatual == 'creativev5' then
                                                        vRP.setPermission(parseInt(iddomembroset),nomedocargo)
                                                    end
                                                    if baseatual == 'creativev4' then
                                                        vRP.setPermission(parseInt(iddomembroset),nomedocargo)
                                                    end
                                                    if baseatual == 'creativev3' then
                                                        vRP.execute("vRP/del_group",{user_id = parseInt(iddomembroset), permiss = nomedocargo})
                                                        vRP.execute("vRP/add_group",{user_id = parseInt(iddomembroset), permiss = nomedocargo})
                                                    end
                                                    if baseatual == 'creativev2' then
                                                        vRP.execute("vRP/del_group",{user_id = parseInt(iddomembroset), permiss = nomedocargo})
                                                        vRP.execute("vRP/add_group",{user_id = parseInt(iddomembroset), permiss = nomedocargo})
                                                    end
                                                    if baseatual == 'creativev1' then
                                                        vRP.setPermission(parseInt(iddomembroset),nomedocargo)
                                                    end
                                                    if baseatual == 'vrpex' then
                                                        vRP.addUserGroup(parseInt(iddomembroset),nomedocargo)
                                                    end
        
                                                    enviarLogNoPainelOrgPropia(nomeOrgPropia,"[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..parseInt(iddomembroset).." NO GRUPO: "..nomedocargo.."")
                                                    SendWebhookMessage(LogMembrosAdicionados,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..iddomembroset.." NO GRUPO: "..nomedocargo.."```")
                                                    SendWebhookMessage(LogMembrosAcoesGeral,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..iddomembroset.." NO GRUPO: "..nomedocargo.."```")
                                                end
                                            end
                                        end
                                    end
                            
                                    vRP.execute("skdev_group/insertGrupos",{user_id = parseInt(iddomembroset),cargos = json.encode(tabelacargosnovos)})
                                    vCLIENT.updateMembrosOrgPropia(source)
                                end
                            end
                        end
                    end
                else
                    if baseatual == 'creativev6' then
                        if vRP.Source(parseInt(iddomembroset)) then
                            local conviteAdicionar = vRP.Request(vRP.Source(parseInt(iddomembroset)),'Deseja entrar para a organização: '..nomeOrgPropia..'?',"Sim","Não")
                            if conviteAdicionar then
                                local tabelacargosnovos = {}
                                local cargosdomembro2 = json.decode(ValoresCargos)
                                if cargosdomembro2 ~= nil then
                                    for m,n in pairs(cargosdomembro2) do
                                        local nomedocargo = n
            
                                        local queryGroups = {}
                                        queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                        local dispoGroups = #queryGroups > 0
                                        if dispoGroups then
                                            for posicao,tabela in pairs(queryGroups) do
                                                for k,v in pairs(tabela) do
                                                    if k == 'valores' then
                                                        local grupos = json.decode(v)
                                                        if grupos ~= nil then
                                                            if #grupos.gruposorganizacao > 0 then
                                                                for m,n in pairs(grupos.gruposorganizacao) do
                                                                    for nomedocargo2,valores in pairs(n) do
                                                                        local cargoingame = valores.cargoingame[1]

                                                                        local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                        if subStrFind(permissaoCFG,cargoingame) then
                                                                            if m <= staffposicao then
                                                                                cancelar = true
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
            
                                        if not cancelar then
                                            table.insert(tabelacargosnovos,nomedocargo)
                                            local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                            local vRPGroupsCFG = vRP.Groups()
                                            if vRPGroupsCFG[grupoCFG] then
                                                for hIdx,HGrupo in pairs(vRPGroupsCFG[grupoCFG]["Hierarchy"]) do
                                                    if subStrFind(HGrupo,permissaoCFG) then
                                                        vRP.SetPermission(iddomembroset,grupoCFG,hIdx,false)
                                                    end
                                                end
                                            end

                                            enviarLogNoPainelOrgPropia(nomeOrgPropia,"[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..parseInt(iddomembroset).." NO GRUPO: "..nomedocargo.."")
                                            SendWebhookMessage(LogMembrosAdicionados,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..parseInt(iddomembroset).." NO GRUPO: "..nomedocargo.."```")
                                            SendWebhookMessage(LogMembrosAcoesGeral,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..parseInt(iddomembroset).." NO GRUPO: "..nomedocargo.."```")
                                        end
                                    end
                                end
                        
                                vRP.execute("skdev_group/insertGrupos",{user_id = parseInt(iddomembroset),cargos = json.encode(tabelacargosnovos)})
                                vCLIENT.updateMembrosOrgPropia(source)
                            end
                        end
                    else
                        if vRP.getUserSource(parseInt(iddomembroset)) then
                            local conviteAdicionar = vRP.request(vRP.getUserSource(parseInt(iddomembroset)),'Deseja entrar para a organização: '..nomeOrgPropia..'?',30)
                            if conviteAdicionar then
                                local tabelacargosnovos = {}
                                local cargosdomembro2 = json.decode(ValoresCargos)
                                if cargosdomembro2 ~= nil then
                                    for m,n in pairs(cargosdomembro2) do
                                        local nomedocargo = n
            
                                        local queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                        local dispoGroups = #queryGroups > 0
                                        if dispoGroups then
                                            for posicao,tabela in pairs(queryGroups) do
                                                for k,v in pairs(tabela) do
                                                    if k == 'valores' then
                                                        local grupos = json.decode(v)
                                                        if grupos ~= nil then
                                                            if #grupos.gruposorganizacao > 0 then
                                                                for m,n in pairs(grupos.gruposorganizacao) do
                                                                    for nomedocargo2,valores in pairs(n) do
                                                                        local cargoingame = valores.cargoingame[1]
                        
                                                                        if nomedocargo == cargoingame then
                                                                            if m <= staffposicao then
                                                                                cancelar = true
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
            
                                        if not cancelar then
                                            table.insert(tabelacargosnovos,nomedocargo)
                                            if vRP.getUserSource(parseInt(iddomembroset)) then
                                                if baseatual == 'creativev5' then
                                                    vRP.setPermission(parseInt(iddomembroset),nomedocargo)
                                                end
                                                if baseatual == 'creativev4' then
                                                    vRP.setPermission(parseInt(iddomembroset),nomedocargo)
                                                end
                                                if baseatual == 'creativev3' then
                                                    vRP.execute("vRP/del_group",{user_id = parseInt(iddomembroset), permiss = nomedocargo})
                                                    vRP.execute("vRP/add_group",{user_id = parseInt(iddomembroset), permiss = nomedocargo})
                                                end
                                                if baseatual == 'creativev2' then
                                                    vRP.execute("vRP/del_group",{user_id = parseInt(iddomembroset), permiss = nomedocargo})
                                                    vRP.execute("vRP/add_group",{user_id = parseInt(iddomembroset), permiss = nomedocargo})
                                                end
                                                if baseatual == 'creativev1' then
                                                    vRP.setPermission(parseInt(iddomembroset),nomedocargo)
                                                end
                                                if baseatual == 'vrpex' then
                                                    vRP.addUserGroup(parseInt(iddomembroset),nomedocargo)
                                                end
        
                                                enviarLogNoPainelOrgPropia(nomeOrgPropia,"[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..parseInt(iddomembroset).." NO GRUPO: "..nomedocargo.."")
                                                SendWebhookMessage(LogMembrosAdicionados,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..parseInt(iddomembroset).." NO GRUPO: "..nomedocargo.."```")
                                                SendWebhookMessage(LogMembrosAcoesGeral,"```prolog\nNovo Membro Adicionado!!!\n\n[ID]: "..user_id.." ADICIONOU O USUARIO DE ID: "..parseInt(iddomembroset).." NO GRUPO: "..nomedocargo.."```")
                                            end
                                        end
                                    end
                                end
                        
                                vRP.execute("skdev_group/insertGrupos",{user_id = parseInt(iddomembroset),cargos = json.encode(tabelacargosnovos)})
                                vCLIENT.updateMembrosOrgPropia(source)
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.uparMembroOrgPropia(nomedaorg,iddomembroset)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local staffposicao = 0

    local cancelposicao = false

    if user_id ~= parseInt(iddomembroset) then
        if skdevs.verificarPermissoesOrgPropia(user_id,'Upar Membros',nomedaorg) then
            if not skdevs.verificarPermissoesOrgPropia(parseInt(iddomembroset),'Membros Protegidos',nomedaorg) then
                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
                if #queryPermiss > 0 then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembroset)
                        
                        if idmembro == user_id then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c
                
                                    local queryGroups = {}
                                    if baseatual == 'creativev6' then
                                        queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                    else
                                        queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                    end
                                    local dispoGroups = #queryGroups > 0
                                    if dispoGroups then
                                        for posicao,tabela in pairs(queryGroups) do
                                            for k,v in pairs(tabela) do
                                                if k == 'valores' then
                                                    local grupos = json.decode(v)
                                                    if grupos ~= nil then
                                                        if #grupos.gruposorganizacao > 0 then
                                                            for m,n in pairs(grupos.gruposorganizacao) do
                                                                for nomedocargo2,valores in pairs(n) do
                                                                    local cargoingame = valores.cargoingame[1]

                                                                    if baseatual == 'creativev6' then
                                                                        local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                                        if subStrFind(permissaoCFG,cargoingame) then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if not valores.cargoinvisivelstatus then
                                                                                    if not cancelposicao then
                                                                                        staffposicao = m
                                                                                        
                                                                                        cancelposicao = true
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        if nomedocargo == cargoingame then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if not valores.cargoinvisivelstatus then
                                                                                    if not cancelposicao then
                                                                                        staffposicao = m
                                                                                        
                                                                                        cancelposicao = true
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        if idmembro == idmembro2 then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c

                                    local queryGroups = {}
                                    if baseatual == 'creativev6' then
                                        queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                    else
                                        queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                    end
                                    local dispoGroups = #queryGroups > 0
                                    if dispoGroups then
                                        for posicao,tabela in pairs(queryGroups) do
                                            for k,v in pairs(tabela) do
                                                if k == 'valores' then
                                                    local grupos = json.decode(v)
                                                    if grupos ~= nil then
                                                        if #grupos.gruposorganizacao > 0 then
                                                            for m,n in pairs(grupos.gruposorganizacao) do
                                                                for nomedocargo2,valores in pairs(n) do
                                                                    local cargoingame = valores.cargoingame[1]

                                                                    if baseatual == 'creativev6' then
                                                                        local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                                        if subStrFind(permissaoCFG,cargoingame) then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if not valores.cargoinvisivelstatus then
                                                                                    local upar = m - 1 ~= 0
                                                                                    
                                                                                    if upar then
                                                                                        if m-1 > staffposicao then
                                                                                            for o,p in pairs(grupos.gruposorganizacao[m-1]) do
                                                                                                local nomedocargosupar = p.cargoingame[1]
                                    
                                                                                                local tabelaNova = {}
                                    
                                                                                                table.remove(cargosMembro,b)
                                                                                                for index,cargo in pairs(cargosMembro) do
                                                                                                    table.insert(tabelaNova,cargo)
                                                                                                end
                                                                                                table.insert(tabelaNova,nomedocargosupar.."-"..tabela.grupo)

                                                                                                vRP.Query("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelaNova)})

                                                                                                local vRPGroupsCFG = vRP.Groups()
                                                                                                if vRPGroupsCFG[nomedaorg] then
                                                                                                    for hIdx,HGrupo in pairs(vRPGroupsCFG[nomedaorg]["Hierarchy"]) do
                                                                                                        if subStrFind(HGrupo,nomedocargosupar) then
                                                                                                            vRP.SetPermission(idmembro2,nomedaorg,hIdx,false)
                                                                                                        end
                                                                                                    end
                                                                                                end

                                                                                                SendWebhookMessage(grupos.logmembrosupados,"```prolog\nNovo Membro Upado!!!\n\n[ID]: "..user_id.." UPOU O USUARIO DE ID: "..idmembro2.."```")
                                                                                                SendWebhookMessage(grupos.loggeral,"```prolog\nNovo Membro Upado!!!\n\n[ID]: "..user_id.." UPOU O USUARIO DE ID: "..idmembro2.."```")
                                                                                                enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." UPOU O USUARIO DE ID: "..idmembro2.." ")
                                                                                                vCLIENT.updateMembrosOrgPropia(source)
                                                                                                break
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        if nomedocargo == cargoingame then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if not valores.cargoinvisivelstatus then
                                                                                    local upar = m - 1 ~= 0
                                                                                    
                                                                                    if upar then
                                                                                        if m-1 > staffposicao then
                                                                                            for o,p in pairs(grupos.gruposorganizacao[m-1]) do
                                                                                                local nomedocargosupar = p.cargoingame[1]
                                    
                                                                                                local tabelaNova = {}
                                    
                                                                                                table.remove(cargosMembro,b)
                                                                                                for index,cargo in pairs(cargosMembro) do
                                                                                                    table.insert(tabelaNova,cargo)
                                                                                                end
                                                                                                table.insert(tabelaNova,nomedocargosupar)

                                                                                                vRP.execute("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelaNova)})

                                                                                                if baseatual == 'creativev5' then
                                                                                                    vRP.setPermission(idmembro2,nomedocargosupar)
                                                                                                end
                                                                                                if baseatual == 'creativev4' then
                                                                                                    vRP.setPermission(idmembro2,nomedocargosupar)
                                                                                                end
                                                                                                if baseatual == 'creativev3' then
                                                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargosupar})
                                                                                                    vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargosupar})
                                                                                                end
                                                                                                if baseatual == 'creativev2' then
                                                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargosupar})
                                                                                                    vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargosupar})
                                                                                                end
                                                                                                if baseatual == 'creativev1' then
                                                                                                    vRP.setPermission(idmembro2,nomedocargosupar)
                                                                                                end
                
                                                                                                if baseatual == 'creativev6' then
                                                                                                    vRP.RemovePermission(idmembro2,nomedaorg)
                                                                                                end
                                                                                                if baseatual == 'creativev5' then
                                                                                                    vRP.remPermission(idmembro2,nomedocargo)
                                                                                                end
                                                                                                if baseatual == 'creativev5' then
                                                                                                    vRP.remPermission(idmembro2,nomedocargo)
                                                                                                end
                                                                                                if baseatual == 'creativev4' then
                                                                                                    vRP.remPermission(idmembro2,nomedocargo)
                                                                                                end
                                                                                                if baseatual == 'creativev3' then
                                                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                                                end
                                                                                                if baseatual == 'creativev2' then
                                                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                                                end
                                                                                                if baseatual == 'creativev1' then
                                                                                                    vRP.remPermission(idmembro2,nomedocargo)
                                                                                                end
                
                                                                                                if vRP.getUserSource(idmembro2) then
                                                                                                    if baseatual == 'vrpex' then
                                                                                                        vRP.addUserGroup(idmembro2,nomedocargosupar)
                
                                                                                                        local grupos = vRP.getUserGroups(idmembro2)
                                                                                                        for nomedocargopossuido,status in pairs(grupos) do
                                                                                                            if nomedocargopossuido == nomedocargo then
                                                                                                                vRP.removeUserGroup(idmembro2,nomedocargo)
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                else
                                                                                                    if baseatual == 'vrpex' then
                                                                                                        local queryUserData = vRP.query("skdev_group/obterUserData")
                                                                                                        if #queryUserData > 0 then
                                                                                                            for k,v in pairs(queryUserData) do
                                                                                                                if v.dkey == 'vRP:datatable' then
                                                                                                                    local idusuario = v.user_id
                                                        
                                                                                                                    if idusuario == idmembro2 then
                                                                                                                        local dvalue = json.decode(v.dvalue)
                                                                                                                        local gruposplayer = dvalue.groups
                                                        
                                                                                                                        local tabelaNovaUserData = {}
                                                        
                                                                                                                        for cargo,_ in pairs(gruposplayer) do
                                                                                                                            if cargo ~= nomedocargo then
                                                                                                                                tabelaNovaUserData[cargo] = true
                                                                                                                            end
                                                                                                                        end
                                                                                                                        
                                                                                                                        tabelaNovaUserData[nomedocargosupar] = true
                                                                                                                        dvalue.groups = tabelaNovaUserData
                                                                                                                        vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                        
                                                        
                                                                                                                        break
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                
                                                                                                SendWebhookMessage(grupos.logmembrosupados,"```prolog\nNovo Membro Upado!!!\n\n[ID]: "..user_id.." UPOU O USUARIO DE ID: "..idmembro2.."```")
                                                                                                SendWebhookMessage(grupos.loggeral,"```prolog\nNovo Membro Upado!!!\n\n[ID]: "..user_id.." UPOU O USUARIO DE ID: "..idmembro2.."```")
                                                                                                enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." UPOU O USUARIO DE ID: "..idmembro2.." ")
                                                                                                vCLIENT.updateMembrosOrgPropia(source)
                                                                                                break
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.rebaixarMembroOrgPropia(nomedaorg,iddomembroset)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local minhaposicao = 0

    local cancelposicao = false

    if user_id ~= parseInt(iddomembroset) then
        if skdevs.verificarPermissoesOrgPropia(user_id,'Rebaixar Membros',nomedaorg) then
            if not skdevs.verificarPermissoesOrgPropia(parseInt(iddomembroset),'Membros Protegidos',nomedaorg) then
                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
                if #queryPermiss > 0 then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembroset)
    
                        if idmembro == user_id then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c
                
                                    local queryGroups = {}
                                    if baseatual == 'creativev6' then
                                        queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                    else
                                        queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                    end
                                    local dispoGroups = #queryGroups > 0
                                    if dispoGroups then
                                        for posicao,tabela in pairs(queryGroups) do
                                            for k,v in pairs(tabela) do
                                                if k == 'valores' then
                                                    local grupos = json.decode(v)
                                                    if grupos ~= nil then
                                                        if #grupos.gruposorganizacao > 0 then
                                                            for m,n in pairs(grupos.gruposorganizacao) do
                                                                for nomedocargo2,valores in pairs(n) do
                                                                    local cargoingame = valores.cargoingame[1]

                                                                    if baseatual == 'creativev6' then
                                                                        local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                                        if subStrFind(permissaoCFG,cargoingame) then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if not valores.cargoinvisivelstatus then
                                                                                    if not cancelposicao then
                                                                                        minhaposicao = m
                                                                                        cancelposicao = true
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        if nomedocargo == cargoingame then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if not valores.cargoinvisivelstatus then
                                                                                    if not cancelposicao then
                                                                                        minhaposicao = m
                                                                                        cancelposicao = true
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
    
                        if idmembro == idmembro2 then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c

                                    local queryGroups = {}
                                    if baseatual == 'creativev6' then
                                        queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                    else
                                        queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                    end
                                    local dispoGroups = #queryGroups > 0
                                    if dispoGroups then
                                        for posicao,tabela in pairs(queryGroups) do
                                            for k,v in pairs(tabela) do
                                                if k == 'valores' then
                                                    local grupos = json.decode(v)
                                                    if grupos ~= nil then
                                                        if #grupos.gruposorganizacao > 0 then
                                                            for m,n in pairs(grupos.gruposorganizacao) do
                                                                for nomedocargo2,valores in pairs(n) do
                                                                    local cargoingame = valores.cargoingame[1]

                                                                    if baseatual == 'creativev6' then
                                                                        local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                                        if subStrFind(permissaoCFG,cargoingame) then
                                                                            if tabela.grupo == nomedaorg then
                                                                                local rebaixar = m + 1 <= #grupos.gruposorganizacao
                            
                                                                                if rebaixar then
                                                                                    if minhaposicao+1 < m+1 then
                                                                                        for o,p in pairs(grupos.gruposorganizacao[m+1]) do
                                                                                            if not p.cargoinvisivelstatus then
                                                                                                local nomedocargorebaixar = p.cargoingame[1]
                        
                                                                                                local tabelaNova = {}
                        
                                                                                                table.remove(cargosMembro,b)
                                                                                                for index,cargo in pairs(cargosMembro) do
                                                                                                    table.insert(tabelaNova,cargo)
                                                                                                end
                                                                                                table.insert(tabelaNova,nomedocargorebaixar.."-"..tabela.grupo)
                        
                                                                                                vRP.Query("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelaNova)})
                
                                                                                                local vRPGroupsCFG = vRP.Groups()
                                                                                                if vRPGroupsCFG[nomedaorg] then
                                                                                                    for hIdx,HGrupo in pairs(vRPGroupsCFG[nomedaorg]["Hierarchy"]) do
                                                                                                        if subStrFind(HGrupo,nomedocargorebaixar) then
                                                                                                            vRP.SetPermission(idmembro2,nomedaorg,hIdx,false)
                                                                                                        end
                                                                                                    end
                                                                                                end
                            
                                                                                                SendWebhookMessage(grupos.logmembrosrebaixados,"```prolog\nNovo Membro Rebaixado!!!\n\n[ID]: "..user_id.." REBAIXOU O USUARIO DE ID: "..idmembro2.."```")
                                                                                                SendWebhookMessage(grupos.loggeral,"```prolog\nNovo Membro Rebaixado!!!\n\n[ID]: "..user_id.." REBAIXOU O USUARIO DE ID: "..idmembro2.."```")
                                                                                                enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." REBAIXOU O USUARIO DE ID: "..idmembro2.." ")
                                                                                                vCLIENT.updateMembrosOrgPropia(source)
                                                                                                break
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        if nomedocargo == cargoingame then
                                                                            if tabela.grupo == nomedaorg then
                                                                                local rebaixar = m + 1 <= #grupos.gruposorganizacao
                            
                                                                                if rebaixar then
                                                                                    if minhaposicao+1 < m+1 then
                                                                                        for o,p in pairs(grupos.gruposorganizacao[m+1]) do
                                                                                            if not p.cargoinvisivelstatus then
                                                                                                local nomedocargorebaixar = p.cargoingame[1]
                        
                                                                                                local tabelaNova = {}
                        
                                                                                                table.remove(cargosMembro,b)
                                                                                                for index,cargo in pairs(cargosMembro) do
                                                                                                    table.insert(tabelaNova,cargo)
                                                                                                end
                                                                                                table.insert(tabelaNova,nomedocargorebaixar)
                        
                                                                                                vRP.execute("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(tabelaNova)})
                
                                                                                                if baseatual == 'creativev5' then
                                                                                                    vRP.setPermission(idmembro2,nomedocargorebaixar)
                                                                                                end
                                                                                                if baseatual == 'creativev4' then
                                                                                                    vRP.setPermission(idmembro2,nomedocargorebaixar)
                                                                                                end
                                                                                                if baseatual == 'creativev3' then
                                                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargorebaixar})
                                                                                                    vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargorebaixar})
                                                                                                end
                                                                                                if baseatual == 'creativev2' then
                                                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargorebaixar})
                                                                                                    vRP.execute("vRP/add_group",{user_id = idmembro2, permiss = nomedocargorebaixar})
                                                                                                end
                                                                                                if baseatual == 'creativev1' then
                                                                                                    vRP.setPermission(idmembro2,nomedocargorebaixar)
                                                                                                end
                
                                                                                                if baseatual == 'creativev5' then
                                                                                                    vRP.remPermission(idmembro2,nomedocargo)
                                                                                                end
                                                                                                if baseatual == 'creativev4' then
                                                                                                    vRP.remPermission(idmembro2,nomedocargo)
                                                                                                end
                                                                                                if baseatual == 'creativev3' then
                                                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                                                end
                                                                                                if baseatual == 'creativev2' then
                                                                                                    vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                                                end
                                                                                                if baseatual == 'creativev1' then
                                                                                                    vRP.remPermission(idmembro2,nomedocargo)
                                                                                                end
                
                                                                                                if vRP.getUserSource(idmembro2) then
                                                                                                    if baseatual == 'vrpex' then
                                                                                                        vRP.addUserGroup(idmembro2,nomedocargorebaixar)
                
                                                                                                        local grupos = vRP.getUserGroups(idmembro2)
                                                                                                        for nomedocargopossuido,status in pairs(grupos) do
                                                                                                            if nomedocargopossuido == nomedocargo then
                                                                                                                vRP.removeUserGroup(idmembro2,nomedocargo)
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                else
                                                                                                    if baseatual == 'vrpex' then
                                                                                                        local queryUserData = vRP.query("skdev_group/obterUserData")
                                                                                                        if #queryUserData > 0 then
                                                                                                            for k,v in pairs(queryUserData) do
                                                                                                                if v.dkey == 'vRP:datatable' then
                                                                                                                    local idusuario = v.user_id
                                                        
                                                                                                                    if idusuario == idmembro2 then
                                                                                                                        local dvalue = json.decode(v.dvalue)
                                                                                                                        local gruposplayer = dvalue.groups
                                                        
                                                                                                                        local tabelaNovaUserData = {}
                                                        
                                                                                                                        for cargo,_ in pairs(gruposplayer) do
                                                                                                                            if cargo ~= nomedocargo then
                                                                                                                                tabelaNovaUserData[cargo] = true
                                                                                                                            end
                                                                                                                        end
                                                                                                                        
                                                                                                                        tabelaNovaUserData[nomedocargorebaixar] = true
                                                                                                                        dvalue.groups = tabelaNovaUserData
                                                                                                                        vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                        
                                                        
                                                                                                                        break
                                                                                                                    end
                                                                                                                end
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                            
                                                                                                SendWebhookMessage(grupos.logmembrosrebaixados,"```prolog\nNovo Membro Rebaixado!!!\n\n[ID]: "..user_id.." REBAIXOU O USUARIO DE ID: "..idmembro2.."```")
                                                                                                SendWebhookMessage(grupos.loggeral,"```prolog\nNovo Membro Rebaixado!!!\n\n[ID]: "..user_id.." REBAIXOU O USUARIO DE ID: "..idmembro2.."```")
                                                                                                enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." REBAIXOU O USUARIO DE ID: "..idmembro2.." ")
                                                                                                vCLIENT.updateMembrosOrgPropia(source)
                                                                                                break
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function adicionarBlacklistUsuarioOrganizacaoPropia(iddocidadao,horasblacklist)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local horasamais = parseInt(horasblacklist)
    local data_atual = os.time()
    local data_futura = data_atual + (horasamais * 3600)
    local formato_data = os.date("%X %d/%m/%Y", data_futura)

    local existe = false
    local queryBlacklist = {}
    if baseatual == 'creativev6' then
        queryBlacklist = vRP.query("skdev_group/blacklistall")
    else
        queryBlacklist = vRP.query("skdev_group/blacklistall")
    end
    local dispoBlacklist = #queryBlacklist > 0
    if dispoBlacklist then
        for posicao,tabela in pairs(queryBlacklist) do
            local idusuarios = parseInt(tabela.user_id)
            local idusuario = parseInt(iddocidadao)

            if idusuario == idusuarios then
                existe = true
            end
        end

        if not existe then
            if baseatual == 'creativev6' then
                vRP.Query("skdev_group/insertblacklist",{user_id = iddocidadao, valor = formato_data})
            else
                vRP.execute("skdev_group/insertblacklist",{user_id = iddocidadao, valor = formato_data})
            end
        else
            if baseatual == 'creativev6' then
                vRP.Query("skdev_group/updateblacklist",{user_id = iddocidadao, valor = formato_data})
            else
                vRP.execute("skdev_group/updateblacklist",{user_id = iddocidadao, valor = formato_data})
            end
        end
    else
        if baseatual == 'creativev6' then
            vRP.Query("skdev_group/insertblacklist",{user_id = iddocidadao, valor = formato_data})
        else
            vRP.execute("skdev_group/insertblacklist",{user_id = iddocidadao, valor = formato_data})
        end
    end
end

function skdevs.removerMembroOrgPropia(nomedaorg,iddomembroset)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end
    local minhaposicao = 0
    local cargosNovosMembro = {}

    local cancelposicao = false

    if user_id ~= parseInt(iddomembroset) then
        if skdevs.verificarPermissoesOrgPropia(user_id,'Remover Membros',nomedaorg) then
            if not skdevs.verificarPermissoesOrgPropia(parseInt(iddomembroset),'Membros Protegidos',nomedaorg) then
                local queryPermiss = {}
                if baseatual == 'creativev6' then
                    queryPermiss = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
                else
                    queryPermiss = vRP.query("skdev_group/organizacoesMembrosPermissoes")
                end
                if #queryPermiss > 0 then
                    for k,v in pairs(queryPermiss) do
                        local idmembro = parseInt(v.user_id)
                        local idmembro2 = parseInt(iddomembroset)
    
                        if idmembro == user_id then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c
                
                                    local queryGroups = {}
                                    if baseatual == 'creativev6' then
                                        queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                    else
                                        queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                    end
                                    local dispoGroups = #queryGroups > 0
                                    if dispoGroups then
                                        for posicao,tabela in pairs(queryGroups) do
                                            for k,v in pairs(tabela) do
                                                if k == 'valores' then
                                                    local grupos = json.decode(v)
                                                    if grupos ~= nil then
                                                        if #grupos.gruposorganizacao > 0 then
                                                            for m,n in pairs(grupos.gruposorganizacao) do
                                                                for nomedocargo2,valores in pairs(n) do
                                                                    local cargoingame = valores.cargoingame[1]

                                                                    if baseatual == 'creativev6' then
                                                                        local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                                        if subStrFind(permissaoCFG,cargoingame) then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if not valores.cargoinvisivelstatus then
                                                                                    if not cancelposicao then
                                                                                        minhaposicao = m
                                                                                        cancelposicao = true
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        if nomedocargo == cargoingame then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if not valores.cargoinvisivelstatus then
                                                                                    if not cancelposicao then
                                                                                        minhaposicao = m
                                                                                        cancelposicao = true
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end

                        if idmembro == idmembro2 then
                            local cargosMembro = json.decode(v.cargos)
                            if cargosMembro ~= nil then
                                for b,c in pairs(cargosMembro) do
                                    local nomedocargo = c
                                    local cargoDiferente = false
    
                                    local queryGroups = {}
                                    if baseatual == 'creativev6' then
                                        queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                    else
                                        queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                    end
                                    local dispoGroups = #queryGroups > 0
                                    if dispoGroups then
                                        for posicao,tabela in pairs(queryGroups) do
                                            for k,v in pairs(tabela) do
                                                if k == 'valores' then
                                                    local grupos = json.decode(v)
                                                    if grupos ~= nil then
                                                        if #grupos.gruposorganizacao > 0 then
                                                            for m,n in pairs(grupos.gruposorganizacao) do
                                                                for nomedocargo2,valores in pairs(n) do
                                                                    local cargoingame = valores.cargoingame[1]

                                                                    if baseatual == 'creativev6' then
                                                                        local permissaoCFG, grupoCFG = string.match(nomedocargo, "([^%-]+)%-(.+)")
                                                                        if subStrFind(permissaoCFG,cargoingame) then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if m > minhaposicao then
                                                                                    cargoDiferente = true
                
                                                                                    vRP.RemovePermission(idmembro2,nomedaorg)
                            
                                                                                    if grupos.blackliststatus then
                                                                                        adicionarBlacklistUsuarioOrganizacaoPropia(idmembro2,parseInt(grupos.horasdablacklistorg))
                                                                                    end
                
                                                                                    SendWebhookMessage(grupos.logmembrosexpulsos,"```prolog\nNovo Membro Removido!!!\n\n[ID]: "..user_id.." REMOVEU O USUARIO DE ID: "..idmembro2.."```")
                                                                                    SendWebhookMessage(grupos.loggeral,"```prolog\nNovo Membro Removido!!!\n\n[ID]: "..user_id.." REMOVEU O USUARIO DE ID: "..idmembro2.."```")
                                                                                    enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." REMOVEU O USUARIO DE ID: "..idmembro2.." ")
                                                                                    vCLIENT.updateMembrosOrgPropia(source)
                                                                                    break
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        if nomedocargo == cargoingame then
                                                                            if tabela.grupo == nomedaorg then
                                                                                if m > minhaposicao then
                                                                                    cargoDiferente = true

                                                                                    if baseatual == 'creativev5' then
                                                                                        vRP.remPermission(idmembro2,nomedocargo)
                                                                                    end
                                                                                    if baseatual == 'creativev4' then
                                                                                        vRP.remPermission(idmembro2,nomedocargo)
                                                                                    end
                                                                                    if baseatual == 'creativev3' then
                                                                                        vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                                    end
                                                                                    if baseatual == 'creativev2' then
                                                                                        vRP.execute("vRP/del_group",{user_id = idmembro2, permiss = nomedocargo})
                                                                                    end
                                                                                    if baseatual == 'creativev1' then
                                                                                        vRP.remPermission(idmembro2,nomedocargo)
                                                                                    end
                
                                                                                    if baseatual ~= 'creativev6' then
                                                                                        if vRP.getUserSource(idmembro2) then
                                                                                            if baseatual == 'vrpex' then
                                                                                                local grupos2 = vRP.getUserGroups(idmembro2)
                                                                                                for nomedocargopossuido,status in pairs(grupos2) do
                                                                                                    if nomedocargopossuido == nomedocargo then
                                                                                                        vRP.removeUserGroup(idmembro2,nomedocargo)
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        else
                                                                                            if baseatual == 'vrpex' then
                                                                                                local queryUserData = vRP.query("skdev_group/obterUserData")
                                                                                                if #queryUserData > 0 then
                                                                                                    for k,v in pairs(queryUserData) do
                                                                                                        if v.dkey == 'vRP:datatable' then
                                                                                                            local idusuario = v.user_id
                                                
                                                                                                            if idusuario == idmembro2 then
                                                                                                                local dvalue = json.decode(v.dvalue)
                                                                                                                local gruposplayer = dvalue.groups
                                                
                                                                                                                local tabelaNovaUserData = {}
                                                
                                                                                                                for cargo,_ in pairs(gruposplayer) do
                                                                                                                    if cargo ~= nomedocargo then
                                                                                                                        tabelaNovaUserData[cargo] = true
                                                                                                                    end
                                                                                                                end
                                    
                                                                                                                dvalue.groups = tabelaNovaUserData
                                                                                                                vRP.execute("skdev_group/updateUserData",{user_id = idmembro2, dvalue = json.encode(dvalue)})
                                                                                                                break
                                                                                                            end
                                                                                                        end
                                                                                                    end
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                            
                                                                                    if grupos.blackliststatus then
                                                                                        adicionarBlacklistUsuarioOrganizacaoPropia(idmembro2,parseInt(grupos.horasdablacklistorg))
                                                                                    end
                
                                                                                    SendWebhookMessage(grupos.logmembrosexpulsos,"```prolog\nNovo Membro Removido!!!\n\n[ID]: "..user_id.." REMOVEU O USUARIO DE ID: "..idmembro2.."```")
                                                                                    SendWebhookMessage(grupos.loggeral,"```prolog\nNovo Membro Removido!!!\n\n[ID]: "..user_id.." REMOVEU O USUARIO DE ID: "..idmembro2.."```")
                                                                                    enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." REMOVEU O USUARIO DE ID: "..idmembro2.." ")
                                                                                    vCLIENT.updateMembrosOrgPropia(source)
                                                                                    break
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
    
                                        if not cargoDiferente then
                                            table.insert(cargosNovosMembro, nomedocargo)
                                        end
                                    end
                                end
                            end

                            if baseatual == 'creativev6' then
                                vRP.Query("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(cargosNovosMembro)})
                            else
                                vRP.execute("skdev_group/updateGrupos",{user_id = idmembro2, cargos = json.encode(cargosNovosMembro)})
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.VerificarInformacoesLogsPlayerLocal()
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local organizacao = {}
    local queryPerms = {}
    if baseatual == 'creativev6' then
        queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local dispoPerms = #queryPerms > 0
    if dispoPerms then
        for posicao,tabela in pairs(queryPerms) do
            local idusuarios = parseInt(tabela.user_id)
            local idusuario = parseInt(user_id)
            local cargos = json.decode(tabela.cargos)

            if idusuarios == idusuario then
                if cargos ~= nil then
                    if #cargos > 0 then
                        for posicao,nomedocargo in pairs(cargos) do
                            local nomedocargoset = nomedocargo

                            local queryGroups = {}
                            if baseatual == 'creativev6' then
                                queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                            else
                                queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                            end
                            local dispoGroups = #queryGroups > 0
                            if dispoGroups then
                                for posicao,tabela in pairs(queryGroups) do
                                    for k,v in pairs(tabela) do
                                        if k == 'valores' then
                                            local grupos = json.decode(v)
                                            if grupos ~= nil then
                                                if #grupos.gruposorganizacao > 0 then
                                                    for b,c in pairs(grupos.gruposorganizacao) do
                                                        for nomedocargo,valores in pairs(c) do
                                                            local cargoingame = valores.cargoingame[1]

                                                            if baseatual == 'creativev6' then
                                                                local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                if subStrFind(permissaoCFG,cargoingame) then
                                                                    return grupos.logedicaodaorganizacao,grupos.logalteracaodelog,grupos.logmembrosupados,grupos.logmembrosrebaixados,grupos.logmembrosexpulsos,grupos.logmembrosadicionados
                                                                end
                                                            else
                                                                if nomedocargoset == cargoingame then
                                                                    return grupos.logedicaodaorganizacao,grupos.logalteracaodelog,grupos.logmembrosupados,grupos.logmembrosrebaixados,grupos.logmembrosexpulsos,grupos.logmembrosadicionados
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.logsAlteradasOrgPropia(logedicaodaorganizacao,logalteracaodelog,logmembrosupados,logmembrosrebaixados,logmembrosexpulsos,logmembrosadicionados)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    if skdevs.verificarPermissoesOrgPropia(user_id,'Alterar Logs') then
        local organizacao = {}
        local queryPerms = {}
        if baseatual == 'creativev6' then
            queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
        else
            queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
        end
        local dispoPerms = #queryPerms > 0
        if dispoPerms then
            for posicao,tabela in pairs(queryPerms) do
                local idusuarios = parseInt(tabela.user_id)
                local idusuario = parseInt(user_id)
                local cargos = json.decode(tabela.cargos)

                if idusuarios == idusuario then   
                    if cargos ~= nil then
                        if #cargos > 0 then
                            for posicao,nomedocargo in pairs(cargos) do
                                local nomedocargoset = nomedocargo

                                local queryGroups = {}
                                if baseatual == 'creativev6' then
                                    queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                                else
                                    queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                                end
                                local dispoGroups = #queryGroups > 0
                                if dispoGroups then
                                    for posicao,tabela in pairs(queryGroups) do
                                        for k,v in pairs(tabela) do
                                            if k == 'valores' then
                                                local grupos = json.decode(v)
                                                if grupos ~= nil then
                                                    if #grupos.gruposorganizacao > 0 then
                                                        for b,c in pairs(grupos.gruposorganizacao) do
                                                            for nomedocargo,valores in pairs(c) do
                                                                local cargoingame = valores.cargoingame[1]

                                                                if baseatual == 'creativev6' then
                                                                    local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                    if subStrFind(permissaoCFG,cargoingame) then
                                                                        if not valores.cargoinvisivelstatus then
                                                                            grupos.logedicaodaorganizacao = logedicaodaorganizacao
                                                                            grupos.logalteracaodelog = logalteracaodelog
                                                                            grupos.logmembrosupados = logmembrosupados
                                                                            grupos.logmembrosrebaixados = logmembrosrebaixados
                                                                            grupos.logmembrosexpulsos = logmembrosexpulsos
                                                                            grupos.logmembrosadicionados = logmembrosadicionados
            
                                                                            vRP.Query("skdev_group/editarValoresOrg",{nomedogrupo = tabela.grupo, valoresnovos = json.encode(grupos)})
            
                                                                            SendWebhookMessage(grupos.logalteracaodelog,"```prolog\nLogs Alteradas!!!\n\n[ID]: "..user_id.." ALTEROU AS LOGS```")
                                                                            SendWebhookMessage(grupos.loggeral,"```prolog\nLogs Alteradas!!!\n\n[ID]: "..user_id.." ALTEROU AS LOGS```")
                                                                            enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." ALTEROU AS LOGS")
                                                                        end
                                                                    end
                                                                else
                                                                    if nomedocargoset == cargoingame then
                                                                        if not valores.cargoinvisivelstatus then
                                                                            grupos.logedicaodaorganizacao = logedicaodaorganizacao
                                                                            grupos.logalteracaodelog = logalteracaodelog
                                                                            grupos.logmembrosupados = logmembrosupados
                                                                            grupos.logmembrosrebaixados = logmembrosrebaixados
                                                                            grupos.logmembrosexpulsos = logmembrosexpulsos
                                                                            grupos.logmembrosadicionados = logmembrosadicionados
            
                                                                            if baseatual == 'creativev6' then
                                                                                vRP.Query("skdev_group/editarValoresOrg",{nomedogrupo = tabela.grupo, valoresnovos = json.encode(grupos)})
                                                                            else
                                                                                vRP.execute("skdev_group/editarValoresOrg",{nomedogrupo = tabela.grupo, valoresnovos = json.encode(grupos)})
                                                                            end
            
                                                                            SendWebhookMessage(grupos.logalteracaodelog,"```prolog\nLogs Alteradas!!!\n\n[ID]: "..user_id.." ALTEROU AS LOGS```")
                                                                            SendWebhookMessage(grupos.loggeral,"```prolog\nLogs Alteradas!!!\n\n[ID]: "..user_id.." ALTEROU AS LOGS```")
                                                                            enviarLogNoPainelOrgPropia(tabela.grupo,"[ID]: "..user_id.." ALTEROU AS LOGS")
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function skdevs.verificarPermissoesOrgPropia(iddocidadao,permissao,nomedogrupo)
    local source = source
    local user_id = 0
    if baseatual == 'creativev6' then
        user_id = vRP.Passport(source)
    else
        user_id = vRP.getUserId(source)
    end

    local idpesquisa = 0

    if iddocidadao then
        idpesquisa = parseInt(iddocidadao)
    else
        idpesquisa = parseInt(user_id)
    end

    local organizacao = {}
    local queryPerms = {}
    if baseatual == 'creativev6' then
        queryPerms = vRP.Query("skdev_group/organizacoesMembrosPermissoes")
    else
        queryPerms = vRP.query("skdev_group/organizacoesMembrosPermissoes")
    end
    local dispoPerms = #queryPerms > 0
    if dispoPerms then
        for posicao,tabela in pairs(queryPerms) do
            local idusuarios = parseInt(tabela.user_id)
            local cargos = json.decode(tabela.cargos)

            if idusuarios == idpesquisa then   
                if cargos ~= nil then
                    if #cargos > 0 then
                        for posicao,nomedocargo in pairs(cargos) do
                            local nomedocargoset = nomedocargo

                            local queryGroups = {}
                            if baseatual == 'creativev6' then
                                queryGroups = vRP.Query("skdev_group/staffrecebergrupos")
                            else
                                queryGroups = vRP.query("skdev_group/staffrecebergrupos")
                            end
                            local dispoGroups = #queryGroups > 0
                            if dispoGroups then
                                for posicao,tabela in pairs(queryGroups) do
                                    for k,v in pairs(tabela) do
                                        if k == 'valores' then
                                            local grupos = json.decode(v)
                                            if grupos ~= nil then
                                                if #grupos.gruposorganizacao > 0 then
                                                    for b,c in pairs(grupos.gruposorganizacao) do
                                                        for nomedocargo,valores in pairs(c) do
                                                            local cargoingame = valores.cargoingame[1]

                                                            if baseatual == 'creativev6' then
                                                                local permissaoCFG, grupoCFG = string.match(nomedocargoset, "([^%-]+)%-(.+)")
                                                                if subStrFind(permissaoCFG,cargoingame) then
                                                                    if nomedogrupo then
                                                                        if nomedogrupo == tabela.grupo then
                                                                            if #valores.permissoes[1] > 0 then
                                                                                for _,nomedapermissaodocargo in pairs(valores.permissoes[1]) do
                                                                                    if nomedapermissaodocargo == permissao then
                                                                                        return true
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        if #valores.permissoes[1] > 0 then
                                                                            for _,nomedapermissaodocargo in pairs(valores.permissoes[1]) do
                                                                                if nomedapermissaodocargo == permissao then
                                                                                    return true
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            else
                                                                if nomedocargoset == cargoingame then
                                                                    if nomedogrupo then
                                                                        if nomedogrupo == tabela.grupo then
                                                                            if #valores.permissoes[1] > 0 then
                                                                                for _,nomedapermissaodocargo in pairs(valores.permissoes[1]) do
                                                                                    if nomedapermissaodocargo == permissao then
                                                                                        return true
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    else
                                                                        if #valores.permissoes[1] > 0 then
                                                                            for _,nomedapermissaodocargo in pairs(valores.permissoes[1]) do
                                                                                if nomedapermissaodocargo == permissao then
                                                                                    return true
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    return false
end

logorgpropia = {}
posicaodelogatualorgpropia = {}

function enviarLogNoPainelOrgPropia(grupo,logmensagem)
    local grupoDisponivel = logorgpropia[grupo] ~= nil
    if grupoDisponivel then
        if posicaodelogatualorgpropia[grupo] == 3 then
            posicaodelogatualorgpropia[grupo] = 0
        end

        posicaodelogatualorgpropia[grupo] = posicaodelogatualorgpropia[grupo]+1

        logorgpropia[grupo][posicaodelogatualorgpropia[grupo]] = logmensagem
    else
        logorgpropia[grupo] = {logmensagem,false,false}
        posicaodelogatualorgpropia[grupo] = 1
    end
end

function visualizarLogOrgPropia(grupo,posicao)
    local grupoDisponivel = logorgpropia[grupo] ~= nil
    if grupoDisponivel then
        return logorgpropia[grupo][posicao]
    else
        return false
    end
end