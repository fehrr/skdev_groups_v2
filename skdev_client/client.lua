local Tunnel = module('vrp','lib/Tunnel')
local Proxy = module('vrp','lib/Proxy')
local vRP = Proxy.getInterface('vRP')
local vSERVER = Tunnel.getInterface('skdev_groups_v2')
skdevc = {}
Tunnel.bindInterface('skdev_groups_v2',skdevc)

RegisterNUICallback('verificarpermissoesorgpropia', function(data,cb)
    local iddocidadao = data.iddocidadao
    local permissao = data.permissao

    cb({status = vSERVER.verificarPermissoesOrgPropia(iddocidadao,permissao)})
end)

RegisterNUICallback('logsAlteradasOrgPropia', function(data,cb)
    local logedicaodaorganizacao = data.logedicaodaorganizacao
    local logalteracaodelog = data.logalteracaodelog
    local logmembrosupados = data.logmembrosupados
    local logmembrosrebaixados = data.logmembrosrebaixados
    local logmembrosexpulsos = data.logmembrosexpulsos
    local logmembrosadicionados = data.logmembrosadicionados

    vSERVER.logsAlteradasOrgPropia(logedicaodaorganizacao,logalteracaodelog,logmembrosupados,logmembrosrebaixados,logmembrosexpulsos,logmembrosadicionados)
end)

RegisterNUICallback('orgpropiainfosgerenciarpainel', function(data,cb)
    local nomeplayer2,nomeplayer,orgplayer,cargoplayer,membrostotais,membrosonline,membrosoffline,imagemplayer,Ultimalogorganizacao1,Ultimalogorganizacao2,Ultimalogorganizacao3 = vSERVER.VerificarInformacoesPlayerLocalOrganizacoes()
    local logedicaodaorganizacao,logalteracaodelog,logmembrosupados,logmembrosrebaixados,logmembrosexpulsos,logmembrosadicionados = vSERVER.VerificarInformacoesLogsPlayerLocal()

    cb({imagemperfil = imagemplayer, nomeplayer = nomeplayer, nomeplayer2 = nomeplayer2, orgplayer = orgplayer, cargoplayer = cargoplayer, logedicaodaorganizacao = logedicaodaorganizacao, logalteracaodelog = logalteracaodelog, logmembrosupados = logmembrosupados, logmembrosrebaixados = logmembrosrebaixados, logmembrosexpulsos = logmembrosexpulsos, logmembrosadicionados = logmembrosadicionados})
end)

RegisterNUICallback('removerMembroOrgPropia', function(data,cb)
    local iddomembroset = data.iddomembro
    local nomedaorg = data.nomedaorg

    vSERVER.removerMembroOrgPropia(nomedaorg,iddomembroset)
end)

RegisterNUICallback('rebaixarMembroOrgPropia', function(data,cb)
    local iddomembroset = data.iddomembro
    local nomedaorg = data.nomedaorg

    vSERVER.rebaixarMembroOrgPropia(nomedaorg,iddomembroset)
end)

RegisterNUICallback('uparMembroOrgPropia', function(data,cb)
    local iddomembroset = data.iddomembro
    local nomedaorg = data.nomedaorg

    vSERVER.uparMembroOrgPropia(nomedaorg,iddomembroset)
end)

function skdevc.updateMembrosOrgPropia()
    SendNUIMessage({updates = 'MembrosOrgPropia'})
end

RegisterNUICallback('orgpropiaadicionarmembro', function(data,cb)
    local iddomembroset = data.iddomembro
    local cargosreceber = data.cargoselecionados

    vSERVER.adicionarCargosNoMembro(iddomembroset,cargosreceber)
end)

RegisterNUICallback('orgpropiareceberinformacoes', function(data,cb)
    cb({organizacao = vSERVER.orgpropiareceberinformacoes()})
end)

RegisterNUICallback('concluidoEdicaoOrgPropia', function(data,cb)
    local nomeantigoorg = data.nomeantigo
    local nomenovodaorg = data.nomedaorganizacao
    local imagemdaorg = data.imagemdaorganizacao

    vSERVER.editarInformacoesOrgPropia(nomeantigoorg,nomenovodaorg,imagemdaorg)
end)

RegisterNUICallback('organizacaopropiaeditarreceberinformacoes', function(data,cb)
    local imagemorgpropia,nomeorgpropia = vSERVER.grupopropioreceberInformacoes()

    organizacao = {imagemorgpropia = imagemorgpropia, nomegrupo = nomeorgpropia}

    cb({organizacao = organizacao})
end)

RegisterNUICallback('grupopropioreceberInformacoes', function(data,cb)
    local imagemorgpropia,nomeorgpropia,membrostotaisorgpropia,membrosonlineorgpropia,membrosofflineorgpropia,membrosorgpropia = vSERVER.grupopropioreceberInformacoes()
    cb({imagemorgpropia = imagemorgpropia,nomeorgpropia = nomeorgpropia,membrostotaisorgpropia = membrostotaisorgpropia,membrosonlineorgpropia = membrosonlineorgpropia,membrosofflineorgpropia = membrosofflineorgpropia,membrosorgpropia = membrosorgpropia})
end)

RegisterNUICallback('organizacaoprincipalinfos', function(data,cb)
    local nomeplayer2,nomeplayer,orgplayer,cargoplayer,membrostotais,membrosonline,membrosoffline,imagemplayer,Ultimalogorganizacao1,Ultimalogorganizacao2,Ultimalogorganizacao3 = vSERVER.VerificarInformacoesPlayerLocalOrganizacoes()

    cb({nomeplayer = nomeplayer, nomeplayer2 = nomeplayer2, orgplayer = orgplayer, cargoplayer = cargoplayer, membrostotais = membrostotais, membrosonline = membrosonline, membrosoffline = membrosoffline, imagemplayer = imagemplayer, Ultimalogorganizacao1 = Ultimalogorganizacao1, Ultimalogorganizacao2 = Ultimalogorganizacao2, Ultimalogorganizacao3 = Ultimalogorganizacao3})
end)

-- Organizações

RegisterNUICallback('staffDeletarGrupo', function(data,cb)
    local nomedaorg = data.nomedaorganizacao

    vSERVER.deletarOrganizacaoStaffGrupo(nomedaorg)
end)

RegisterNUICallback('verificarpermissoesstaff', function(data,cb)
    local iddocidadao = data.iddocidadao
    local permissao = data.permissao

    cb({status = vSERVER.verificarPermissaoStaff(iddocidadao,permissao)})
end)

RegisterNUICallback('staffRemoverBlacklistCidadao', function(data,cb)
    local iddocidadao = data.iddocidadao

    vSERVER.removerBlacklistHoras(iddocidadao)
end)

RegisterNUICallback('staffAdicionarBlacklistCidadao', function(data,cb)
    local iddocidadao = data.iddocidadao
    local horasblacklist = data.horasblacklist

    vSERVER.adicionarHorasBlacklist(iddocidadao,horasblacklist)
end)

RegisterNUICallback('staffAtualizarCargosCidadao', function(data,cb)
    local iddocidadao = data.iddocidadao
    local cargos = data.cargos

    vSERVER.atualizarcargoscidadao(iddocidadao,cargos)
end)

local painelativo = false

RegisterNUICallback('staffreceberinformacoesid', function(data, cb)
    local idcidadao = data.iddocidadao
    local cargogrupos,cargosplayer,blacklistdata = vSERVER.gerenciarReceberInformacoesId(idcidadao)

    cb({cargogrupos = cargogrupos, cargosplayer = cargosplayer, blacklistdata = blacklistdata})
end)

RegisterNUICallback('enviarimagemusuario', function(data,cb)
    local linkdaimagem = data.linkimagen

    vSERVER.alteraimagemusuarioperfil(linkdaimagem)
end)

RegisterNUICallback('fecharpainel', function(data,cb)
    painelativo = false
    SetNuiFocus(false, false)
end)

RegisterNUICallback('logalteradainfos', function(data,cb)
    local logdeimagens = data.logdeimagens
    local logdecriacaodeorgs = data.logdecriacaodeorgs
    local logdegerenciarorgs = data.logdegerenciarorgs
    local logdegerenciarstaff = data.logdegerenciarstaff
    local logdealteracaodelogs = data.logdealteracaodelogs
    local logdegerenciarcidadoes = data.logdegerenciarcidadoes
    local logupamentodemembros = data.logupamentodemembros
    local logrebaixamentodemembros = data.logrebaixamentodemembros
    local logremocaodemembros = data.logremocaodemembros
    local logadicaodemembros = data.logadicaodemembros

    vSERVER.alterarlogsStaff(logdeimagens,logdecriacaodeorgs,logdegerenciarorgs,logdegerenciarstaff,logdealteracaodelogs,logdegerenciarcidadoes,logupamentodemembros,logrebaixamentodemembros,logremocaodemembros,logadicaodemembros)
end)

RegisterNUICallback('staffinfosgerenciarpainel', function(data, cb)
    local nomeplayer,orgplayer,cargoplayer,logdeimagens,logdecriacaodeorgs,logdegerenciarorgs,logdegerenciarstaff,logdealteracaodelogs,logdegerenciarcidadoes,logupamentodemembros,logrebaixamentodemembros,logremocaodemembros,logadicaodemembros,imagemperfil = vSERVER.VerificarInformacoesGerenciarPainel()

    cb({nomeplayer = nomeplayer,orgplayer = orgplayer,cargoplayer = cargoplayer,logdeimagens = logdeimagens,logdecriacaodeorgs = logdecriacaodeorgs,logdegerenciarorgs = logdegerenciarorgs,logdegerenciarstaff = logdegerenciarstaff,logdealteracaodelogs = logdealteracaodelogs,logdegerenciarcidadoes = logdegerenciarcidadoes,logupamentodemembros = logupamentodemembros,logrebaixamentodemembros = logrebaixamentodemembros,logremocaodemembros = logremocaodemembros,logadicaodemembros = logadicaodemembros, imagemperfil = imagemperfil})
end)

RegisterNUICallback('removerMembroStaff', function(data,cb)
    local iddomembro = data.iddomembro

    vSERVER.removerMembroStaff(iddomembro)
end)

RegisterNUICallback('rebaixarMembroStaff', function(data,cb)
    local iddomembro = data.iddomembro

    vSERVER.rebaixarMembroStaff(iddomembro)
end)

RegisterNUICallback('uparMembroStaff', function(data,cb)
    local iddomembro = data.iddomembro

    vSERVER.uparMembroStaff(iddomembro)
end)

RegisterNUICallback('staffadicionarmembro', function(data,cb)
    local iddomembro = data.iddomembro
    local cargos = data.cargoselecionados

    vSERVER.adicionarMembroCargo(iddomembro,cargos)
end)

RegisterNUICallback('verificaridblacklist', function(data,cb)
    local iddomembro = data.iddomembro
    local blackliststatus = vSERVER.getBlacklist(iddomembro)

    cb({blacklist = blackliststatus})
end)

RegisterNUICallback('concluidoEdicaoStaff', function(data,cb)
    local nomenovostaff = data.nomedaorganizacao
    local nomeantigostaff = data.nomeantigo
    local imagemstaff = data.imagemdaorganizacao
    local organizacaogrupos = data.permissoes

    vSERVER.editarStaffConfiguracoes(nomenovostaff,nomeantigostaff,imagemstaff,organizacaogrupos)
end)

RegisterNUICallback('staffeditarreceberinformacoes', function(data,cb)
    local organizacao = vSERVER.staffEditarInformacoes()
    cb({organizacao = organizacao})
end)

RegisterNUICallback('staffreceberInformacoes', function(data,cb)
    local imagemorgstaff,nomeorgstaff,membrostotaisstaff,membrosonlinestaff,membrosofflinestaff,membrosorgpropia = vSERVER.staffreceberInformacoes()
    cb({imagemorgstaff = imagemorgstaff,nomeorgstaff = nomeorgstaff,membrostotaisstaff = membrostotaisstaff,membrosonlinestaff = membrosonlinestaff,membrosofflinestaff = membrosofflinestaff,membrosorgpropia = membrosorgpropia})
end)

RegisterNUICallback('concluidoEdicaoOrganizacaoInfos', function(data,cb)
    local nomedaorganizacao = data.nomedaorganizacao
    local nomeantigo = data.nomeantigo

    vSERVER.EditarInformacoesDaOrganizacao(nomeantigo,nomedaorganizacao, data.imagemdaorganizacao, data.maximodemembrosorganizacao, data.logsgeraisorganizacao, data.blackliststatus, data.blacklisthoras, data.permissoes)
end)

RegisterNUICallback('staffEditarOrganizacaoGrupo', function(data,cb)
    local nomedaorganizacao = data.nomedaorganizacao
    local organizacao = vSERVER.OrganizacaoInformacoesEditar(nomedaorganizacao)
    cb({organizacao = organizacao})
end)

RegisterNUICallback('staffvisualizarEstatisticasOrganizacao', function(data,cb)
    local nomedaorganizacao = data.organizacao
    local imagemOrg,totaldemembros,membrosonline,membrosoffline,cargos,membros = vSERVER.OrganizacaoInformacoesVisualizar(nomedaorganizacao)
    cb({imagemOrg = imagemOrg, totaldemembros = totaldemembros, membrosonline = membrosonline, membrosoffline = membrosoffline, cargos = cargos, membros = membros})
end)

RegisterNUICallback('staffreceberorganizacoes', function(data,cb)
    local organizacoes = vSERVER.OrganizacoesGerenciar()
    cb({organizacoestabela = organizacoes})
end)

RegisterNUICallback('tabelaOrganizacoesCriar', function(data,cb)
    local organizacoes = vSERVER.ListaOrganizacoesStaff()
    cb({listaorganizacoes = organizacoes})
end)

RegisterNUICallback('obterWebhookImagemStaff', function(data,cb)
    local hookurl = vSERVER.obterWebhookImagemStaff()
    cb({webhook = hookurl})
end)

RegisterNUICallback('criarOrganizacaoInfos', function(data, cb)
    local nomedaorganizacao = data.nomedaorganizacao
    local imagemdaorganizacao = data.imagemdaorganizacao
    local maximodemembrosorganizacao = data.maximodemembrosorganizacao
    local logsgeraisorganizacao = data.logsgeraisorganizacao
    local blackliststatus = data.blackliststatus
    local blacklisthoras = data.blacklisthoras
    local permissoes = data.permissoes

    vSERVER.CriarOrganizacaoStaff(nomedaorganizacao, imagemdaorganizacao, maximodemembrosorganizacao, logsgeraisorganizacao, blackliststatus, blacklisthoras, permissoes)
end)

RegisterNUICallback('staffprincipalinfos', function(data, cb)
    local nomedoplayer2,nomedoplayer,nomeorganizacao,nomedocargodoplayer,quantidadedeajudantesonline,quantidadetotaldeorgs,imagemplayer,ultimalogstaff1,ultimalogstaff2,ultimalogstaff3 = vSERVER.VerificarInformacoesPlayerLocalStaff()

    cb({nomeplayer = nomedoplayer, nomedoplayer2 = nomedoplayer2, orgplayer = nomeorganizacao, cargoplayer = nomedocargodoplayer, ajudantesonline = quantidadedeajudantesonline, totaldeorgs = quantidadetotaldeorgs, totaldecidadoesonline = #GetActivePlayers(), imagemplayer = imagemplayer, UltimaLogstaff1 = ultimalogstaff1, UltimaLogstaff2 = ultimalogstaff2, UltimaLogstaff3 = ultimalogstaff3})
end)

function skdevc.updateMembrosStaff()
    SendNUIMessage({updates = 'MembrosStaff'})
end

RegisterCommand(comandopaineladministrador, function(source,args,rawcmd)
    if painelativo then
        SendNUIMessage({fecharpainel = true})
    else
        local verificar = vSERVER.VerificarPermissaodeStaff()
        local nomedoplayer2,nomedoplayer,nomeorganizacao,nomedocargodoplayer,quantidadedeajudantesonline,quantidadetotaldeorgs,imagemplayer,ultimalogstaff1,ultimalogstaff2,ultimalogstaff3 = vSERVER.VerificarInformacoesPlayerLocalStaff()
    
        if verificar then
            SendNUIMessage({abrirpainel = 'PainelADM', nomeplayer = nomedoplayer, nomedoplayer2 = nomedoplayer2, orgplayer = nomeorganizacao, cargoplayer = nomedocargodoplayer, ajudantesonline = quantidadedeajudantesonline, totaldeorgs = quantidadetotaldeorgs, totaldecidadoesonline = #GetActivePlayers(), imagemplayer = imagemplayer, UltimaLogstaff1 = ultimalogstaff1, UltimaLogstaff2 = ultimalogstaff2, UltimaLogstaff3 = ultimalogstaff3})
            SetNuiFocus(true, true)
            painelativo = not painelativo
        end
    end
end)

RegisterCommand(comandopainelorganizacao, function(source,args,rawcmd)
    if painelativo then
        SendNUIMessage({fecharpainel = true})
    else
        local verificarPermOrganizacao = vSERVER.verificarPermOrganizacao()
        local nomeplayer2,nomeplayer,orgplayer,cargoplayer,membrostotais,membrosonline,membrosoffline,imagemplayer,Ultimalogorganizacao1,Ultimalogorganizacao2,Ultimalogorganizacao3 = vSERVER.VerificarInformacoesPlayerLocalOrganizacoes()

        if verificarPermOrganizacao then
            SendNUIMessage({abrirpainel = 'PainelORG', nomeplayer = nomeplayer, nomeplayer2 = nomeplayer2,orgplayer = orgplayer,cargoplayer = cargoplayer,membrostotais = membrostotais,membrosonline = membrosonline,membrosoffline = membrosoffline,imagemplayer = imagemplayer,Ultimalogorganizacao1 = Ultimalogorganizacao1,Ultimalogorganizacao2 = Ultimalogorganizacao2,Ultimalogorganizacao3 = Ultimalogorganizacao3})
            SetNuiFocus(true, true)
            painelativo = not painelativo
        end
    end
end)