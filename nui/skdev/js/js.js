let acoes = 'nenhuma'

function AlterarMenu(menu,nomedaorg) {
    if (menu != undefined) {
        if (menu === 'Inicio') {
            if (acoes === 'staff') {
                if ($('.fundopainel').css('display') === 'none') {
                    $('.teladeloading').css('display', 'flex')
                    setTimeout(() => {
                        $('.fundopainel').css('display', 'none')
                        $('.adicionarcargo').css('display', 'none')
                        $('.selecionarcriarouexistente').css('display', 'none')
                        $('.painelcriargrupo').css('display', 'none')
                        $('.gerenciargrupostaff').css('display', 'none')
                        $('.estatisticasgrupo').css('display', 'none')
                        $('.gerenciarstaff').css('display', 'none')
                        $('.adicionarmembro').css('display', 'none')
                        $('.gerenciarpainelstaff').css('display', 'none')
                        $('.gerenciarcidadao').css('display', 'none')

                        $.post(`http://${GetParentResourceName()}/staffprincipalinfos`, JSON.stringify({}), (data) => {
                            $('.box-perfil:nth-of-type(1) h2').html(data.nomeplayer)
                            $('.box-perfil:nth-of-type(2) h2').html(data.orgplayer)
                            $('.box-perfil:nth-of-type(3) h2').html(data.cargoplayer)
                            $('.bemvindopainel h2').html('Seja bem vindo, '+data.nomedoplayer2+'!')
                            $('.box-botaomenu').removeAttr('selecionadobox')
                            $('.box-botaomenu:nth-of-type(1)').attr('selecionadobox', '')

                            $('.fundopainel').css('display', 'flex')
                            $('.boxinformacao:nth-of-type(1) h2').html(`Ajudantes Online: ${data.ajudantesonline}`)
                            $('.boxinformacao:nth-of-type(2) h2').html(`Organizações: ${data.totaldeorgs}`)
                            $('.boxinformacao:nth-of-type(3) h2').html(`Cidadões Online: ${data.totaldecidadoesonline}`)

                            if (data.UltimaLogstaff1 != undefined) {
                                $('.logdiv:nth-of-type(1) h2').html(`${data.UltimaLogstaff1}`)
                            }
                            if (data.UltimaLogstaff2 != undefined) {
                                $('.logdiv:nth-of-type(2) h2').html(`${data.UltimaLogstaff2}`)
                            }
                            if (data.UltimaLogstaff3 != undefined) {
                                $('.logdiv:nth-of-type(3) h2').html(`${data.UltimaLogstaff3}`)
                            }
                        })

                        $('.teladeloading').attr('desaparecer', '')
                        setTimeout(() => {
                            $('.teladeloading').removeAttr('desaparecer')
                            $('.teladeloading').css('display', 'none')
                        }, 800)
                    }, 1000)
                }
            }

            if (acoes === 'organizacao') {
                if ($('.fundopainel').css('display') === 'none') {
                    $('.teladeloading').css('display', 'flex')
                    setTimeout(() => {
                        $('.fundopainel').css('display', 'none')
                        $('.adicionarcargo').css('display', 'none')
                        $('.selecionarcriarouexistente').css('display', 'none')
                        $('.painelcriargrupo').css('display', 'none')
                        $('.gerenciargrupostaff').css('display', 'none')
                        $('.estatisticasgrupo').css('display', 'none')
                        $('.gerenciarstaff').css('display', 'none')
                        $('.adicionarmembro').css('display', 'none')
                        $('.gerenciarpainelstaff').css('display', 'none')

                        $.post(`http://${GetParentResourceName()}/organizacaoprincipalinfos`, JSON.stringify({}), (data) => {
                            var texto = `Você está dentro do painel de organizações<br>que no qual foi criado pensando em agilizar a etapa<br>de você gerenciar sua organização sendo assim agilizando<br>etapas que poderiam demorar horas de espera<br>nesse painel você poderá upar, rebaixar, expulsar, adicionar<br>sendo uma etapa muito interativa com você e seus membros!`
                            $('.bemvindopainel h3').html(texto)
                            $('.textologs').html(`Ultimas ações dos seus membros`)
                            $('.box-perfil:nth-of-type(1) h2').html(data.nomeplayer)
                            $('.box-perfil:nth-of-type(2) h2').html(data.orgplayer)
                            $('.box-perfil:nth-of-type(3) h2').html(data.cargoplayer)
                            $('.bemvindopainel h2').html('Seja bem vindo, '+data.nomeplayer2+'!')
                            $('.box-botaomenu').removeAttr('selecionadobox')
                            $('.box-botaomenu:nth-of-type(1)').attr('selecionadobox', '')
                            $('.groups').css('display', 'flex')
                            $('.fundopainel').css('display', 'flex')
                            $('.boxinformacao:nth-of-type(1) img').attr('src', './skdev/img/membros.png')
                            $('.boxinformacao:nth-of-type(2) img').attr('src', './skdev/img/membrostotal.png')
                            $('.boxinformacao:nth-of-type(3) img').attr('src', './skdev/img/pessoas.png')
                            $('.boxinformacao:nth-of-type(1) h2').html(`Membros totais: ${data.membrostotais}`)
                            $('.boxinformacao:nth-of-type(2) h2').html(`Membros online: ${data.membrosonline}`)
                            $('.boxinformacao:nth-of-type(3) h2').html(`Membros offline: ${data.membrosoffline}`)

                            if (data.imagemplayer) {
                                $('.perfilimg').attr('src', data.imagemplayer)
                            }
                            if (data.Ultimalogorganizacao1) {
                                $('.logdiv:nth-of-type(1) h2').html(`${data.Ultimalogorganizacao1}`)
                            }
                            if (data.Ultimalogorganizacao2) {
                                $('.logdiv:nth-of-type(2) h2').html(`${data.Ultimalogorganizacao2}`)
                            }
                            if (data.Ultimalogorganizacao3) {
                                $('.logdiv:nth-of-type(3) h2').html(`${data.Ultimalogorganizacao3}`)
                            }
                        })
                        $('.teladeloading').attr('desaparecer', '')
                        setTimeout(() => {
                            $('.teladeloading').removeAttr('desaparecer')
                            $('.teladeloading').css('display', 'none')
                        }, 800)
                    }, 1000)
                }
            }
        }
        // Final botão inicio

        if (menu === 'CriarGrupos') {
            if (acoes === 'staff') {
                $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Criar Organizações' }), (data) => {
                    let status = data.status

                    if (status) {
                        if ($('.selecionarcriarouexistente').css('display') === 'none') {
                            $('.teladeloading').css('display', 'flex')
                            setTimeout(() => {
                                $('.fundopainel').css('display', 'none')
                                $('.adicionarcargo').css('display', 'none')
                                $('.selecionarcriarouexistente').css('display', 'none')
                                $('.painelcriargrupo').css('display', 'none')
                                $('.gerenciargrupostaff').css('display', 'none')
                                $('.estatisticasgrupo').css('display', 'none')
                                $('.gerenciarstaff').css('display', 'none')
                                $('.adicionarmembro').css('display', 'none')
                                $('.gerenciarpainelstaff').css('display', 'none')
                                $('.gerenciarcidadao').css('display', 'none')

                                $('.box-botaomenu').removeAttr('selecionadobox')
                                $('.box-botaomenu:nth-of-type(2)').attr('selecionadobox', '')

                                let html = `
                                <div class="boxcriarouexistente">
                                    <h2>
                                        Você pretende criar uma organização<br>
                                        ou usar uma existente para criar outra?
                                    </h2>
                    
                                    <img src="./skdev/img/seta.png" class="setaselecionarcriarouexistentesssss" draggable="false">
                                    <select class="selecionarcriarouexistentessssss" onchange="SelecionarCriacaodegrupos()">
                                        <option value="nada">Selecionar Opção</option>
                                        <option value="valor2">Criar Uma Nova Organização</option>
                                        <option value="valor3">Usar Organização Existente</option>
                                    </select>
                                </div>
                                `
                                $('.selecionarcriarouexistente').html(html)
                                $('.selecionarcriarouexistente').css('display', 'flex')

                                $('.teladeloading').attr('desaparecer', '')
                                setTimeout(() => {
                                    $('.teladeloading').removeAttr('desaparecer')
                                    $('.teladeloading').css('display', 'none')
                                }, 800)
                            }, 1000)
                        }
                    }
                })
            }
        }

        if (menu === 'GerenciarGrupos') {
            if (acoes === 'staff') {
                $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Organizações' }), (data) => {
                    let status = data.status

                    if (status) {
                        if ($('.gerenciargrupostaff').css('display') === 'none') {
                            $('.teladeloading').css('display', 'flex')
                            setTimeout(() => {
                                $('.fundopainel').css('display', 'none')
                                $('.adicionarcargo').css('display', 'none')
                                $('.selecionarcriarouexistente').css('display', 'none')
                                $('.painelcriargrupo').css('display', 'none')
                                $('.estatisticasgrupo').css('display', 'none')
                                $('.gerenciarstaff').css('display', 'none')
                                $('.adicionarmembro').css('display', 'none')
                                $('.gerenciarpainelstaff').css('display', 'none')
                                $('.gerenciarcidadao').css('display', 'none')


                                $('.boxgrupos').html('')
                                $.post(`http://${GetParentResourceName()}/staffreceberorganizacoes`, JSON.stringify({}), (data) => {
                                    let organizacoes = data.organizacoestabela

                                    if (organizacoes != undefined && organizacoes.length > 0) {
                                        organizacoes.forEach((texto, index) => {
                                            let nomegrupo = texto.nomedogrupo
                                            let imagemgrupo = undefined
                                            if (texto.imagemdogrupo != undefined) {
                                                imagemgrupo = texto.imagemdogrupo
                                            } else {
                                                imagemgrupo = './skdev/img/perfil.png'
                                            }

                                            let appendOrganizacao = `
                                                <div class="grupogerenciargrupobox">
                                                    <div class="bolinhalogogerenciargrupo">
                                                        <img src="${imagemgrupo}" draggable="false">
                                                    </div>
                                
                                                    <h2 class="h2gruponome">${nomegrupo}</h2>
                                                    <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('${nomegrupo}')">
                                                        <img src="./skdev/img/visualizar.png" draggable="false">
                                                        <h2>Visualizar Estatisticas</h2>
                                                    </button>
                                                    <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('${nomegrupo}')">
                                                        <img src="./skdev/img/editar.png" draggable="false">
                                                        <h2>Editar Organização</h2>
                                                    </button>
                                                    <button class="editarorganizacaodeletargrupo" onclick="deletarOrganizacaoGrupo('${nomegrupo}')">
                                                        <img src="./skdev/img/excluir.png" draggable="false">
                                                        <h2>Excluir Organizacão</h2>
                                                    </button>
                                                </div>
                                            `
                                            $('.boxgrupos').append(appendOrganizacao)
                                        })
                                    }
                                })

                                $('.box-botaomenu').removeAttr('selecionadobox')
                                $('.box-botaomenu:nth-of-type(3)').attr('selecionadobox', '')
                                $('.gerenciargrupostaff').css('display', 'flex')

                                $('.teladeloading').attr('desaparecer', '')
                                setTimeout(() => {
                                    $('.teladeloading').removeAttr('desaparecer')
                                    $('.teladeloading').css('display', 'none')
                                }, 800)
                            }, 1000)
                        }
                    }
                })
            }
        }

        if (menu === 'GerenciarStaff') {
            if (acoes === 'staff') {
                $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Staff' }), (data) => {
                    let status = data.status

                    if (status) {
                        if ($('.gerenciarstaff').css('display') === 'none') {
                            $('.teladeloading').css('display', 'flex')
                            setTimeout(() => {
                                $('.fundopainel').css('display', 'none')
                                $('.adicionarcargo').css('display', 'none')
                                $('.selecionarcriarouexistente').css('display', 'none')
                                $('.painelcriargrupo').css('display', 'none')
                                $('.estatisticasgrupo').css('display', 'none')
                                $('.gerenciargrupostaff').css('display', 'none')
                                $('.gerenciarstaff').css('display', 'none')
                                $('.adicionarmembro').css('display', 'none')
                                $('.gerenciarpainelstaff').css('display', 'none')
                                $('.gerenciarcidadao').css('display', 'none')

                                $.post(`http://${GetParentResourceName()}/staffreceberInformacoes`, JSON.stringify({}), (data) => {
                                    let imagemstaff = ''
                                    if (data.imagemorgstaff.length > 0) {
                                        imagemstaff = data.imagemorgstaff
                                    } else {
                                        imagemstaff = './skdev/img/perfil.png'
                                    }

                                    let html = `
                                    <div class="gerenciarstaff_logobolinha"><img src="${imagemstaff}" draggable="false"></div>
                        
                                    <h2 class="gerenciarstaff_nomedaorg">Nome da Organização</h2>
                                    <input type="text" value="${data.nomeorgstaff}" class="gerenciarstaff_inputnomedaorg" disabled>
                        
                                    <div class="gerenciarstaff_membrostotais">
                                        <img src="./skdev/img/membros.png" draggable="false">
                                        <h2>Membros Totais: ${data.membrostotaisstaff}</h2>
                                    </div>
                                    <div class="gerenciarstaff_membrosonline">
                                        <img src="./skdev/img/online.png" draggable="false">
                                        <h2>Membros Online: ${data.membrosonlinestaff}</h2>
                                    </div>
                                    <div class="gerenciarstaff_membrosoffline">
                                        <img src="./skdev/img/offline.png" draggable="false">
                                        <h2>Membros Offline: ${data.membrosofflinestaff}</h2>
                                    </div>
                        
                                    <button class="gerenciarstaff_botaoeditargrupodestaff" onclick="gerenciarStaffEditarGrupoStaff()">
                                        Editar Grupo de Staff
                                        <img src="./skdev/img/editar.png" draggable="false">
                                    </button>
                        
                                    <h2 class="gerenciarstaff_partedemembrosh2">Parte dos Membros</h2>
                                    <div class="gerenciarstaff_barraseparacaopartedemembros"></div>
                        
                                    <img src="./skdev/img/pesquisar.png" class="gerenciarstaff_pesquisarimg" draggable="false">
                                    <input type="text" class="gerenciarstaff_pesquisarmembroinput" oninput="pesquisarMembrosOrgPropia()">
                        
                                    <button class="gerenciarstaff_botaodeaaz" onclick="AAZBotaoorgpropia()"><img src="./skdev/img/aaz.png" draggable="false"></button>
                                    <button class="gerenciarstaff_botaoadicionarmembro" onclick="gerenciarstaffBotaoadicionarmembro()">
                                        Adicionar Membro
                                        <img src="./skdev/img/adicionar.png" draggable="false">
                                    </button>
                        
                                    <div class="gerenciarstaff_boxmembros">
                                        <div class="gerenciarstaff_membro">
                                            <img src="./skdev/img/online.png" draggable="false">
                                            <h2 class="gerenciarstaff_iddomembroh2">1000234</h2>
                                            <h2 class="gerenciarstaff_nomedomembroh2">Guilherme da Cunha</h2>
                                            <h2 class="gerenciarstaff_cargodomembroh2">Supervisor Geral</h2>
                        
                                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                        </div>
                                    </div>
                                    `

                                    $('.gerenciarstaff').html(html)
                                    $('.gerenciarstaff_boxmembros').html('')

                                    let membrosOrgPropia = data.membrosorgpropia
                                    if (membrosOrgPropia != undefined) {
                                        membrosOrgPropia.forEach((texto, index) => {
                                            if (texto.status === 'online') {
                                                let appendMembroGerenciarStaff = `
                                                <div class="gerenciarstaff_membro">
                                                    <img src="./skdev/img/online.png" draggable="false">
                                                    <h2 class="gerenciarstaff_iddomembroh2">${texto.iddomembro}</h2>
                                                    <h2 class="gerenciarstaff_nomedomembroh2">${texto.nomedomembro}</h2>
                                                    <h2 class="gerenciarstaff_cargodomembroh2">${texto.cargodomembro}</h2>
                                
                                                    <div class="gerenciarstaff_boxupar" onclick="gerenciarStaffUpar(${texto.iddomembro})"><img src="./skdev/img/upar.png" draggable="false"></div>
                                                    <div class="gerenciarstaff_boxrebaixar" onclick="gerenciarStaffRebaixar(${texto.iddomembro})"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                                    <div class="gerenciarstaff_boxremover" onclick="gerenciarStaffRemover(${texto.iddomembro})"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                                </div>
                                                `
                                                $('.gerenciarstaff_boxmembros').append(appendMembroGerenciarStaff)
                                            }
                                            if (texto.status === 'offline') {
                                                let appendMembroGerenciarStaff = `
                                                <div class="gerenciarstaff_membro">
                                                    <img src="./skdev/img/offline.png" draggable="false">
                                                    <h2 class="gerenciarstaff_iddomembroh2">${texto.iddomembro}</h2>
                                                    <h2 class="gerenciarstaff_nomedomembroh2">${texto.nomedomembro}</h2>
                                                    <h2 class="gerenciarstaff_cargodomembroh2">${texto.cargodomembro}</h2>
                                
                                                    <div class="gerenciarstaff_boxupar" onclick="gerenciarStaffUpar(${texto.iddomembro})"><img src="./skdev/img/upar.png" draggable="false"></div>
                                                    <div class="gerenciarstaff_boxrebaixar" onclick="gerenciarStaffRebaixar(${texto.iddomembro})"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                                    <div class="gerenciarstaff_boxremover" onclick="gerenciarStaffRemover(${texto.iddomembro})"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                                </div>
                                                `
                                                $('.gerenciarstaff_boxmembros').append(appendMembroGerenciarStaff)
                                            }
                                        })
                                    }

                                    $('.box-botaomenu').removeAttr('selecionadobox')
                                    $('.box-botaomenu:nth-of-type(4)').attr('selecionadobox', '')
                                    $('.gerenciarstaff').css('display', 'flex')
                                })

                                $('.teladeloading').attr('desaparecer', '')
                                setTimeout(() => {
                                    $('.teladeloading').removeAttr('desaparecer')
                                    $('.teladeloading').css('display', 'none')
                                }, 800)
                            }, 1000)
                        }
                    }
                })
            }

            if (acoes === 'organizacao') {
                $.post(`http://${GetParentResourceName()}/verificarpermissoesorgpropia`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Grupo' }), (data) => {
                    let status = data.status

                    if (status) {
                        if ($('.gerenciarstaff').css('display') === 'none') {
                            $('.teladeloading').css('display', 'flex')
                            setTimeout(() => {
                                $('.fundopainel').css('display', 'none')
                                $('.adicionarcargo').css('display', 'none')
                                $('.selecionarcriarouexistente').css('display', 'none')
                                $('.painelcriargrupo').css('display', 'none')
                                $('.estatisticasgrupo').css('display', 'none')
                                $('.gerenciargrupostaff').css('display', 'none')
                                $('.gerenciarstaff').css('display', 'none')
                                $('.adicionarmembro').css('display', 'none')
                                $('.gerenciarpainelstaff').css('display', 'none')
                                $('.gerenciarcidadao').css('display', 'none')
        
                                $.post(`http://${GetParentResourceName()}/grupopropioreceberInformacoes`, JSON.stringify({}), (data) => {
                                    let imagemorg = ''
                                    if (data.imagemorgpropia.length > 0) {
                                        imagemorg = data.imagemorgpropia
                                    } else {
                                        imagemorg = './skdev/img/perfil.png'
                                    }
        
                                    let html = `
                                    <div class="gerenciarstaff_logobolinha"><img src="${imagemorg}" draggable="false"></div>
                        
                                    <h2 class="gerenciarstaff_nomedaorg">Nome da Organização</h2>
                                    <input type="text" value="${data.nomeorgpropia}" class="gerenciarstaff_inputnomedaorg" disabled>
                        
                                    <div class="gerenciarstaff_membrostotais">
                                        <img src="./skdev/img/membros.png" draggable="false">
                                        <h2>Membros Totais: ${data.membrostotaisorgpropia}</h2>
                                    </div>
                                    <div class="gerenciarstaff_membrosonline">
                                        <img src="./skdev/img/online.png" draggable="false">
                                        <h2>Membros Online: ${data.membrosonlineorgpropia}</h2>
                                    </div>
                                    <div class="gerenciarstaff_membrosoffline">
                                        <img src="./skdev/img/offline.png" draggable="false">
                                        <h2>Membros Offline: ${data.membrosofflineorgpropia}</h2>
                                    </div>
                        
                                    <button class="gerenciarstaff_botaoeditargrupodestaff" onclick="gerenciarOrgpropiaEditarGrupo()">
                                        Editar Grupo Propio
                                        <img src="./skdev/img/editar.png" draggable="false">
                                    </button>
                        
                                    <h2 class="gerenciarstaff_partedemembrosh2">Parte dos Membros</h2>
                                    <div class="gerenciarstaff_barraseparacaopartedemembros"></div>
                        
                                    <img src="./skdev/img/pesquisar.png" class="gerenciarstaff_pesquisarimg" draggable="false">
                                    <input type="text" class="gerenciarstaff_pesquisarmembroinput" oninput="pesquisarMembrosOrgPropia()">
                        
                                    <button class="gerenciarstaff_botaodeaaz" onclick="AAZBotaoorgpropia()"><img src="./skdev/img/aaz.png" draggable="false"></button>
                                    <button class="gerenciarstaff_botaoadicionarmembro" onclick="gerenciarorgpropiaBotaoadicionarmembro()">
                                        Adicionar Membro
                                        <img src="./skdev/img/adicionar.png" draggable="false">
                                    </button>
                        
                                    <div class="gerenciarstaff_boxmembros">
                                        <div class="gerenciarstaff_membro">
                                            <img src="./skdev/img/online.png" draggable="false">
                                            <h2 class="gerenciarstaff_iddomembroh2">1000234</h2>
                                            <h2 class="gerenciarstaff_nomedomembroh2">Guilherme da Cunha</h2>
                                            <h2 class="gerenciarstaff_cargodomembroh2">Supervisor Geral</h2>
                        
                                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                        </div>
                                    </div>
                                    `
        
                                    $('.gerenciarstaff').html(html)
                                    $('.gerenciarstaff_boxmembros').html('')
        
                                    let membrosOrgPropia = data.membrosorgpropia
                                    if (membrosOrgPropia != undefined) {
                                        membrosOrgPropia.forEach((texto, index) => {
                                            if (texto.status === 'online') {
                                                let appendMembroGerenciarOrgPropia = `
                                                <div class="gerenciarstaff_membro">
                                                    <img src="./skdev/img/online.png" draggable="false">
                                                    <h2 class="gerenciarstaff_iddomembroh2">${texto.iddomembro}</h2>
                                                    <h2 class="gerenciarstaff_nomedomembroh2">${texto.nomedomembro}</h2>
                                                    <h2 class="gerenciarstaff_cargodomembroh2">${texto.cargodomembro}</h2>
                                
                                                    <div class="gerenciarstaff_boxupar" onclick="gerenciarGrupoPropioUpar('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/upar.png" draggable="false"></div>
                                                    <div class="gerenciarstaff_boxrebaixar" onclick="gerenciarGrupoPropioRebaixar('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                                    <div class="gerenciarstaff_boxremover" onclick="gerenciarGrupoPropioRemover('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                                </div>
                                                `
                                                $('.gerenciarstaff_boxmembros').append(appendMembroGerenciarOrgPropia)
                                            }
                                            if (texto.status === 'offline') {
                                                let appendMembroGerenciarOrgPropia = `
                                                <div class="gerenciarstaff_membro">
                                                    <img src="./skdev/img/offline.png" draggable="false">
                                                    <h2 class="gerenciarstaff_iddomembroh2">${texto.iddomembro}</h2>
                                                    <h2 class="gerenciarstaff_nomedomembroh2">${texto.nomedomembro}</h2>
                                                    <h2 class="gerenciarstaff_cargodomembroh2">${texto.cargodomembro}</h2>
                                
                                                    <div class="gerenciarstaff_boxupar" onclick="gerenciarGrupoPropioUpar('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/upar.png" draggable="false"></div>
                                                    <div class="gerenciarstaff_boxrebaixar" onclick="gerenciarGrupoPropioRebaixar('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                                    <div class="gerenciarstaff_boxremover" onclick="gerenciarGrupoPropioRemover('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                                </div>
                                                `
                                                $('.gerenciarstaff_boxmembros').append(appendMembroGerenciarOrgPropia)
                                            }
                                        })
                                    }
        
                                    $('.box-botaomenu').removeAttr('selecionadobox')
                                    $('.box-botaomenu:nth-of-type(2)').attr('selecionadobox', '')
                                    $('.gerenciarstaff').css('display', 'flex')
                                })
        
                                $('.teladeloading').attr('desaparecer', '')
                                setTimeout(() => {
                                    $('.teladeloading').removeAttr('desaparecer')
                                    $('.teladeloading').css('display', 'none')
                                }, 800)
                            }, 1000)
                        }
                    }
                })
            }
        }

        if (menu === 'ConfigurarPainel') {
            if (acoes === 'staff') {
                if ($('.gerenciarpainelstaff').css('display') === 'none') {
                    permissoesTotais = []
                    arraySelecionados = []
                    $('.teladeloading').css('display', 'flex')
                    setTimeout(() => {
                        $('.fundopainel').css('display', 'none')
                        $('.adicionarcargo').css('display', 'none')
                        $('.selecionarcriarouexistente').css('display', 'none')
                        $('.painelcriargrupo').css('display', 'none')
                        $('.estatisticasgrupo').css('display', 'none')
                        $('.gerenciargrupostaff').css('display', 'none')
                        $('.gerenciarstaff').css('display', 'none')
                        $('.adicionarmembro').css('display', 'none')
                        $('.gerenciarpainelstaff').css('display', 'none')
                        $('.gerenciarcidadao').css('display', 'none')

                        $.post(`http://${GetParentResourceName()}/staffinfosgerenciarpainel`, JSON.stringify({}), (data) => {
                            let imagemperfil = ''
                            if (data.imagemperfil != undefined) {
                                imagemperfil = "./skdev/img/perfil.png"
                            } else {
                                imagemperfil = data.imagemperfil
                            }

                            var gerenciarStaffHTML = `
                            <div class="gerenciarpainelstaff_logobolinha">
                                <img src="./skdev/img/logo.png" draggable="false">
                            </div>
                
                            <div class="gerenciarpainelstaff_fotodeperfil" onclick="eventoclicarusuarioimagemperfil()"><img src="${imagemperfil}" draggable="false"></div>
                            <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputusuarioimagenenviar" onchange="perfilusuarioImagenEnviar(event)">
                            <div class="gerenciarpainelstaff_boxnome">
                                <img src="./skdev/img/nome.png" draggable="false">
                                <h2>${data.nomeplayer}</h2>
                            </div>
                            <div class="gerenciarpainelstaff_boxgrupo">
                                <img src="./skdev/img/grupo.png" draggable="false">
                                <h2>${data.orgplayer}</h2>
                            </div>
                            <div class="gerenciarpainelstaff_boxcargo">
                                <img src="./skdev/img/cargo.png" draggable="false">
                                <h2>${data.cargoplayer}</h2>
                            </div>
                
                            <button class="gerenciarpainelstaff_botaopaineladicionarmembros" onclick="painelgerenciarcidadoes()">
                                <h2>Painel Gerenciar Cidadões</h2>
                                <img src="./skdev/img/adicionarmembro.png" draggable="false">
                            </button>
                            <button class="gerenciarpainelstaff_botaosalvaralteracoesdelog" onclick="salvarAlteracoesdeLog()">
                                <h2>Salvar Alterações de Log</h2>
                                <img src="./skdev/img/salvar.png" draggable="false">
                            </button>

                            <h2 class="gerenciarpainelstaff_h2logdeenviarimagens">Log de Enviar Imagens</h2>
                            <input type="text" value="${data.logdeimagens}" class="gerenciarpainelstaff_inputlogdeenviarimagens">
                            <h2 class="gerenciarpainelstaff_h2logdecriacaodeorganizacoes">Log de Criação de Organizacões</h2>
                            <input type="text" value="${data.logdecriacaodeorgs}" class="gerenciarpainelstaff_inputlogdecriacaodeorganizacoes">
                            <h2 class="gerenciarpainelstaff_h2logdegerenciarorganizacoes">Log de Gerenciar Organizações</h2>
                            <input type="text" value="${data.logdegerenciarorgs}" class="gerenciarpainelstaff_inputlogdegerenciarorganizacoes">
                            <h2 class="gerenciarpainelstaff_h2logdegerenciarstaff">Log de Gerenciar Staff</h2>
                            <input type="text" value="${data.logdegerenciarstaff}" class="gerenciarpainelstaff_inputlogdegerenciarstaff">
                            <h2 class="gerenciarpainelstaff_h2logdealteracaodelogs">Log de Alteração de Logs</h2>
                            <input type="text" value="${data.logdealteracaodelogs}" class="gerenciarpainelstaff_inputlogdealteracaodelogs">
                            <h2 class="gerenciarpainelstaff_h2logdegerenciarcidadoes">Log de Gerenciar Cidadões</h2>
                            <input type="text" value="${data.logdegerenciarcidadoes}" class="gerenciarpainelstaff_inputlogdegerenciarcidadoes">
                            <h2 class="gerenciarpainelstaff_h2logupamentodemembros">Log Upamento de Membros</h2>
                            <input type="text" value="${data.logupamentodemembros}" class="gerenciarpainelstaff_inputlogupamentodemembros">
                            <h2 class="gerenciarpainelstaff_h2logrebaixamentodemembros">Log Rebaixamento de Membros</h2>
                            <input type="text" value="${data.logrebaixamentodemembros}" class="gerenciarpainelstaff_inputlogrebaixamentodemembros">
                            <h2 class="gerenciarpainelstaff_h2logremocaodemembros">Log Remoção de Membros</h2>
                            <input type="text" value="${data.logremocaodemembros}" class="gerenciarpainelstaff_inputlogremocaodemembros">
                            <h2 class="gerenciarpainelstaff_h2logadicaodemembros">Log Adição de Membros</h2>
                            <input type="text" value="${data.logadicaodemembros}" class="gerenciarpainelstaff_inputlogadicaodemembros">
                            `

                            $('.gerenciarpainelstaff').html(gerenciarStaffHTML)
                            $('.gerenciarpainelstaff').css('display', 'flex')

                            $('.box-botaomenu').removeAttr('selecionadobox')
                            $('.box-botaomenu:nth-of-type(5)').attr('selecionadobox', '')
                        })

                        $('.teladeloading').attr('desaparecer', '')
                        setTimeout(() => {
                            $('.teladeloading').removeAttr('desaparecer')
                            $('.teladeloading').css('display', 'none')
                        }, 800)
                    }, 1000)
                }
            }

            if (acoes === 'organizacao') {
                if ($('.gerenciarpainelstaff').css('display') === 'none') {
                    $('.teladeloading').css('display', 'flex')
                    setTimeout(() => {
                        $('.fundopainel').css('display', 'none')
                        $('.adicionarcargo').css('display', 'none')
                        $('.selecionarcriarouexistente').css('display', 'none')
                        $('.painelcriargrupo').css('display', 'none')
                        $('.estatisticasgrupo').css('display', 'none')
                        $('.gerenciargrupostaff').css('display', 'none')
                        $('.gerenciarstaff').css('display', 'none')
                        $('.adicionarmembro').css('display', 'none')
                        $('.gerenciarpainelstaff').css('display', 'none')
                        $('.gerenciarcidadao').css('display', 'none')

                        $.post(`http://${GetParentResourceName()}/orgpropiainfosgerenciarpainel`, JSON.stringify({}), (data) => {
                            let imagemperfil = ''
                            if (data.imagemperfil != undefined) {
                                imagemperfil = "./skdev/img/perfil.png"
                            } else {
                                imagemperfil = data.imagemperfil
                            }

                            var gerenciarStaffHTML = `
                            <div class="gerenciarpainelstaff_logobolinha">
                                <img src="./skdev/img/logo.png" draggable="false">
                            </div>
                
                            <div class="gerenciarpainelstaff_fotodeperfil" onclick="eventoclicarusuarioimagemperfil()"><img src="${imagemperfil}" draggable="false"></div>
                            <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputusuarioimagenenviar" onchange="perfilusuarioImagenEnviar(event)">
                            <div class="gerenciarpainelstaff_boxnome">
                                <img src="./skdev/img/nome.png" draggable="false">
                                <h2>${data.nomeplayer}</h2>
                            </div>
                            <div class="gerenciarpainelstaff_boxgrupo">
                                <img src="./skdev/img/grupo.png" draggable="false">
                                <h2>${data.orgplayer}</h2>
                            </div>
                            <div class="gerenciarpainelstaff_boxcargo">
                                <img src="./skdev/img/cargo.png" draggable="false">
                                <h2>${data.cargoplayer}</h2>
                            </div>

                            <button class="gerenciarpainelstaff_botaosalvaralteracoesdelog" onclick="salvarAlteracoesdeLogOrgPropia()">
                                <h2>Salvar Alterações de Log</h2>
                                <img src="./skdev/img/salvar.png" draggable="false">
                            </button>

                            <h2 class="gerenciarpainelstaff_h2loggeral">Log Edicao da Organizacao</h2>
                            <input type="text" value="${data.logedicaodaorganizacao}" class="gerenciarpainelstaff_inputloggeral">
                            <h2 class="gerenciarpainelstaff_h2criacaodeorg">Log Alteracao de Log</h2>
                            <input type="text" value="${data.logalteracaodelog}" class="gerenciarpainelstaff_inputcriacaodeorg">
                            <h2 class="gerenciarpainelstaff_h2membroremovidostaff">Log Membros Adicionados</h2>
                            <input type="text" value="${data.logmembrosadicionados}" class="gerenciarpainelstaff_inputmembroremovidostaff">
                            <h2 class="gerenciarpainelstaff_h2membrosupadosstaff">Log Membros Expulsos</h2>
                            <input type="text" value="${data.logmembrosexpulsos}" class="gerenciarpainelstaff_inputmembrosupadosstaff">
                            <h2 class="gerenciarpainelstaff_h2membrosrebaixadosstaff">Log Membros Upados</h2>
                            <input type="text" value="${data.logmembrosupados}" class="gerenciarpainelstaff_inputmembrosrebaixadosstaff">
                            <h2 class="gerenciarpainelstaff_h2membrosadicionadosstaff">Log Membros Rebaixados</h2>
                            <input type="text" value="${data.logmembrosrebaixados}" class="gerenciarpainelstaff_inputmembrosadicionadosstaff">
                            `

                            $('.gerenciarpainelstaff').html(gerenciarStaffHTML)
                            $('.gerenciarpainelstaff').css('display', 'flex')

                            $('.box-botaomenu').removeAttr('selecionadobox')
                            $('.box-botaomenu:nth-of-type(3)').attr('selecionadobox', '')
                        })

                        $('.teladeloading').attr('desaparecer', '')
                        setTimeout(() => {
                            $('.teladeloading').removeAttr('desaparecer')
                            $('.teladeloading').css('display', 'none')
                        }, 800)
                    }, 1000)
                }
            }
        }
    }
}

let grupoSelecionado = []
function SelecionarCriacaodegrupos() {
    var Selecionado = $('.selecionarcriarouexistentessssss option:selected').text()

    if (Selecionado === 'Criar Uma Nova Organização') {
        permissoesTotais = []
        arraySelecionados = []
        $('.selecionarcriarouexistente').attr('desaparecer', '')
        setTimeout(() => {
            $('.selecionarcriarouexistente').removeAttr('desaparecer')
            $('.selecionarcriarouexistente').css('display', 'none')

            var html = `
            <div class="painelcriargrupo">
            <div class="informacaogrupo">
                <div class="fotogrupo" onclick="mudarFotoCriacao()">
                    <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                </div>
                <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>

                <h2 class="grupoh2">Nome da Organização:</h2>
                <input type="text" class="textonomedaorg" onkeydown="$(this).css('border','none')">

                <h2 class="maximodemembroscriacao">Máximo de Membros:</h2>
                <input type="text" class="textomaximodemembros" onkeydown="return ( event.ctrlKey || event.altKey 
                    || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                    || (95<event.keyCode && event.keyCode<106)
                    || (event.keyCode==8) || (event.keyCode==9) 
                    || (event.keyCode>34 && event.keyCode<40) 
                    || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">

                <h2 class="logsgeraish2">Logs Gerais:</h2>
                <input type="text" class="textologsgerais" onkeydown="$(this).css('border','none')">

                <h2 class="blacklisth2">Blacklist:</h2>
                <div class="selectbox1" onclick="blacklist(1)"><img src="./skdev/img/cancelar.png" draggable="false"></div>
                <div class="selectbox2" onclick="blacklist(2)"><img src="./skdev/img/confirmar.png" draggable="false"></div>

                <h2 class="blacklisthorash2">Blacklist Horas:</h2>
                <input type="text" class="blacklisthorasinput" onkeydown="return ( event.ctrlKey || event.altKey 
                    || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                    || (95<event.keyCode && event.keyCode<106)
                    || (event.keyCode==8) || (event.keyCode==9) 
                    || (event.keyCode>34 && event.keyCode<40) 
                    || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">

                <button class="botaocriar" onclick="criarOrganizacao()">
                    <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                    <h2>Criar Organização</h2>
                </button>
                <button class="botaocancelar" onclick="cancelarCriacao()">
                    <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                    <h2>Cancelar Criação</h2>
                </button>
            </div>

            <div class="partedegrupos">
                <h2 class="partedecargosh2">Parte de Cargos</h2>
                <div class="barrapartedecargos"></div>

                <button class="botaoadicionarcargo" onclick="adicionarCargo()">
                    <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                    <h2>ADICIONAR CARGO</h2>
                </button>

                <div class="boxcargos">
                </div>
            </div>
        </div>
            `
            $('.painelcriargrupo').html(html)
            $('.boxcargos').html('')
            $('.painelcriargrupo').css('display', 'flex')
            $('.partedegrupos').css('display', 'flex')
            $('.informacaogrupo').css('display', 'flex')
        }, 800)
    } else if (Selecionado === 'Usar Organização Existente') {
        permissoesTotais = []
        arraySelecionados = []
        $('.selecionarcriarouexistente').attr('desaparecer', '')
        setTimeout(() => {
            $('.selecionarcriarouexistente').removeAttr('desaparecer')
            $('.selecionarcriarouexistente').css('display', 'none')

            $.post(`http://${GetParentResourceName()}/tabelaOrganizacoesCriar`, JSON.stringify({}), (data) => {
                let html = `
                    <div class="boxcriarouexistente">
                        <h2>
                        Clique no seletor de organizações abaixo<br>
                        e selecione qual organização você<br>
                        irá usar como modelo para criar outra
                        </h2>
    
                        <img src="./skdev/img/seta.png" class="setaselecionarcriarouexistentesssss" draggable="false">
                        <select class="selecionarcriarouexistentessssss" onchange="SelecionarGrupoExistente()">
                            <option>Selecionar a organização</option>
                        </select>
                    </div>
                `
                $('.selecionarcriarouexistente').html(html)


                grupoSelecionado = data.listaorganizacoes
                let tabelaOrganizacoesCriar = data.listaorganizacoes

                if (tabelaOrganizacoesCriar.length != undefined) {
                    tabelaOrganizacoesCriar.forEach((texto, index) => {
                        let append = `<option data-nomedaorganizacao="${texto.nomegrupo}" data-maximodemembros="${texto.maximodemembros}" data-blackliststatus="${texto.blackliststatus}" data-blacklisthoras="${texto.blacklisthoras}" data-cargos="${texto.cargosorganizacao}">${texto.nomegrupo}</option>`
                        $('.selecionarcriarouexistentessssss').append(append)
                    })
                }
            })

            setTimeout(() => {
                $('.selecionarcriarouexistente').css('display', 'flex')
            }, 100);
        }, 800)
    }
}

function SelecionarGrupoExistente() {
    var Selecionado = $('.selecionarcriarouexistentessssss option:selected').text()
    grupoSelecionado.forEach((texto, index) => {
        if (texto.nomegrupo === Selecionado) {
            if (Selecionado != undefined) {
                permissoesTotais = []
                arraySelecionados = []
                $('.selecionarcriarouexistente').attr('desaparecer', '')
                setTimeout(() => {
                    $('.selecionarcriarouexistente').removeAttr('desaparecer')
                    $('.selecionarcriarouexistente').css('display', 'none')

                    if (texto.blackliststatus) {
                        var html = `
                        <div class="painelcriargrupo">
                        <div class="informacaogrupo">
                            <div class="fotogrupo" onclick="mudarFotoCriacao()">
                                <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                            </div>
                            <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
            
                            <h2 class="grupoh2">Nome da Organização:</h2>
                            <input type="text" value="${texto.nomegrupo}" class="textonomedaorg" onkeydown="$(this).css('border','none')">
            
                            <h2 class="maximodemembroscriacao">Máximo de Membros:</h2>
                            <input type="text" value="${texto.maximodemembros}" class="textomaximodemembros" onkeydown="return ( event.ctrlKey || event.altKey 
                                || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                                || (95<event.keyCode && event.keyCode<106)
                                || (event.keyCode==8) || (event.keyCode==9) 
                                || (event.keyCode>34 && event.keyCode<40) 
                                || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
            
                            <h2 class="logsgeraish2">Logs Gerais:</h2>
                            <input type="text" class="textologsgerais" onkeydown="$(this).css('border','none')">
            
                            <h2 class="blacklisth2">Blacklist:</h2>
                            <div class="selectbox1" onclick="blacklist(1)"><img src="./skdev/img/cancelar.png" draggable="false"></div>
                            <div class="selectbox2" onclick="blacklist(2)" blacklistselecionada="true"><img src="./skdev/img/confirmar.png" draggable="false"></div>
            
                            <h2 class="blacklisthorash2">Blacklist Horas:</h2>
                            <input type="text" class="blacklisthorasinput" value="${texto.blacklisthoras}" onkeydown="return ( event.ctrlKey || event.altKey 
                                || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                                || (95<event.keyCode && event.keyCode<106)
                                || (event.keyCode==8) || (event.keyCode==9) 
                                || (event.keyCode>34 && event.keyCode<40) 
                                || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
            
                            <button class="botaocriar" onclick="criarOrganizacao()">
                                <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                                <h2>Criar Organização</h2>
                            </button>
                            <button class="botaocancelar" onclick="cancelarCriacao()">
                                <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                                <h2>Cancelar Criação</h2>
                            </button>
                        </div>
            
                        <div class="partedegrupos">
                            <h2 class="partedecargosh2">Parte de Cargos</h2>
                            <div class="barrapartedecargos"></div>
            
                            <button class="botaoadicionarcargo" onclick="adicionarCargo()">
                                <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                                <h2>ADICIONAR CARGO</h2>
                            </button>
            
                            <div class="boxcargos">
                            </div>
                        </div>
                    </div>
                        `
                    } else {
                        var html = `
                        <div class="painelcriargrupo">
                        <div class="informacaogrupo">
                            <div class="fotogrupo" onclick="mudarFotoCriacao()">
                                <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                            </div>
                            <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
            
                            <h2 class="grupoh2">Nome da Organização:</h2>
                            <input type="text" value="${texto.nomegrupo}" class="textonomedaorg" onkeydown="$(this).css('border','none')">
            
                            <h2 class="maximodemembroscriacao">Máximo de Membros:</h2>
                            <input type="text" value="${texto.maximodemembros}" class="textomaximodemembros" onkeydown="return ( event.ctrlKey || event.altKey 
                                || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                                || (95<event.keyCode && event.keyCode<106)
                                || (event.keyCode==8) || (event.keyCode==9) 
                                || (event.keyCode>34 && event.keyCode<40) 
                                || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
            
                            <h2 class="logsgeraish2">Logs Gerais:</h2>
                            <input type="text" class="textologsgerais" onkeydown="$(this).css('border','none')">
            
                            <h2 class="blacklisth2">Blacklist:</h2>
                            <div class="selectbox1" onclick="blacklist(1)" blacklistselecionada="true"><img src="./skdev/img/cancelar.png" draggable="false"></div>
                            <div class="selectbox2" onclick="blacklist(2)"><img src="./skdev/img/confirmar.png" draggable="false"></div>
            
                            <h2 class="blacklisthorash2">Blacklist Horas:</h2>
                            <input type="text" class="blacklisthorasinput" onkeydown="return ( event.ctrlKey || event.altKey 
                                || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                                || (95<event.keyCode && event.keyCode<106)
                                || (event.keyCode==8) || (event.keyCode==9) 
                                || (event.keyCode>34 && event.keyCode<40) 
                                || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
            
                            <button class="botaocriar" onclick="criarOrganizacao()">
                                <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                                <h2>Criar Organização</h2>
                            </button>
                            <button class="botaocancelar" onclick="cancelarCriacao()">
                                <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                                <h2>Cancelar Criação</h2>
                            </button>
                        </div>
            
                        <div class="partedegrupos">
                            <h2 class="partedecargosh2">Parte de Cargos</h2>
                            <div class="barrapartedecargos"></div>
            
                            <button class="botaoadicionarcargo" onclick="adicionarCargo()">
                                <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                                <h2>ADICIONAR CARGO</h2>
                            </button>
            
                            <div class="boxcargos">
                            </div>
                        </div>
                    </div>
                        `
                    }
                    $('.painelcriargrupo').html(html)

                    texto.cargosorganizacao.forEach((texto2, index2) => {
                        let nomedocargonopainel = Object.keys(texto2)[0]
                        let permissoes = texto2[nomedocargonopainel].permissoes[0]
                        let nomedocargoingame = texto2[nomedocargonopainel].cargoingame[0]
                        let arraySelecionados = texto2[nomedocargonopainel].permissoes[0]
                        let cargoinvisivelstatus = texto2[nomedocargonopainel].cargoinvisivelstatus

                        let appendCargo = `
                        <div class="cargodiv">
                            <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                            <h2 class="cargoh2" data-nomedocargonopainel="${nomedocargonopainel}" data-nomedocargoingame="${nomedocargoingame}" data-permissoesdocargo="${arraySelecionados}" data-cargoinvisivelstatus="${cargoinvisivelstatus}">${nomedocargonopainel}</h2>
            
                            <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                                <img src="./skdev/img/clonar.png" draggable="false">
                                <h2>Clonar Cargo</h2>
                            </button>
                            <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                                <img src="./skdev/img/editar.png" draggable="false">
                                <h2>Editar Cargo</h2>
                            </button>
                            <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                                <img src="./skdev/img/excluir.png" draggable="false">
                                <h2>Excluir Cargo</h2>
                            </button>
                        </div>
                        `
                        $('.boxcargos').append(appendCargo)
                        let arrayEntrada = { [nomedocargonopainel]: { cargoingame: [texto2.nomedocargoingame], permissoes: [permissoes], cargoinvisivelstatus: texto2.cargoinvisivelstatus } }
                        permissoesTotais.push(arrayEntrada)
                        arrayEntrada = []
                    })
                    $('.painelcriargrupo').css('display', 'flex')
                    $('.partedegrupos').css('display', 'flex')
                    $('.informacaogrupo').css('display', 'flex')
                }, 800)
            }
        }
    })


}

let arraySelecionados = []
function selecionarPermissaodoCargo() {
    var Selecionado = $('.selecionarpermissoesdocargo option:selected').text()

    if (Selecionado != 'Selecione As Permissões') {
        if (!arraySelecionados.includes(Selecionado)) {
            var html = `
            <div class="divpermissao">
                <h2>${Selecionado}</h2>
                <img src="./skdev/img/apagar.png" draggable="false" onclick="remover(this)">
            </div>
            `
            $('.espacopermissoes').append(html)
            arraySelecionados.push(Selecionado)
        }
    }
}

function remover(e) {
    var textoRemovido = $(e.parentNode).text()
    var textoRemovidoString = $.trim(textoRemovido)
    arraySelecionados.forEach((texto, index) => {
        if (texto === textoRemovidoString) {
            const index = arraySelecionados.indexOf(textoRemovidoString)
            const x = arraySelecionados.splice(index, 1)
        }
    })
    var root = e.parentNode
    root.parentNode.removeChild(root)
}

function voltarAdicionarCargo() {
    $('.teladeloading').css('display', 'flex')
    setTimeout(() => {
        $('.adicionarcargo').css('display', 'none')

        $('.teladeloading').attr('desaparecer', '')
        setTimeout(() => {
            $('.teladeloading').removeAttr('desaparecer')
            $('.teladeloading').css('display', 'none')
        }, 800)
    }, 1000)
}

function adicionarCargo() {
    if ($('.adicionarcargo').css('display') === 'none') {
        $('.teladeloading').css('display', 'flex')
        setTimeout(() => {
            arraySelecionados = []
            let htmladicionarcargo = `
            <img src="./skdev/img/voltar.png" class="setavoltar-adicionarcargo" draggable="false" onclick="voltarAdicionarCargo()">
            <div class="logobolinha-adicionarcargo"><img src="./skdev/img/logo.png" draggable="false"></div>

            <img src="./skdev/img/organizacao.png" class="orgcargoimg" draggable="false">
            <h2 class="criarcargoadicionarh2">Criar Cargo</h2>

            <h2 class="nomedocargopainelh2">Nome do Cargo no Painel</h2>
            <input type="text" class="inputnomedocargo">

            <h2 class="nomedocargoingameh2">Nome do cargo ingame</h2>
            <input type="text" class="inputnomedocargoingame">

            <h2 class="cargoinvisivelingameh2">Cargo Invisivel</h2>
            <div class="confirmarcargoinvisivel" onclick="confirmarBotaoCargoInvisivel()"></div>

            <h2 class="permissoesdocargo">Permissões do Cargo</h2>
            <img src="./skdev/img/seta.png" class="selecionarpermissoesdocargoimg" draggable="false">
            <select class="selecionarpermissoesdocargo" onchange="selecionarPermissaodoCargo()">
                <option>Selecione As Permissões</option>
                <option>Membros Protegidos</option>
                <option>Gerenciar Grupo</option>
                <option>Alterar Logs</option>
                <option>Adicionar Membros</option>
                <option>Upar Membros</option>
                <option>Rebaixar Membros</option>
                <option>Remover Membros</option>
            </select>

            <div class="espacopermissoes">
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
            </div>
            <button class="botaoconfirmarcriargrupo" onclick="confirmarCriacaoCargo()">
                Confirmar
                <img src="./skdev/img/confirmar.png" draggable="false">
            </button>
            `
            $('.adicionarcargo').html(htmladicionarcargo)
            $('.adicionarcargo').css('display', 'flex')
            $('.espacopermissoes').html('')

            $('.teladeloading').attr('desaparecer', '')
            setTimeout(() => {
                $('.teladeloading').removeAttr('desaparecer')
                $('.teladeloading').css('display', 'none')
            }, 800)
        }, 1000)
    }
}

let permissoesTotais = []
function confirmarCriacaoCargo(status) {
    if (status) {
        let nomedocargoantigo = $('.inputnomedocargo').attr('nomeantigo')
        let nomedocargonopainel = $('.inputnomedocargo').val()
        let nomedocargoingame = $('.inputnomedocargoingame').val()

        if (nomedocargonopainel.length === 0) {
            $('.inputnomedocargo').css('border', '.1vw solid red')
        }

        if (nomedocargoingame.length === 0) {
            $('.inputnomedocargoingame').css('border', '.1vw solid red')
        }


        if (nomedocargonopainel.length < 1 && nomedocargoingame.length < 1) {
            return false
        }

        let cargoinvisivelstatus = false
        if ($('.confirmarcargoinvisivel').attr('cargoinvisiveltrue') != undefined) {
            cargoinvisivelstatus = true
        } else {
            cargoinvisivelstatus = false
        }

        
        $('.teladeloading').css('display', 'flex')
        setTimeout(() => {
            $('.adicionarcargo').css('display', 'none')
            let htmleditar = `
            <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
            <h2 class="cargoh2" data-nomedocargonopainel="${nomedocargonopainel}" data-nomedocargoingame="${nomedocargoingame}" data-permissoesdocargo="${arraySelecionados}" data-cargoinvisivelstatus="${cargoinvisivelstatus}">${nomedocargonopainel}</h2>

            <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                <img src="./skdev/img/clonar.png" draggable="false">
                <h2>Clonar Cargo</h2>
            </button>
            <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                <img src="./skdev/img/editar.png" draggable="false">
                <h2>Editar Cargo</h2>
            </button>
            <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                <img src="./skdev/img/excluir.png" draggable="false">
                <h2>Excluir Cargo</h2>
            </button>
            `
            divatual.html(htmleditar)

            let arrayEntrada = { [nomedocargonopainel]: { cargoingame: [nomedocargoingame], permissoes: [arraySelecionados], cargoinvisivelstatus: cargoinvisivelstatus } }
            permissoesTotais[divAtualIndex] = arrayEntrada
            arrayEntrada = []
            arraySelecionados = []

            $('.teladeloading').attr('desaparecer', '')
            setTimeout(() => {
                $('.teladeloading').removeAttr('desaparecer')
                $('.teladeloading').css('display', 'none')
            }, 800)
        }, 1000)
    } else {
        let nomedocargonopainel = $('.inputnomedocargo').val()
        let nomedocargoingame = $('.inputnomedocargoingame').val()

        if (nomedocargonopainel.length === 0) {
            $('.inputnomedocargo').css('border', '.1vw solid red')
        }

        if (nomedocargoingame.length === 0) {
            $('.inputnomedocargoingame').css('border', '.1vw solid red')
        }

        if (nomedocargonopainel.length < 1 || nomedocargoingame.length < 1) {
            return false
        }

        let cargoinvisivelstatus = false
        if ($('.confirmarcargoinvisivel').attr('cargoinvisiveltrue') != undefined) {
            cargoinvisivelstatus = true
        } else {
            cargoinvisivelstatus = false
        }

        $('.teladeloading').css('display', 'flex')
        setTimeout(() => {
            $('.adicionarcargo').css('display', 'none')
            let appendHtml = `
            <div class="cargodiv">
                <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                <h2 class="cargoh2" data-nomedocargonopainel="${nomedocargonopainel}" data-nomedocargoingame="${nomedocargoingame}" data-permissoesdocargo="${arraySelecionados}" data-cargoinvisivelstatus="${cargoinvisivelstatus}">${nomedocargonopainel}</h2>
    
                <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                    <img src="./skdev/img/clonar.png" draggable="false">
                    <h2>Clonar Cargo</h2>
                </button>
                <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                    <img src="./skdev/img/editar.png" draggable="false">
                    <h2>Editar Cargo</h2>
                </button>
                <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                    <img src="./skdev/img/excluir.png" draggable="false">
                    <h2>Excluir Cargo</h2>
                </button>
            </div>
            `
            $('.boxcargos').append(appendHtml)
            let arrayEntrada = { [nomedocargonopainel]: { cargoingame: [nomedocargoingame], permissoes: [arraySelecionados], cargoinvisivelstatus: cargoinvisivelstatus } }
            permissoesTotais.push(arrayEntrada)
            arraySelecionados = []
            arrayEntrada = []

            $('.teladeloading').attr('desaparecer', '')
            setTimeout(() => {
                $('.teladeloading').removeAttr('desaparecer')
                $('.teladeloading').css('display', 'none')
            }, 800)
        }, 1000)
    }
}

function criarOrganizacao() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Criar Organizações' }), (data) => {
        let status = data.status

        if (status) {
            let inputTextoNomeOrg = $('.textonomedaorg').val()
            let inputMaximodeMembros = $('.textomaximodemembros').val()
            let inputLogsGerais = $('.textologsgerais').val()

            let inputBlacklist1 = $('.selectbox1').attr('blacklistselecionada')
            let inputBlacklist2 = $('.selectbox2').attr('blacklistselecionada')
            let inputBlacklistHoras = $('.blacklisthorasinput').val()

            let blacklistvalue = false
            if (typeof inputBlacklist1 !== 'undefined' && inputBlacklist1 !== false) {
                blacklistvalue = false
            }
            if (typeof inputBlacklist2 !== 'undefined' && inputBlacklist2 !== false) {
                blacklistvalue = true
            }

            if (inputTextoNomeOrg.length < 1) {
                $('.textonomedaorg').css('border', '.1vw solid #5500ff')
            }
            if (inputMaximodeMembros.length < 1) {
                $('.textomaximodemembros').css('border', '.1vw solid #5500ff')
            }

            if (blacklistvalue && inputBlacklistHoras.length < 1) {
                $('.blacklisthorasinput').css('border', '.1vw solid #5500ff')
            }

            let imagemdaOrgSrc = $('.imgfoto').attr('src')

            if (inputTextoNomeOrg.length > 0 && inputMaximodeMembros.length > 0) {
                if (blacklistvalue === true && inputBlacklistHoras.length < 1) { return false }
                $.post(`http://${GetParentResourceName()}/criarOrganizacaoInfos`, JSON.stringify({ nomedaorganizacao: inputTextoNomeOrg, imagemdaorganizacao: imagemdaOrgSrc, maximodemembrosorganizacao: inputMaximodeMembros, logsgeraisorganizacao: inputLogsGerais, blackliststatus: blacklistvalue, blacklisthoras: inputBlacklistHoras, permissoes: permissoesTotais }))
                AlterarMenu('Inicio')
                permissoesTotais = []
                arraySelecionados = []
            }
        }
    })
}

function cancelarCriacao() {
    permissoesTotais = []
    arraySelecionados = []
    AlterarMenu('Inicio')
}

function mudarFotoCriacao() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Staff' }), (data) => {
        let status = data.status

        if (status) {
            $('.inputfotogrupo').trigger('click')
        }
    })
}

function imagenEnviar(event) {
    event.preventDefault()

    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Staff' }), (data) => {
        let status = data.status

        if (status) {
            $.post(`http://${GetParentResourceName()}/obterWebhookImagemStaff`, JSON.stringify({}), (data) => {
                let webhookurl = data.webhook

                if (webhookurl) {
                    const imageFile = event.target.files[0]

                    const formData = new FormData()
                    formData.append("file", imageFile)

                    fetch(webhookurl, {
                        method: "POST",
                        body: formData,
                    })
                        .then(response => response.json())
                        .then(data => {
                            const imageUrl = data.attachments[0].url
                            $('.imgfoto').attr('src', imageUrl)
                        })
                        .catch(error => {
                        })
                }
            })
        }
    })
}

function blacklist(numero) {
    if (numero === 1) {
        $('.selectbox1').attr('blacklistselecionada', 'true')
        $('.selectbox2').removeAttr('blacklistselecionada')
    } else if (numero === 2) {
        $('.selectbox2').attr('blacklistselecionada', 'true')
        $('.selectbox1').removeAttr('blacklistselecionada')
    }
}

function CargoAcaodeClonar(div) {
    arrayEntrada = []
    var divAppend = $(div.parentNode)[0].outerHTML

    let nomedocargonopainel = $(div.parentNode.querySelector("h2")).attr('data-nomedocargonopainel')
    let nomedocargoingame = $(div.parentNode.querySelector("h2")).attr('data-nomedocargoingame')
    let permissoedocargo = $(div.parentNode.querySelector("h2")).attr('data-permissoesdocargo')


    $('.teladeloading').css('display', 'flex')
    setTimeout(() => {
        $('.boxcargos').append(divAppend)
        let arrayEntrada = { [nomedocargonopainel]: { cargoingame: [nomedocargoingame], permissoes: [permissoedocargo] } }
        permissoesTotais.push(arrayEntrada)
        arrayEntrada = []

        $('.teladeloading').attr('desaparecer', '')
        setTimeout(() => {
            $('.teladeloading').removeAttr('desaparecer')
            $('.teladeloading').css('display', 'none')
        }, 800)
    }, 2000)
}

let divatual = ''
let divAtualIndex = ''
function CargoacaodeEditar(div, staff) {
    let nomedocargonopainel = $(div.parentNode.querySelector("h2")).attr('data-nomedocargonopainel')
    let nomedocargoingame = $(div.parentNode.querySelector("h2")).attr('data-nomedocargoingame')
    let permissoedocargo = $(div.parentNode.querySelector("h2")).attr('data-permissoesdocargo')
    let cargoinvisivelstatus = $(div.parentNode.querySelector("h2")).attr('data-cargoinvisivelstatus')
    divatual = $(div.parentNode)
    let divP = $(div).closest('.cargodiv')
    divAtualIndex = divP.index()

    if ($('.adicionarcargo').css('display') === 'none') {
        $('.teladeloading').css('display', 'flex')
        arraySelecionados = []
        setTimeout(() => {
            if (staff) {
                let htmladicionarcargo = `
                <img src="./skdev/img/voltar.png" class="setavoltar-adicionarcargo" draggable="false" onclick="voltarAdicionarCargo()">
                <div class="logobolinha-adicionarcargo"><img src="./skdev/img/logo.png" draggable="false"></div>
    
                <img src="./skdev/img/organizacao.png" class="orgcargoimg" draggable="false">
                <h2 class="criarcargoadicionarh2">Editar Cargo</h2>
    
                <h2 class="nomedocargopainelh2">Nome do Cargo no Painel</h2>
                <input type="text" value="${nomedocargonopainel}" nomeantigo="${nomedocargonopainel}" class="inputnomedocargo">
    
                <h2 class="nomedocargoingameh2">Nome do cargo ingame</h2>
                <input type="text" value="${nomedocargoingame}" class="inputnomedocargoingame">

                <h2 class="cargoinvisivelingameh2">Cargo Invisivel</h2>
                <div class="confirmarcargoinvisivel" onclick="confirmarBotaoCargoInvisivel()"></div>
    
                <h2 class="permissoesdocargo">Permissões do Cargo</h2>
                <img src="./skdev/img/seta.png" class="selecionarpermissoesdocargoimg" draggable="false">
                <select class="selecionarpermissoesdocargo" onchange="selecionarPermissaodoCargo()">
                    <option>Selecione As Permissões</option>
                    <option>Membros Protegidos</option>
                    <option>Criar Organizações</option>
                    <option>Gerenciar Organizações</option>
                    <option>Gerenciar Staff</option>
                    <option>Alterar Logs</option>
                    <option>Adicionar Membros</option>
                    <option>Upar Membros</option>
                    <option>Rebaixar Membros</option>
                    <option>Remover Membros</option>
                    <option>Gerenciar Cidadoes</option>
                </select>
    
                <div class="espacopermissoes">
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                </div>
                <button class="botaoconfirmarcriargrupo" onclick="confirmarCriacaoCargo(true)">
                    Confirmar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
                `


                $('.adicionarcargo').html(htmladicionarcargo)
            } else {
                let htmladicionarcargo = `
                <img src="./skdev/img/voltar.png" class="setavoltar-adicionarcargo" draggable="false" onclick="voltarAdicionarCargo()">
                <div class="logobolinha-adicionarcargo"><img src="./skdev/img/logo.png" draggable="false"></div>
    
                <img src="./skdev/img/organizacao.png" class="orgcargoimg" draggable="false">
                <h2 class="criarcargoadicionarh2">Editar Cargo</h2>
    
                <h2 class="nomedocargopainelh2">Nome do Cargo no Painel</h2>
                <input type="text" value="${nomedocargonopainel}" nomeantigo="${nomedocargonopainel}" class="inputnomedocargo">
    
                <h2 class="nomedocargoingameh2">Nome do cargo ingame</h2>
                <input type="text" value="${nomedocargoingame}" class="inputnomedocargoingame">

                <h2 class="cargoinvisivelingameh2">Cargo Invisivel</h2>
                <div class="confirmarcargoinvisivel" onclick="confirmarBotaoCargoInvisivel()"></div>
    
                <h2 class="permissoesdocargo">Permissões do Cargo</h2>
                <img src="./skdev/img/seta.png" class="selecionarpermissoesdocargoimg" draggable="false">
                <select class="selecionarpermissoesdocargo" onchange="selecionarPermissaodoCargo()">
                    <option>Selecione As Permissões</option>
                    <option>Membros Protegidos</option>
                    <option>Gerenciar Grupo</option>
                    <option>Alterar Logs</option>
                    <option>Adicionar Membros</option>
                    <option>Upar Membros</option>
                    <option>Rebaixar Membros</option>
                    <option>Remover Membros</option>
                </select>
    
                <div class="espacopermissoes">
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="divpermissao">
                        <h2>Mudar nome da organização</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                </div>
                <button class="botaoconfirmarcriargrupo" onclick="confirmarCriacaoCargo(true)">
                    Confirmar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
                `


                $('.adicionarcargo').html(htmladicionarcargo)
            }


            if (cargoinvisivelstatus === 'true') {
                $('.confirmarcargoinvisivel').attr('cargoinvisiveltrue','')
            } else {
                $('.confirmarcargoinvisivel').removeAttr('cargoinvisiveltrue')
            }


            $('.espacopermissoes').html('')
            if (permissoedocargo.length > 0) {
                permissoedocargo.split(',').forEach((texto, index) => {
                    let divpermissaoappend = `
                        <div class="divpermissao">
                            <h2>${texto}</h2>
                            <img src="./skdev/img/apagar.png" draggable="false" onclick="remover(this)">
                        </div>
                    `

                    $('.espacopermissoes').append(divpermissaoappend)

                    arraySelecionados.push(texto)
                })
            }
            $('.adicionarcargo').css('display', 'flex')

            $('.teladeloading').attr('desaparecer', '')
            setTimeout(() => {
                $('.teladeloading').removeAttr('desaparecer')
                $('.teladeloading').css('display', 'none')
            }, 800)
        }, 1000)
    }
}

function CargoacaodeExcluir(div) {
    let divP = $(div).closest('.cargodiv')
    DivExcluirIndex = divP.index()

    const x = permissoesTotais.splice(DivExcluirIndex, 1)

    var root = div.parentNode
    root.parentNode.removeChild(root)
}

function pesquisar(div) {
    const input = document.querySelector('.estatisticas_pesquisarmembro')
    const membros = document.querySelectorAll('.estatisticas_membro')

    input.addEventListener('input', () => {
        const valor = input.value.toLowerCase()

        membros.forEach(membro => {
            const id = membro.querySelector('.estatisticas_membro_id').textContent.toLowerCase()
            const nome = membro.querySelector('.estatisticas_membro_nome').textContent.toLowerCase()
            const cargo = membro.querySelector('.estatisticas_membro_cargo').textContent.toLowerCase()

            if (id.includes(valor) || nome.includes(valor) || cargo.includes(valor)) {
                membro.style.display = 'flex'
            } else {
                membro.style.display = 'none'
            }
        })
    })
}

function visualizarEstatisticas(nomeOrg) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Organizações' }), (data) => {
        let status = data.status

        if (status) {
            if ($('.estatisticasgrupo').css('display') === 'none') {
                $('.teladeloading').css('display', 'flex')
                setTimeout(() => {


                    $.post(`http://${GetParentResourceName()}/staffvisualizarEstatisticasOrganizacao`, JSON.stringify({ organizacao: nomeOrg }), (data) => {
                        let imagemorg = undefined
                        if (data.imagemOrg != undefined) {
                            imagemorg = data.imagemOrg
                        } else {
                            imagemorg = './skdev/img/perfil.png'
                        }

                        let html = `
                            <img src="./skdev/img/setavoltar.png" class="setavoltar_estatisticas" draggable="false" onclick="voltarEstatistica()">
            
                            <div class="estatisticas_logobolinha">
                                <img src="${imagemorg}" draggable="false">
                            </div>
            
                            <h2 class="estatisticas_nomeorgh2">Nome da Organização</h2>
                            <div class="estatisticas_nomeorgdiv">
                                <h2>${nomeOrg}</h2>
                            </div>
            
                            <div class="estatisticas_boxtotaldemembros">
                                <img src="./skdev/img/membrostotal.png" draggable="false">
                                <h2>Total de Membros</h2>
                                <h3>${data.totaldemembros}</h3>
                            </div>
                            <div class="estatisticas_boxmembrosonline">
                                <img src="./skdev/img/online.png" draggable="false">
                                <h2>Membros Online</h2>
                                <h3>${data.membrosonline}</h3>
                            </div>
                            <div class="estatisticas_boxmembrosoffline">
                                <img src="./skdev/img/offline.png" draggable="false">
                                <h2>Membros Offline</h2>
                                <h3>${data.membrosoffline}</h3>
                            </div>
            
                            <h2 class="estatisticas_cargosh2">Cargos</h2>
                            <div class="estatisticas_separarh2"></div>
            
                            <div class="estatisticas_boxcargos">
                            </div>
            
                            <h2 class="estatisticas_partedosmembroh2">Parte dos Membros</h2>
                            <div class="estatisticas_separadorpartedosmembro"></div>
            
                            <img src="./skdev/img/pesquisar.png" class="estatisticas_pesquisarmembroimg" draggable="false">
                            <input type="text" class="estatisticas_pesquisarmembro" oninput="pesquisar(this)"></input>
            
                            <button class="estatisticas_botaodeaaz" onclick="filtrodeaazestatisticasacao()">
                                <img src="./skdev/img/aaz.png" draggable="false">
                            </button>
                            
                            <div class="estatisticas_membrosbox">
                            </div>
                        `
                        $('.estatisticasgrupo').html(html)

                        let cargos = data.cargos
                        cargos.forEach((texto, index) => {
                            let nomedocargo = Object.keys(texto)[0]
                            let boxcargo_estatisticas = `
                                <div class="estatisticas_cargo">
                                    <h2>${nomedocargo}</h2>
                                    <img src="./skdev/img/cargo.png" draggable="false">
                                </div>
                            `
                            $('.estatisticas_boxcargos').append(boxcargo_estatisticas)
                        })

                        let membros = data.membros
                        if (membros != undefined) {
                            membros.forEach((texto, index) => {
                                let boxmembro_estatisticas = `
                                    <div class="estatisticas_membro">
                                        <img src="./skdev/img/membro.png" draggable="false">
                                        <h2 class="estatisticas_membro_id">${texto.iddomembro}</h2>
                                        <h2 class="estatisticas_membro_nome">${texto.nomedomembro}</h2>
                                        <h2 class="estatisticas_membro_cargo">${texto.cargodomembro}</h2>
                                    </div>
                                `
                                $('.estatisticas_membrosbox').append(boxmembro_estatisticas)
                            })
                        }


                        $('.estatisticasgrupo').css('display', 'flex')
                    })

                    $('.teladeloading').attr('desaparecer', '')
                    setTimeout(() => {
                        $('.teladeloading').removeAttr('desaparecer')
                        $('.teladeloading').css('display', 'none')
                    }, 800)
                }, 1000)
            }
        }
    })
}

function voltarEstatistica() {
    $('.teladeloading').css('display', 'flex')
    setTimeout(() => {
        $('.estatisticasgrupo').css('display', 'none')

        $('.teladeloading').attr('desaparecer', '')
        setTimeout(() => {
            $('.teladeloading').removeAttr('desaparecer')
            $('.teladeloading').css('display', 'none')
        }, 800)
    }, 1000)
}

let organizado = false
function filtrodeaazestatisticasacao() {
    const membros = Array.from(document.querySelectorAll('.estatisticas_membro'))

    membros.sort((a, b) => {
        const nomeA = a.querySelector('.estatisticas_membro_nome').textContent.toUpperCase()
        const nomeB = b.querySelector('.estatisticas_membro_nome').textContent.toUpperCase()

        if (organizado) {
            if (nomeA < nomeB) {
                return -1
            }

            if (nomeA > nomeB) {
                return 1
            }
        } else {
            if (nomeA < nomeB) {
                return 1
            }

            if (nomeA > nomeB) {
                return -1
            }
        }

        return 0
    })

    const membrosBox = document.querySelector('.estatisticas_membrosbox')
    membrosBox.innerHTML = ''

    membros.forEach(membro => {
        membrosBox.appendChild(membro)
    })


    organizado = !organizado
    if (organizado) {
        $('.estatisticas_botaodeaaz').attr('botaodeaazativo','')
    } else {
        $('.estatisticas_botaodeaaz').removeAttr('botaodeaazativo')
    }
}

function editarOrganizacaoGrupo(nomedaOrg) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Organizações' }), (data) => {
        let status = data.status

        if (status) {
            permissoesTotais = []
            arraySelecionados = []
            $.post(`http://${GetParentResourceName()}/staffEditarOrganizacaoGrupo`, JSON.stringify({ nomedaorganizacao: nomedaOrg }), (data) => {
                let grupoSelecionado = data.organizacao

                $('.teladeloading').css('display', 'flex')
                setTimeout(() => {
                    $('.gerenciargrupostaff').removeAttr('desaparecer')
                    $('.gerenciargrupostaff').css('display', 'none')

                    if (grupoSelecionado.blackliststatus) {
                        var html = `
                        <div class="painelcriargrupo">
                        <div class="informacaogrupo">
                            <div class="fotogrupo" onclick="mudarFotoCriacao()">
                                <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                            </div>
                            <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
            
                            <h2 class="grupoh2">Nome da Organização:</h2>
                            <input type="text" value="${grupoSelecionado.nomegrupo}" class="textonomedaorg" onkeydown="$(this).css('border','none')">
            
                            <h2 class="maximodemembroscriacao">Máximo de Membros:</h2>
                            <input type="text" value="${grupoSelecionado.maximodemembros}" class="textomaximodemembros" onkeydown="return ( event.ctrlKey || event.altKey 
                                || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                                || (95<event.keyCode && event.keyCode<106)
                                || (event.keyCode==8) || (event.keyCode==9) 
                                || (event.keyCode>34 && event.keyCode<40) 
                                || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
            
                            <h2 class="logsgeraish2">Logs Gerais:</h2>
                            <input type="text" class="textologsgerais" value="${grupoSelecionado.logsgerais}" onkeydown="$(this).css('border','none')">
            
                            <h2 class="blacklisth2">Blacklist:</h2>
                            <div class="selectbox1" onclick="blacklist(1)"><img src="./skdev/img/cancelar.png" draggable="false"></div>
                            <div class="selectbox2" onclick="blacklist(2)" blacklistselecionada="true"><img src="./skdev/img/confirmar.png" draggable="false"></div>
            
                            <h2 class="blacklisthorash2">Blacklist Horas:</h2>
                            <input type="text" class="blacklisthorasinput" value="${grupoSelecionado.blacklisthoras}" onkeydown="return ( event.ctrlKey || event.altKey 
                                || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                                || (95<event.keyCode && event.keyCode<106)
                                || (event.keyCode==8) || (event.keyCode==9) 
                                || (event.keyCode>34 && event.keyCode<40) 
                                || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
            
                            <button class="botaocriar" onclick="editarOrganizacao()">
                                <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                                <h2>Concluir Edição</h2>
                            </button>
                            <button class="botaocancelar" onclick="cancelarCriacao()">
                                <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                                <h2>Cancelar Edição</h2>
                            </button>
                        </div>
            
                        <div class="partedegrupos">
                            <h2 class="partedecargosh2">Parte de Cargos</h2>
                            <div class="barrapartedecargos"></div>
            
                            <button class="botaoadicionarcargo" onclick="adicionarCargo()">
                                <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                                <h2>ADICIONAR CARGO</h2>
                            </button>
            
                            <div class="boxcargos">
                            </div>
                        </div>
                    </div>
                        `
                    } else {
                        var html = `
                        <div class="painelcriargrupo">
                        <div class="informacaogrupo">
                            <div class="fotogrupo" onclick="mudarFotoCriacao()">
                                <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                            </div>
                            <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
            
                            <h2 class="grupoh2">Nome da Organização:</h2>
                            <input type="text" value="${grupoSelecionado.nomegrupo}" class="textonomedaorg" onkeydown="$(this).css('border','none')">
            
                            <h2 class="maximodemembroscriacao">Máximo de Membros:</h2>
                            <input type="text" value="${grupoSelecionado.maximodemembros}" class="textomaximodemembros" onkeydown="return ( event.ctrlKey || event.altKey 
                                || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                                || (95<event.keyCode && event.keyCode<106)
                                || (event.keyCode==8) || (event.keyCode==9) 
                                || (event.keyCode>34 && event.keyCode<40) 
                                || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
            
                            <h2 class="logsgeraish2">Logs Gerais:</h2>
                            <input type="text" class="textologsgerais" value="${grupoSelecionado.logsgerais}" onkeydown="$(this).css('border','none')">
            
                            <h2 class="blacklisth2">Blacklist:</h2>
                            <div class="selectbox1" onclick="blacklist(1)" blacklistselecionada="true"><img src="./skdev/img/cancelar.png" draggable="false"></div>
                            <div class="selectbox2" onclick="blacklist(2)"><img src="./skdev/img/confirmar.png" draggable="false"></div>
            
                            <h2 class="blacklisthorash2">Blacklist Horas:</h2>
                            <input type="text" class="blacklisthorasinput" onkeydown="return ( event.ctrlKey || event.altKey 
                                || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                                || (95<event.keyCode && event.keyCode<106)
                                || (event.keyCode==8) || (event.keyCode==9) 
                                || (event.keyCode>34 && event.keyCode<40) 
                                || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
            
                            <button class="botaocriar" onclick="editarOrganizacao()">
                                <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                                <h2>Concluir Edição</h2>
                            </button>
                            <button class="botaocancelar" onclick="cancelarCriacao()">
                                <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                                <h2>Cancelar Edição</h2>
                            </button>
                        </div>
            
                        <div class="partedegrupos">
                            <h2 class="partedecargosh2">Parte de Cargos</h2>
                            <div class="barrapartedecargos"></div>
            
                            <button class="botaoadicionarcargo" onclick="adicionarCargo()">
                                <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                                <h2>ADICIONAR CARGO</h2>
                            </button>
            
                            <div class="boxcargos">
                            </div>
                        </div>
                    </div>
                        `
                    }
                    $('.painelcriargrupo').html(html)

                    grupoSelecionado.cargosorganizacao.forEach((texto, index) => {
                        let nomedocargonopainel = Object.keys(texto)[0]
                        let cargoInf = texto[nomedocargonopainel]
                        let permissoescargo = cargoInf.permissoes[0]

                        let appendCargo = `
                        <div class="cargodiv">
                            <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                            <h2 class="cargoh2" data-nomedocargonopainel="${nomedocargonopainel}" data-nomedocargoingame="${cargoInf.cargoingame}" data-permissoesdocargo="${permissoescargo}" data-cargoinvisivelstatus="${cargoInf.cargoinvisivelstatus}">${nomedocargonopainel}</h2>
            
                            <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                                <img src="./skdev/img/clonar.png" draggable="false">
                                <h2>Clonar Cargo</h2>
                            </button>
                            <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                                <img src="./skdev/img/editar.png" draggable="false">
                                <h2>Editar Cargo</h2>
                            </button>
                            <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                                <img src="./skdev/img/excluir.png" draggable="false">
                                <h2>Excluir Cargo</h2>
                            </button>
                        </div>
                        `
                        $('.boxcargos').append(appendCargo)
                        let arrayEntrada = { [nomedocargonopainel]: { cargoingame: cargoInf.cargoingame, permissoes: [permissoescargo], cargoinvisivelstatus: cargoInf.cargoinvisivelstatus } }
                        permissoesTotais.push(arrayEntrada)
                        arrayEntrada = []
                    })
                    $('.painelcriargrupo').css('display', 'flex')
                    $('.partedegrupos').css('display', 'flex')
                    $('.informacaogrupo').css('display', 'flex')

                    $('.teladeloading').attr('desaparecer', '')
                    setTimeout(() => {
                        $('.teladeloading').removeAttr('desaparecer')
                        $('.teladeloading').css('display', 'none')
                    }, 800)
                }, 1000)
            })
        }
    })
}

function editarOrganizacao() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Criar Organizações' }), (data) => {
        let status = data.status

        if (status) {
            let inputTextoNomeOrg = $('.textonomedaorg').val()
            let inputNomeAntigoOrg = $('.textonomedaorg').attr('value')
            let inputMaximodeMembros = $('.textomaximodemembros').val()
            let inputLogsGerais = $('.textologsgerais').val()

            let inputBlacklist1 = $('.selectbox1').attr('blacklistselecionada')
            let inputBlacklist2 = $('.selectbox2').attr('blacklistselecionada')
            let inputBlacklistHoras = $('.blacklisthorasinput').val()

            let blacklistvalue = false
            if (typeof inputBlacklist1 !== 'undefined' && inputBlacklist1 !== false) {
                blacklistvalue = false
            }
            if (typeof inputBlacklist2 !== 'undefined' && inputBlacklist2 !== false) {
                blacklistvalue = true
            }

            if (inputTextoNomeOrg.length < 1) {
                $('.textonomedaorg').css('border', '.1vw solid #5500ff')
            }
            if (inputMaximodeMembros.length < 1) {
                $('.textomaximodemembros').css('border', '.1vw solid #5500ff')
            }

            if (blacklistvalue && inputBlacklistHoras.length < 1) {
                $('.blacklisthorasinput').css('border', '.1vw solid #5500ff')
            }

            let imagemdaOrgSrc = $('.imgfoto').attr('src')

            if (inputTextoNomeOrg.length > 0 && inputMaximodeMembros.length > 0) {
                if (blacklistvalue === true && inputBlacklistHoras.length < 1) { return false }
                $.post(`http://${GetParentResourceName()}/concluidoEdicaoOrganizacaoInfos`, JSON.stringify({ nomeantigo: inputNomeAntigoOrg, nomedaorganizacao: inputTextoNomeOrg, imagemdaorganizacao: imagemdaOrgSrc, maximodemembrosorganizacao: inputMaximodeMembros, logsgeraisorganizacao: inputLogsGerais, blackliststatus: blacklistvalue, blacklisthoras: inputBlacklistHoras, permissoes: permissoesTotais }))
                AlterarMenu('Inicio')
                permissoesTotais = []
                arraySelecionados = []
            }
        }
    })
}

function deletarOrganizacaoGrupo(nomedaOrg) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Organizações' }), (data) => {
        let status = data.status

        if (status) {
            let html = `
                <img src="./skdev/img/informacao.png">
                <h2>Tem certeza que deseja<br>excluir?</h2>
                <div class="botoesdivpopup">
                    <button class="popup_botaoconfirmar" onclick="ConfirmarDeletarOrganizacaoGrupo('${nomedaOrg}')">Confirmar</button>
                    <button class="popup_botaocancelar" onclick="CancelarPopup()">Cancelar</button>
                </div>
            `
            $('.popupconfirmacao').html(html)
            $('.popupconfirmacao').css('display','flex')
        }
    })
}

function ConfirmarDeletarOrganizacaoGrupo(nomedaOrg) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Organizações' }), (data) => {
        let status = data.status
        
        if (status) {
            $('.popupconfirmacao').fadeOut(2000)
            $.post(`http://${GetParentResourceName()}/staffDeletarGrupo`, JSON.stringify({ nomedaorganizacao: nomedaOrg }), (data) => {})
            AlterarMenu('Inicio')
        }
    })
}

function CancelarPopup() {
    $('.popupconfirmacao').fadeOut(1000)
}

function confirmarBotaoCargoInvisivel() {
    if ($('.confirmarcargoinvisivel').attr('cargoinvisiveltrue') != undefined) {
        $('.confirmarcargoinvisivel').removeAttr('cargoinvisiveltrue')
    } else {
        $('.confirmarcargoinvisivel').attr('cargoinvisiveltrue','')
    }
}









function gerenciarstaffinput() {
    const input = document.querySelector('.gerenciarstaff_pesquisarmembroinput')
    const membros = document.querySelectorAll('.gerenciarstaff_membro')

    input.addEventListener('input', () => {
        const valor = input.value.toLowerCase()

        membros.forEach(membro => {
            const id = membro.querySelector('.gerenciarstaff_iddomembroh2').textContent.toLowerCase()
            const nome = membro.querySelector('.gerenciarstaff_nomedomembroh2').textContent.toLowerCase()
            const cargo = membro.querySelector('.gerenciarstaff_cargodomembroh2').textContent.toLowerCase()

            if (id.includes(valor) || nome.includes(valor) || cargo.includes(valor)) {
                membro.style.display = 'flex'
            } else {
                membro.style.display = 'none'
            }
        })
    })
}

let gerenciarorganizador = false
function AAZBotaogerenciarstaff() {
    const membros = Array.from(document.querySelectorAll('.gerenciarstaff_membro'))

    membros.sort((a, b) => {
        const nomeA = a.querySelector('.gerenciarstaff_nomedomembroh2').textContent.toUpperCase()
        const nomeB = b.querySelector('.gerenciarstaff_nomedomembroh2').textContent.toUpperCase()

        if (gerenciarorganizador) {
            if (nomeA < nomeB) {
                return -1
            }

            if (nomeA > nomeB) {
                return 1
            }
        } else {
            if (nomeA < nomeB) {
                return 1
            }

            if (nomeA > nomeB) {
                return -1
            }
        }

        return 0
    })

    const membrosBox = document.querySelector('.gerenciarstaff_boxmembros')
    membrosBox.innerHTML = ''

    membros.forEach(membro => {
        membrosBox.appendChild(membro)
    })

    if (gerenciarorganizador) {
        $('.gerenciarstaff_botaodeaaz').attr('botaodeaazativo', '')
    } else {
        $('.gerenciarstaff_botaodeaaz').removeAttr('botaodeaazativo')
    }

    gerenciarorganizador = !gerenciarorganizador
}

function gerenciarStaffEditarGrupo() {
    permissoesTotais = []
    arraySelecionados = []
    $.post(`http://${GetParentResourceName()}/editarGrupoStaff`, JSON.stringify({}), (data) => {
        let grupoSelecionado = data.staff

        $('.selecionarcriarouexistente').attr('desaparecer', '')
        setTimeout(() => {
            $('.selecionarcriarouexistente').removeAttr('desaparecer')
            $('.selecionarcriarouexistente').css('display', 'none')

            if (grupoSelecionado.blackliststatus) {
                var html = `
                <div class="painelcriargrupo">
                <div class="informacaogrupo">
                    <div class="fotogrupo" onclick="mudarFotoCriacao()">
                        <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                    </div>
                    <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
    
                    <h2 class="grupoh2">Nome da Organização:</h2>
                    <input type="text" value="${grupoSelecionado.nomegrupo}" class="textonomedaorg" onkeydown="$(this).css('border','none')">
    
                    <h2 class="maximodemembroscriacao">Máximo de Membros:</h2>
                    <input type="text" value="${grupoSelecionado.maximodemembros}" class="textomaximodemembros" onkeydown="return ( event.ctrlKey || event.altKey 
                        || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                        || (95<event.keyCode && event.keyCode<106)
                        || (event.keyCode==8) || (event.keyCode==9) 
                        || (event.keyCode>34 && event.keyCode<40) 
                        || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
    
                    <h2 class="logsgeraish2">Logs Gerais:</h2>
                    <input type="text" class="textologsgerais" onkeydown="$(this).css('border','none')">
    
                    <h2 class="blacklisth2">Blacklist:</h2>
                    <div class="selectbox1" onclick="blacklist(1)"><img src="./skdev/img/cancelar.png" draggable="false"></div>
                    <div class="selectbox2" onclick="blacklist(2)" blacklistselecionada="true"><img src="./skdev/img/confirmar.png" draggable="false"></div>
    
                    <h2 class="blacklisthorash2">Blacklist Horas:</h2>
                    <input type="text" class="blacklisthorasinput" value="${grupoSelecionado.blacklisthoras}" onkeydown="return ( event.ctrlKey || event.altKey 
                        || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                        || (95<event.keyCode && event.keyCode<106)
                        || (event.keyCode==8) || (event.keyCode==9) 
                        || (event.keyCode>34 && event.keyCode<40) 
                        || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
    
                    <button class="botaocriar" onclick="editarOrganizacao()">
                        <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                        <h2>Concluir Edição</h2>
                    </button>
                    <button class="botaocancelar" onclick="cancelarCriacao()">
                        <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                        <h2>Cancelar Edição</h2>
                    </button>
                </div>
    
                <div class="partedegrupos">
                    <h2 class="partedecargosh2">Parte de Cargos</h2>
                    <div class="barrapartedecargos"></div>
    
                    <button class="botaoadicionarcargo" onclick="adicionarCargo()">
                        <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                        <h2>ADICIONAR CARGO</h2>
                    </button>
    
                    <div class="boxcargos">
                    </div>
                </div>
            </div>
                `
            } else {
                var html = `
                <div class="painelcriargrupo">
                <div class="informacaogrupo">
                    <div class="fotogrupo" onclick="mudarFotoCriacao()">
                        <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                    </div>
                    <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
    
                    <h2 class="grupoh2">Nome da Organização:</h2>
                    <input type="text" value="${grupoSelecionado.nomegrupo}" class="textonomedaorg" onkeydown="$(this).css('border','none')">
    
                    <h2 class="maximodemembroscriacao">Máximo de Membros:</h2>
                    <input type="text" value="${grupoSelecionado.maximodemembros}" class="textomaximodemembros" onkeydown="return ( event.ctrlKey || event.altKey 
                        || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                        || (95<event.keyCode && event.keyCode<106)
                        || (event.keyCode==8) || (event.keyCode==9) 
                        || (event.keyCode>34 && event.keyCode<40) 
                        || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
    
                    <h2 class="logsgeraish2">Logs Gerais:</h2>
                    <input type="text" class="textologsgerais" onkeydown="$(this).css('border','none')">
    
                    <h2 class="blacklisth2">Blacklist:</h2>
                    <div class="selectbox1" onclick="blacklist(1)" blacklistselecionada="true"><img src="./skdev/img/cancelar.png" draggable="false"></div>
                    <div class="selectbox2" onclick="blacklist(2)"><img src="./skdev/img/confirmar.png" draggable="false"></div>
    
                    <h2 class="blacklisthorash2">Blacklist Horas:</h2>
                    <input type="text" class="blacklisthorasinput" onkeydown="return ( event.ctrlKey || event.altKey 
                        || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                        || (95<event.keyCode && event.keyCode<106)
                        || (event.keyCode==8) || (event.keyCode==9) 
                        || (event.keyCode>34 && event.keyCode<40) 
                        || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
    
                    <button class="botaocriar" onclick="editarOrganizacao()">
                        <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                        <h2>Concluir Edição</h2>
                    </button>
                    <button class="botaocancelar" onclick="cancelarCriacao()">
                        <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                        <h2>Cancelar Edição</h2>
                    </button>
                </div>
    
                <div class="partedegrupos">
                    <h2 class="partedecargosh2">Parte de Cargos</h2>
                    <div class="barrapartedecargos"></div>
    
                    <button class="botaoadicionarcargo" onclick="adicionarCargo()">
                        <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                        <h2>ADICIONAR CARGO</h2>
                    </button>
    
                    <div class="boxcargos">
                    </div>
                </div>
            </div>
                `
            }
            $('.painelcriargrupo').html(html)

            grupoSelecionado.cargosorganizacao.forEach((texto, index) => {
                let appendCargo = `
                <div class="cargodiv">
                    <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                    <h2 class="cargoh2">${texto.nomedocargonopainel}</h2>
    
                    <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                        <img src="./skdev/img/clonar.png" draggable="false">
                        <h2>Clonar Cargo</h2>
                    </button>
                    <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                        <img src="./skdev/img/editar.png" draggable="false">
                        <h2>Editar Cargo</h2>
                    </button>
                    <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                        <img src="./skdev/img/excluir.png" draggable="false">
                        <h2>Excluir Cargo</h2>
                    </button>
                </div>
                `
                $('.boxcargos').append(appendCargo)
                let arrayEntrada = { [texto.nomedocargonopainel]: { cargoingame: [texto.nomedocargoingame], permissoes: [texto.permissoesdocargo] } }
                permissoesTotais.push(arrayEntrada)
                arrayEntrada = []
            })
            $('.painelcriargrupo').css('display', 'flex')
            $('.partedegrupos').css('display', 'flex')
            $('.informacaogrupo').css('display', 'flex')
        }, 800)
    })
}

let membroverificado = false
let idmembroverificado = false
function gerenciarstaffBotaoadicionarmembro() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Adicionar Membros' }), (data) => {
        let status = data.status

        if (status) {
            arrayCargosSelecionados = []
            idmembroverificado = false
            membroverificado = false
            $('.teladeloading').css('display', 'flex')
            setTimeout(() => {
                $('.fundopainel').css('display', 'none')
                $('.adicionarcargo').css('display', 'none')
                $('.selecionarcriarouexistente').css('display', 'none')
                $('.painelcriargrupo').css('display', 'none')
                $('.estatisticasgrupo').css('display', 'none')
                $('.gerenciargrupostaff').css('display', 'none')
                $('.gerenciarstaff').css('display', 'none')
                $('.adicionarmembro').css('display', 'none')
                $('.gerenciarpainelstaff').css('display', 'none')
                $('.gerenciarcidadao').css('display', 'none')

                $('.gerenciarstaff').css('display', 'flex')

                let htmladicionarmembro = `
                <img src="./skdev/img/voltar.png" class="adicionarmembro_setavoltar" draggable="false" onclick="gerenciarstaffVoltar()">
        
                <img src="./skdev/img/membro.png" class="adicionarmembro_membroimg" draggable="false">
        
                <div class="adicionarmembro_logobolinha">
                    <img src="./skdev/img/logo.png" draggable="false">
                </div>
        
                <h2 class="adicionarmembro_adicionarcargonomembroh2">Adicionar Cargo no Membro</h2>
                <h2 class="adicionarmembro_informariddomembroh2">Informe o Seguinte ID do Membro</h2>
                <input type="text" class="adicionarmembro_inputiddomembro">
                
                <button class="adicionarmembro_botaoverificariddomembro" onclick="verificaridBlacklist()">
                    Verificar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
                
                <h2 class="adicionarmembro_selecionarcargosdomembroh2">Selecione Abaixo os Cargos Que o Membro irá Receber</h2>
        
                <img src="./skdev/img/seta.png" class="adicionarmembro_setaselectcargos" draggable="false">
                <select class="adicionarmembro_selectselecaodecargos" onchange="seletordecargosMudado()">
                    <option>Selecionar os cargos do player</option>
                </select>
        
                <div class="adicionarmembro_cargosselecionadosbox">
                </div>
        
                <button class="adicionarmembro_confirmaradicaomembro" onclick="confirmaradicaomembro()">
                    Confirmar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
                `
                $('.adicionarmembro').html(htmladicionarmembro)

                $.post(`http://${GetParentResourceName()}/staffeditarreceberinformacoes`, JSON.stringify({}), (data) => {
                    let cargos = data.organizacao

                    if (cargos.cargosorganizacao != undefined) {
                        cargos.cargosorganizacao.forEach((texto, index) => {
                            let nomedocargo = Object.keys(texto)[0]
                            let htmlappendoption = `<option>${nomedocargo}</option>`
                            $('.adicionarmembro_selectselecaodecargos').append(htmlappendoption)
                        })
                    }
                })

                $('.adicionarmembro').css('display', 'flex')

                $('.teladeloading').attr('desaparecer', '')
                setTimeout(() => {
                    $('.teladeloading').removeAttr('desaparecer')
                    $('.teladeloading').css('display', 'none')
                }, 800)
            }, 1000)
        }
    })
}

function verificaridBlacklist() {
    let iddomembro = $('.adicionarmembro_inputiddomembro').val()

    if (iddomembro.length != 0) {
        $.post(`http://${GetParentResourceName()}/verificaridblacklist`, JSON.stringify({ iddomembro: iddomembro }), (data) => {
            if (data.blacklist) {
                $('.adicionarmembro_inputiddomembro').css('border', '.1vw solid green')
                idmembroverificado = iddomembro
                membroverificado = true
            } else {
                $('.adicionarmembro_inputiddomembro').css('border', '.1vw solid red')
                idmembroverificado = false
                membroverificado = false
            }
        })
    }
}

function confirmaradicaomembro() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Adicionar Membros' }), (data) => {
        let status = data.status

        if (status) {
            if (membroverificado) {
                $.post(`http://${GetParentResourceName()}/staffadicionarmembro`, JSON.stringify({ iddomembro: idmembroverificado, cargoselecionados: arrayCargosSelecionados }), (data) => { })

                $('.teladeloading').css('display', 'flex')
                setTimeout(() => {
                    $('.adicionarmembro').css('display', 'none')

                    $('.teladeloading').attr('desaparecer', '')
                    setTimeout(() => {
                        $('.teladeloading').removeAttr('desaparecer')
                        $('.teladeloading').css('display', 'none')
                    }, 800)
                }, 1000)
                idmembroverificado = false
                membroverificado = false
            } else {
                return false
            }
        }
    })
}

let arrayCargosSelecionados = []
function seletordecargosMudado() {
    var Selecionado = $('.adicionarmembro_selectselecaodecargos option:selected').text()

    if (Selecionado != 'Selecionar os cargos do player') {
        if (!arrayCargosSelecionados.includes(Selecionado)) {
            var html = `
            <div class="adicionarmembro_cargoselecionado">
                <h2>${Selecionado}</h2>
                <img src="./skdev/img/apagar.png" draggable="false" onclick="cargosselecionadosremover(this)">
            </div>
            `
            $('.adicionarmembro_cargosselecionadosbox').append(html)
            arrayCargosSelecionados.push(Selecionado)
        }
    }
}

function cargosselecionadosremover(e) {
    var textoRemovido = $(e.parentNode).text()
    var textoRemovidoString = $.trim(textoRemovido)
    arrayCargosSelecionados.forEach((texto, index) => {
        if (texto === textoRemovidoString) {
            const index = arrayCargosSelecionados.indexOf(textoRemovidoString)
            const x = arrayCargosSelecionados.splice(index, 1)
        }
    })
    var root = e.parentNode
    root.parentNode.removeChild(root)
}

function gerenciarstaffVoltar() {
    $('.teladeloading').css('display', 'flex')
    setTimeout(() => {
        $('.adicionarmembro').css('display', 'none')

        $('.teladeloading').attr('desaparecer', '')
        setTimeout(() => {
            $('.teladeloading').removeAttr('desaparecer')
            $('.teladeloading').css('display', 'none')
        }, 800)
    }, 1000)
    idmembroverificado = false
    membroverificado = false
}

function gerenciarStaffEditarGrupoStaff() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Staff' }), (data) => {
        let status = data.status

        if (status) {
            permissoesTotais = []
            arraySelecionados = []
            $.post(`http://${GetParentResourceName()}/staffeditarreceberinformacoes`, JSON.stringify({}), (data) => {
                let grupoSelecionado = data.organizacao
                let imagemStaff = './skdev/img/perfil-criar-grupo.png'
                if (grupoSelecionado.imagemstaff.length > 0) {
                    imagemStaff = grupoSelecionado.imagemstaff
                } else {
                    imagemStaff = './skdev/img/perfil-criar-grupo.png'
                }

                $('.teladeloading').css('display', 'flex')
                setTimeout(() => {
                    $('.gerenciarstaff').css('display', 'none')

                    var html = `
                        <div class="informacaogrupo">
                            <div class="fotogrupo" onclick="mudarFotoCriacao()">
                                <img src="${imagemStaff}" class="imgfoto" draggable="false">
                            </div>
                            <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
            
                            <h2 class="grupoh2">Nome da Organização:</h2>
                            <input type="text" value="${grupoSelecionado.nomegrupo}" class="textonomedaorg" onkeydown="$(this).css('border','none')">
            
                            <button class="botaocriar" onclick="editarOrganizacaoStaff()">
                                <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                                <h2>Concluir Edição</h2>
                            </button>
                            <button class="botaocancelar" onclick="cancelarCriacao()">
                                <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                                <h2>Cancelar Edição</h2>
                            </button>
                        </div>
        
                        <div class="partedegrupos">
                            <h2 class="partedecargosh2">Parte de Cargos</h2>
                            <div class="barrapartedecargos"></div>
            
                            <button class="botaoadicionarcargo" onclick="adicionarCargoStaff()">
                                <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                                <h2>ADICIONAR CARGO</h2>
                            </button>
            
                            <div class="boxcargos">
                            </div>
                        </div>
                    `

                    $('.painelcriargrupo').html(html)

                    if (grupoSelecionado.cargosorganizacao != undefined) {
                        grupoSelecionado.cargosorganizacao.forEach((texto, index) => {
                            let nomedocargonopainel = Object.keys(texto)[0]
                            let cargoInf = texto[nomedocargonopainel]
                            let permissoescargo = cargoInf.permissoes[0]

                            let appendCargo = `
                            <div class="cargodiv">
                                <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                                <h2 class="cargoh2" data-nomedocargonopainel="${nomedocargonopainel}" data-nomedocargoingame="${cargoInf.cargoingame}" data-permissoesdocargo="${permissoescargo}" data-cargoinvisivelstatus="${cargoInf.cargoinvisivelstatus}">${nomedocargonopainel}</h2>
                
                                <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                                    <img src="./skdev/img/clonar.png" draggable="false">
                                    <h2>Clonar Cargo</h2>
                                </button>
                                <button class="editarcargobotao" onclick="CargoacaodeEditar(this,true)">
                                    <img src="./skdev/img/editar.png" draggable="false">
                                    <h2>Editar Cargo</h2>
                                </button>
                                <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                                    <img src="./skdev/img/excluir.png" draggable="false">
                                    <h2>Excluir Cargo</h2>
                                </button>
                            </div>
                            `

                            $('.boxcargos').append(appendCargo)
                            let arrayEntrada = { [nomedocargonopainel]: { cargoingame: cargoInf.cargoingame, permissoes: [permissoescargo], cargoinvisivelstatus: cargoInf.cargoinvisivelstatus } }
                            permissoesTotais.push(arrayEntrada)
                            arrayEntrada = []
                        })
                    }

                    $('.painelcriargrupo').css('display', 'flex')
                    $('.partedegrupos').css('display', 'flex')
                    $('.informacaogrupo').css('display', 'flex')

                    $('.teladeloading').attr('desaparecer', '')
                    setTimeout(() => {
                        $('.teladeloading').removeAttr('desaparecer')
                        $('.teladeloading').css('display', 'none')
                    }, 800)
                }, 1000)
            })
        }
    })
}

function adicionarCargoStaff() {
    if ($('.adicionarcargo').css('display') === 'none') {
        $('.teladeloading').css('display', 'flex')
        setTimeout(() => {
            arraySelecionados = []
            let htmladicionarcargo = `
            <img src="./skdev/img/voltar.png" class="setavoltar-adicionarcargo" draggable="false" onclick="voltarAdicionarCargo()">
            <div class="logobolinha-adicionarcargo"><img src="./skdev/img/logo.png" draggable="false"></div>

            <img src="./skdev/img/organizacao.png" class="orgcargoimg" draggable="false">
            <h2 class="criarcargoadicionarh2">Criar Cargo</h2>

            <h2 class="nomedocargopainelh2">Nome do Cargo no Painel</h2>
            <input type="text" class="inputnomedocargo">

            <h2 class="nomedocargoingameh2">Nome do cargo ingame</h2>
            <input type="text" class="inputnomedocargoingame">

            <h2 class="cargoinvisivelingameh2">Cargo Invisivel</h2>
            <div class="confirmarcargoinvisivel" onclick="confirmarBotaoCargoInvisivel()"></div>

            <h2 class="permissoesdocargo">Permissões do Cargo</h2>
            <img src="./skdev/img/seta.png" class="selecionarpermissoesdocargoimg" draggable="false">
            <select class="selecionarpermissoesdocargo" onchange="selecionarPermissaodoCargo()">
                <option>Selecione As Permissões</option>
                <option>Membros Protegidos</option>
                <option>Criar Organizações</option>
                <option>Gerenciar Organizações</option>
                <option>Gerenciar Staff</option>
                <option>Alterar Logs</option>
                <option>Adicionar Membros</option>
                <option>Upar Membros</option>
                <option>Rebaixar Membros</option>
                <option>Remover Membros</option>
                <option>Gerenciar Cidadoes</option>
            </select>

            <div class="espacopermissoes">
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
                <div class="divpermissao">
                    <h2>Mudar nome da organização</h2>
                    <img src="./skdev/img/apagar.png" draggable="false">
                </div>
            </div>
            <button class="botaoconfirmarcriargrupo" onclick="confirmarCriacaoCargo()">
                Confirmar
                <img src="./skdev/img/confirmar.png" draggable="false">
            </button>
            `
            $('.adicionarcargo').html(htmladicionarcargo)
            $('.adicionarcargo').css('display', 'flex')
            $('.espacopermissoes').html('')

            $('.teladeloading').attr('desaparecer', '')
            setTimeout(() => {
                $('.teladeloading').removeAttr('desaparecer')
                $('.teladeloading').css('display', 'none')
            }, 800)
        }, 1000)
    }
}

function editarOrganizacaoStaff() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Staff' }), (data) => {
        let status = data.status

        if (status) {
            let inputTextoNomeOrg = $('.textonomedaorg').val()
            let inputNomeAntigoOrg = $('.textonomedaorg').attr('value')

            if (inputTextoNomeOrg.length < 1) {
                $('.textonomedaorg').css('border', '.1vw solid #5500ff')
            }

            let imagemdaOrgSrc = $('.imgfoto').attr('src')

            if (inputTextoNomeOrg.length > 0) {
                $.post(`http://${GetParentResourceName()}/concluidoEdicaoStaff`, JSON.stringify({ nomeantigo: inputNomeAntigoOrg, nomedaorganizacao: inputTextoNomeOrg, imagemdaorganizacao: imagemdaOrgSrc, permissoes: permissoesTotais }))
                AlterarMenu('Inicio')
                permissoesTotais = []
                arraySelecionados = []
            }
        }
    })
}

function gerenciarStaffRemover(iddomembro) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Remover Membros' }), (data) => {
        let status = data.status

        if (status) {
            $.post(`http://${GetParentResourceName()}/removerMembroStaff`, JSON.stringify({ iddomembro: iddomembro }))
        }
    })
}

function gerenciarStaffRebaixar(iddomembro) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Rebaixar Membros' }), (data) => {
        let status = data.status

        if (status) {
            $.post(`http://${GetParentResourceName()}/rebaixarMembroStaff`, JSON.stringify({ iddomembro: iddomembro }))
        }
    })
}

function gerenciarStaffUpar(iddomembro) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Upar Membros' }), (data) => {
        let status = data.status

        if (status) {
            $.post(`http://${GetParentResourceName()}/uparMembroStaff`, JSON.stringify({ iddomembro: iddomembro }))
        }
    })
}

function pesquisarMembrosOrgPropia() {
    const input = document.querySelector('.gerenciarstaff_pesquisarmembroinput')
    const membros = document.querySelectorAll('.gerenciarstaff_membro')

    input.addEventListener('input', () => {
        const valor = input.value.toLowerCase()

        membros.forEach(membro => {
            const id = membro.querySelector('.gerenciarstaff_iddomembroh2').textContent.toLowerCase()
            const nome = membro.querySelector('.gerenciarstaff_nomedomembroh2').textContent.toLowerCase()
            const cargo = membro.querySelector('.gerenciarstaff_cargodomembroh2').textContent.toLowerCase()

            if (id.includes(valor) || nome.includes(valor) || cargo.includes(valor)) {
                membro.style.display = 'flex'
            } else {
                membro.style.display = 'none'
            }
        })
    })
}

function AAZBotaoorgpropia() {
    const membros = Array.from(document.querySelectorAll('.gerenciarstaff_membro'))

    membros.sort((a, b) => {
        const nomeA = a.querySelector('.gerenciarstaff_nomedomembroh2').textContent.toUpperCase()
        const nomeB = b.querySelector('.gerenciarstaff_nomedomembroh2').textContent.toUpperCase()

        if (organizado) {
            if (nomeA < nomeB) {
                return -1
            }

            if (nomeA > nomeB) {
                return 1
            }
        } else {
            if (nomeA < nomeB) {
                return 1
            }

            if (nomeA > nomeB) {
                return -1
            }
        }

        return 0
    })

    const membrosBox = document.querySelector('.gerenciarstaff_boxmembros')
    membrosBox.innerHTML = ''

    membros.forEach(membro => {
        membrosBox.appendChild(membro)
    })


    organizado = !organizado
    if (organizado) {
        $('.gerenciarstaff_botaodeaaz').attr('botaodeaazativo', '')
    } else {
        $('.gerenciarstaff_botaodeaaz').removeAttr('botaodeaazativo')
    }
}

function salvarAlteracoesdeLog() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Alterar Logs' }), (data) => {
        let status = data.status

        if (status) {
            var LogDeEnviarImagens = $('.gerenciarpainelstaff_inputlogdeenviarimagens').val()
            var LogDeCriacaoDeOrganizacoes = $('.gerenciarpainelstaff_inputlogdecriacaodeorganizacoes').val()
            var LogDeGerenciarOrganizacoes = $('.gerenciarpainelstaff_inputlogdegerenciarorganizacoes').val()
            var LogDeGerenciarStaff = $('.gerenciarpainelstaff_inputlogdegerenciarstaff').val()
            var LogDeAlteracaoDeLogs = $('.gerenciarpainelstaff_inputlogdealteracaodelogs').val()
            var LogDeGerenciarCidadoes = $('.gerenciarpainelstaff_inputlogdegerenciarcidadoes').val()
            var LogUpamentoDeMembros = $('.gerenciarpainelstaff_inputlogupamentodemembros').val()
            var LogRebaixamentoDeMembros = $('.gerenciarpainelstaff_inputlogrebaixamentodemembros').val()
            var LogRemocaoDeMembros = $('.gerenciarpainelstaff_inputlogremocaodemembros').val()
            var LogAdicaoDeMembros = $('.gerenciarpainelstaff_inputlogadicaodemembros').val()

            $.post(`http://${GetParentResourceName()}/logalteradainfos`, JSON.stringify({ logdeimagens: LogDeEnviarImagens,logdecriacaodeorgs: LogDeCriacaoDeOrganizacoes,logdegerenciarorgs: LogDeGerenciarOrganizacoes,logdegerenciarstaff: LogDeGerenciarStaff,logdealteracaodelogs: LogDeAlteracaoDeLogs,logdegerenciarcidadoes: LogDeGerenciarCidadoes,logupamentodemembros: LogUpamentoDeMembros,logrebaixamentodemembros: LogRebaixamentoDeMembros,logremocaodemembros: LogRemocaoDeMembros,logadicaodemembros: LogAdicaoDeMembros }))
            AlterarMenu('Inicio')
        }
    })
}

function eventoclicarusuarioimagemperfil() {
    $('.inputusuarioimagenenviar').trigger('click')
}

function perfilusuarioImagenEnviar(event) {
    event.preventDefault()

    $.post(`http://${GetParentResourceName()}/obterWebhookImagemStaff`, JSON.stringify({}), (data) => {
        let webhookurl = data.webhook

        if (webhookurl) {
            const imageFile = event.target.files[0]

            const formData = new FormData()
            formData.append("file", imageFile)

            fetch(webhookurl, {
                method: "POST",
                body: formData,
            })
                .then(response => response.json())
                .then(data => {
                    const imageUrl = data.attachments[0].url
                    $('.gerenciarpainelstaff_fotodeperfil img').attr('src', imageUrl)
                    $('.perfilimg').attr('src', imageUrl)
                    $.post(`http://${GetParentResourceName()}/enviarimagemusuario`, JSON.stringify({ linkimagen: imageUrl }), (data) => { })
                })
                .catch(error => {
                })
        }
    })
}

function painelgerenciarcidadoes() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Cidadoes' }), (data) => {
        let status = data.status

        if (status) {
            if ($('.gerenciarcidadao').css('display') === 'none') {
                cargosReceberMembro = []
                $('.teladeloading').css('display', 'flex')
                setTimeout(() => {
                    $('.fundopainel').css('display', 'none')
                    $('.adicionarcargo').css('display', 'none')
                    $('.selecionarcriarouexistente').css('display', 'none')
                    $('.painelcriargrupo').css('display', 'none')
                    $('.gerenciargrupostaff').css('display', 'none')
                    $('.estatisticasgrupo').css('display', 'none')
                    $('.gerenciarstaff').css('display', 'none')
                    $('.adicionarmembro').css('display', 'none')
                    $('.gerenciarpainelstaff').css('display', 'none')
                    $('.gerenciarcidadao').css('display', 'none')

                    var html = `
                    <img src="./skdev/img/voltar.png" class="gerenciarcidadao_setavoltar" draggable="false" onclick="gerenciarCidadaoVoltar()">
        
                    <img src="./skdev/img/membro.png" class="gerenciarcidadao_membroimg" draggable="false">
        
                    <div class="gerenciarcidadao_logobolinha">
                        <img src="./skdev/img/logo.png" draggable="false">
                    </div>
        
                    <h2 class="gerenciarcidadao_adicionarcargonomembroh2">Gerenciar Cidadão</h2>
                    <h2 class="gerenciarcidadao_informariddomembroh2">Informe o Seguinte ID do Cidadao</h2>
                    <input type="text" class="gerenciarcidadao_inputiddomembro">
                    
                    <h2 class="gerenciarcidadao_selecionarcargosdomembroh2">Selecione abaixo a ação no seguinte membro</h2>
        
                    <img src="./skdev/img/seta.png" class="gerenciarcidadao_setaselectcargos" draggable="false">
                    <select class="gerenciarcidadao_selectselecaodecargos" onchange="SelecionarAcaodeGerenciarCidadao()">
                        <option>Selecionar a ação</option>
                        <option>Gerenciar Cargos</option>
                        <option>Adicionar Blacklist</option>
                        <option>Remover Blacklist</option>
                    </select>
        
                    <div class="gerenciarcidadao_cargosselecionadosbox">
                    </div>
        
                    <h2 class="gerenciarcidadao_horasadicionarh2">Digite abaixo o total de horas para adicionar de blacklist</h2>
                    <input type="text" class="gerenciarcidadao_inputhorasadicionar">
        
                    <h2 class="gerenciarcidadao_horasdeblacklistdoplayerh2">Deseja remover a seguinte blacklist do player: 10/05/2023?</h2>
        
                    <button class="gerenciarcidadao_confirmaradicaomembro" onclick="ConfirmarGerenciamentodocidadao()">
                        Confirmar
                        <img src="./skdev/img/confirmar.png" draggable="false">
                    </button>
                    `
                    $('.gerenciarcidadao').html(html)
                    $('.gerenciarcidadao_horasadicionarh2').css('display', 'none')
                    $('.gerenciarcidadao_inputhorasadicionar').css('display', 'none')
                    $('.gerenciarcidadao_horasdeblacklistdoplayerh2').css('display', 'none')
                    $('.gerenciarcidadao_cargosselecionadosbox').css('display', 'none')
                    $('.gerenciarcidadao').css('display', 'flex')

                    $('.teladeloading').attr('desaparecer', '')
                    setTimeout(() => {
                        $('.teladeloading').removeAttr('desaparecer')
                        $('.teladeloading').css('display', 'none')
                    }, 800)
                }, 1000)
            }
        }
    })
}

function gerenciarCidadaoVoltar() {
    $('.teladeloading').css('display', 'flex')
    setTimeout(() => {
        $('.gerenciarcidadao').css('display', 'none')
        $('.gerenciarpainelstaff').css('display', 'flex')

        $('.teladeloading').attr('desaparecer', '')
        setTimeout(() => {
            $('.teladeloading').removeAttr('desaparecer')
            $('.teladeloading').css('display', 'none')
        }, 800)
    }, 1000)
}

let cargosReceberMembro = []
let acaoselecionada = ''
let idmembro = ''
function SelecionarAcaodeGerenciarCidadao() {
    var Selecionado = $('.gerenciarcidadao_selectselecaodecargos option:selected').text()

    if (Selecionado === 'Selecionar a ação') { return false }

    if (Selecionado === 'Gerenciar Cargos') {
        let iddomembro = $('.gerenciarcidadao_inputiddomembro').val()
        if (iddomembro.length > 0) {
            $.post(`http://${GetParentResourceName()}/staffreceberinformacoesid`, JSON.stringify({ iddocidadao: iddomembro }), (data) => {
                idmembro = iddomembro
                acaoselecionada = 'Gerenciar Cargos'

                $('.gerenciarcidadao_horasdeblacklistdoplayerh2').css('display', 'none')
                $('.gerenciarcidadao_horasadicionarh2').css('display', 'none')
                $('.gerenciarcidadao_inputhorasadicionar').css('display', 'none')

                $('.gerenciarcidadao_selectselecaodecargos').attr('onchange', 'SelecionarCargoGerenciarCidadao()')
                $('.gerenciarcidadao_selectselecaodecargos').html('<option>Selecionar o cargo</option>')
                $('.gerenciarcidadao_cargosselecionadosbox').css('display', 'flex')
                $('.gerenciarcidadao_cargosselecionadosbox').html('')

                let cargosdegrupos = data.cargogrupos
                let cargosdoplayer = data.cargosplayer

                if (cargosdegrupos != false) {
                    cargosdegrupos.forEach((texto, index) => {
                        let option = `<option>${texto.cargogrupo}</option>`
                        $('.gerenciarcidadao_selectselecaodecargos').append(option)
                    })
                }

                if (cargosdoplayer != false) {
                    cargosdoplayer.forEach((texto, index) => {
                        let option = `
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>${texto.cargodoplayer}</h2>
                            <img src="./skdev/img/apagar.png" draggable="false" onclick="gerenciarRemoverCargo(this)">
                        </div>
                        `

                        $('.gerenciarcidadao_cargosselecionadosbox').append(option)

                        let cargomembro = texto.cargodoplayer
                        cargosReceberMembro.push(cargomembro)
                    })
                }
            })
        }
    }
    if (Selecionado === 'Adicionar Blacklist') {
        let iddomembro = $('.gerenciarcidadao_inputiddomembro').val()
        idmembro = iddomembro

        acaoselecionada = 'Adicionar Blacklist'

        $('.gerenciarcidadao_horasdeblacklistdoplayerh2').css('display', 'none')
        $('.gerenciarcidadao_inputhorasadicionar').val('')
        $('.gerenciarcidadao_horasadicionarh2').css('display', 'flex')
        $('.gerenciarcidadao_inputhorasadicionar').css('display', 'flex')
    }
    if (Selecionado === 'Remover Blacklist') {
        let iddomembro = $('.gerenciarcidadao_inputiddomembro').val()
        if (iddomembro.length > 0) {
            $.post(`http://${GetParentResourceName()}/staffreceberinformacoesid`, JSON.stringify({ iddocidadao: iddomembro }), (data) => {
                idmembro = iddomembro
                acaoselecionada = 'Remover Blacklist'

                $('.gerenciarcidadao_cargosselecionadosbox').css('display', 'none')
                $('.gerenciarcidadao_horasadicionarh2').css('display', 'none')
                $('.gerenciarcidadao_inputhorasadicionar').css('display', 'none')
                $('.gerenciarcidadao_horasdeblacklistdoplayerh2').css('display', 'none')

                let html = `Deseja remover a seguinte blacklist do player: ${data.blacklistdata}?`
                $('.gerenciarcidadao_horasdeblacklistdoplayerh2').html(html)
                $('.gerenciarcidadao_horasdeblacklistdoplayerh2').css('display', 'flex')
            })
        }
    }
}

function SelecionarCargoGerenciarCidadao() {
    var Selecionado = $('.gerenciarcidadao_selectselecaodecargos option:selected').text()

    if (Selecionado === 'Selecionar o cargo') { return false }

    if (!cargosReceberMembro.includes(Selecionado)) {
        let option = `
        <div class="gerenciarcidadao_cargoselecionado">
            <h2>${Selecionado}</h2>
            <img src="./skdev/img/apagar.png" draggable="false" onclick="gerenciarRemoverCargo(this)">
        </div>
        `

        $('.gerenciarcidadao_cargosselecionadosbox').append(option)

        cargosReceberMembro.push(Selecionado)
    }
}

function gerenciarRemoverCargo(e) {
    var textoRemovido = $(e.parentNode).text()
    var textoRemovidoString = $.trim(textoRemovido)
    cargosReceberMembro.forEach((texto, index) => {
        if (texto === textoRemovidoString) {
            const index = cargosReceberMembro.indexOf(textoRemovidoString)
            const x = cargosReceberMembro.splice(index, 1)
        }
    })
    var root = e.parentNode
    root.parentNode.removeChild(root)
}

function verificarSomenteNumeros(string) {
    return !isNaN(parseFloat(string)) && typeof (string) === 'string' && !isNaN(string - 0)
}

function ConfirmarGerenciamentodocidadao() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesstaff`, JSON.stringify({ iddocidadao: false, permissao: 'Gerenciar Cidadoes' }), (data) => {
        let status = data.status

        if (status) {
            if (verificarSomenteNumeros(idmembro)) {
                let idmembrocorreto = idmembro.length > 0
                if (idmembrocorreto) {
                    if (acaoselecionada === 'Gerenciar Cargos') {
                        AlterarMenu('Inicio')
                        $.post(`http://${GetParentResourceName()}/staffAtualizarCargosCidadao`, JSON.stringify({ iddocidadao: idmembro, cargos: cargosReceberMembro }), (data) => { })
                        cargosReceberMembro = []
                        acaoselecionada = ''
                        idmembro = ''
                    }
                    if (acaoselecionada === 'Adicionar Blacklist') {
                        let horasblacklist = $('.gerenciarcidadao_inputhorasadicionar').val()
                        if (horasblacklist.length > 0) {
                            if (verificarSomenteNumeros(horasblacklist)) {
                                AlterarMenu('Inicio')
                                $.post(`http://${GetParentResourceName()}/staffAdicionarBlacklistCidadao`, JSON.stringify({ iddocidadao: idmembro, horasblacklist: horasblacklist }), (data) => { })
                                cargosReceberMembro = []
                                acaoselecionada = ''
                                idmembro = ''
                            }
                        }
                    }
                    if (acaoselecionada === 'Remover Blacklist') {
                        AlterarMenu('Inicio')
                        $.post(`http://${GetParentResourceName()}/staffRemoverBlacklistCidadao`, JSON.stringify({ iddocidadao: idmembro }), (data) => { })
                        cargosReceberMembro = []
                        acaoselecionada = ''
                        idmembro = ''
                    }
                }
            }
        }
    })
}

// Organizações

function gerenciarOrgpropiaEditarGrupo() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesorgpropia`, JSON.stringify({iddocidadao: false, permissao: 'Gerenciar Grupo'}), (data) => {
        let status = data.status

        if (status) {
            $.post(`http://${GetParentResourceName()}/organizacaopropiaeditarreceberinformacoes`, JSON.stringify({}), (data) => {
                let grupoSelecionado = data.organizacao
                let imagemOrgPropia = './skdev/img/perfil-criar-grupo.png'
                if (grupoSelecionado.imagemorgpropia.length > 0) {
                    imagemOrgPropia = grupoSelecionado.imagemorgpropia
                } else {
                    imagemOrgPropia = './skdev/img/perfil-criar-grupo.png'
                }
        
                $('.teladeloading').css('display', 'flex')
                setTimeout(() => {
                    $('.gerenciarstaff').css('display', 'none')
        
                    var html = `
                        <div class="informacaogrupo">
                            <div class="fotogrupo" onclick="mudarFotoCriacao()">
                                <img src="${imagemOrgPropia}" class="imgfoto" draggable="false">
                            </div>
                            <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
            
                            <h2 class="grupoh2">Nome da Organização:</h2>
                            <input type="text" value="${grupoSelecionado.nomegrupo}" class="textonomedaorg" onkeydown="$(this).css('border','none')">
            
                            <button class="botaocriar" onclick="editarOrganizacaoPropia()">
                                <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                                <h2>Concluir Edição</h2>
                            </button>
                            <button class="botaocancelar" onclick="cancelarCriacao()">
                                <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                                <h2>Cancelar Edição</h2>
                            </button>
                        </div>
                    `
        
                    $('.painelcriargrupo').html(html)
                    $('.painelcriargrupo').css('display', 'flex')
                    $('.informacaogrupo').css('display', 'flex')
        
                    $('.teladeloading').attr('desaparecer', '')
                    setTimeout(() => {
                        $('.teladeloading').removeAttr('desaparecer')
                        $('.teladeloading').css('display', 'none')
                    }, 800)
                }, 1000)
            })
        }
    })
}

function editarOrganizacaoPropia() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesorgpropia`, JSON.stringify({iddocidadao: false, permissao: 'Gerenciar Grupo'}), (data) => {
        let status = data.status

        if (status) {
            let inputTextoNomeOrg = $('.textonomedaorg').val()
            let inputNomeAntigoOrg = $('.textonomedaorg').attr('value')
        
            if (inputTextoNomeOrg.length < 1) {
                $('.textonomedaorg').css('border', '.1vw solid #5500ff')
            }
        
            let imagemdaOrgSrc = $('.imgfoto').attr('src')
        
            if (inputTextoNomeOrg.length > 0) {
                $.post(`http://${GetParentResourceName()}/concluidoEdicaoOrgPropia`, JSON.stringify({ nomeantigo: inputNomeAntigoOrg, nomedaorganizacao: inputTextoNomeOrg, imagemdaorganizacao: imagemdaOrgSrc }))
                AlterarMenu('Inicio')
            }
        }
    })
}

function gerenciarorgpropiaBotaoadicionarmembro() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesorgpropia`, JSON.stringify({iddocidadao: false, permissao: 'Adicionar Membros'}), (data) => {
        let status = data.status

        if (status) {
            arrayCargosSelecionados = []
            idmembroverificado = false
            membroverificado = false
            $('.teladeloading').css('display', 'flex')
            setTimeout(() => {
                $('.fundopainel').css('display', 'none')
                $('.adicionarcargo').css('display', 'none')
                $('.selecionarcriarouexistente').css('display', 'none')
                $('.painelcriargrupo').css('display', 'none')
                $('.estatisticasgrupo').css('display', 'none')
                $('.gerenciargrupostaff').css('display', 'none')
                $('.gerenciarstaff').css('display', 'none')
                $('.adicionarmembro').css('display', 'none')
                $('.gerenciarpainelstaff').css('display', 'none')
                $('.gerenciarcidadao').css('display', 'none')
        
                $('.gerenciarstaff').css('display', 'flex')
        
                let htmladicionarmembro = `
                <img src="./skdev/img/voltar.png" class="adicionarmembro_setavoltar" draggable="false" onclick="gerenciarOrgPropiaVoltar()">
        
                <img src="./skdev/img/membro.png" class="adicionarmembro_membroimg" draggable="false">
        
                <div class="adicionarmembro_logobolinha">
                    <img src="./skdev/img/logo.png" draggable="false">
                </div>
        
                <h2 class="adicionarmembro_adicionarcargonomembroh2">Adicionar Cargo no Membro</h2>
                <h2 class="adicionarmembro_informariddomembroh2">Informe o Seguinte ID do Membro</h2>
                <input type="text" class="adicionarmembro_inputiddomembro">
                
                <button class="adicionarmembro_botaoverificariddomembro" onclick="verificaridBlacklist()">
                    Verificar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
                
                <h2 class="adicionarmembro_selecionarcargosdomembroh2">Selecione Abaixo os Cargos Que o Membro irá Receber</h2>
        
                <img src="./skdev/img/seta.png" class="adicionarmembro_setaselectcargos" draggable="false">
                <select class="adicionarmembro_selectselecaodecargos" onchange="seletordecargosMudadoOrgPropia()">
                    <option cargoingame="Selecionar os cargos do player">Selecionar os cargos do player</option>
                </select>
        
                <div class="adicionarmembro_cargosselecionadosbox">
                </div>
        
                <button class="adicionarmembro_confirmaradicaomembro" onclick="confirmaradicaomembroorg()">
                    Confirmar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
                `
                $('.adicionarmembro').html(htmladicionarmembro)
        
                $.post(`http://${GetParentResourceName()}/orgpropiareceberinformacoes`, JSON.stringify({}), (data) => {
                    let cargos = data.organizacao
        
                    if (cargos != undefined) {
                        cargos.forEach((texto, index) => {
                            let nomedocargo = texto.nomedocargo
                            let nomedocargoingame = texto.nomedocargoingame
                            let htmlappendoption = `<option cargoingame="${nomedocargoingame}">${nomedocargo}</option>`
                            $('.adicionarmembro_selectselecaodecargos').append(htmlappendoption)
                        })
                    }
                })
        
                $('.adicionarmembro').css('display', 'flex')
        
                $('.teladeloading').attr('desaparecer', '')
                setTimeout(() => {
                    $('.teladeloading').removeAttr('desaparecer')
                    $('.teladeloading').css('display', 'none')
                }, 800)
            }, 1000)
        }
    })
}

function confirmaradicaomembroorg() {
    if (membroverificado) {
        $.post(`http://${GetParentResourceName()}/orgpropiaadicionarmembro`, JSON.stringify({ iddomembro: idmembroverificado, cargoselecionados: arrayCargosSelecionados }), (data) => { })

        $('.teladeloading').css('display', 'flex')
        setTimeout(() => {
            $('.adicionarmembro').css('display', 'none')

            $('.teladeloading').attr('desaparecer', '')
            setTimeout(() => {
                $('.teladeloading').removeAttr('desaparecer')
                $('.teladeloading').css('display', 'none')
            }, 800)
        }, 1000)
        idmembroverificado = false
        membroverificado = false
    } else {
        return false
    }
}

function gerenciarOrgPropiaVoltar() {
    $('.teladeloading').css('display', 'flex')
    setTimeout(() => {
        $('.adicionarmembro').css('display', 'none')

        $('.teladeloading').attr('desaparecer', '')
        setTimeout(() => {
            $('.teladeloading').removeAttr('desaparecer')
            $('.teladeloading').css('display', 'none')
        }, 800)
    }, 1000)
    idmembroverificado = false
    membroverificado = false
}

function seletordecargosMudadoOrgPropia() {
    var Selecionado = $('.adicionarmembro_selectselecaodecargos option:selected').attr('cargoingame')
    var NomeSelecionado = $('.adicionarmembro_selectselecaodecargos option:selected').text()

    if (Selecionado != 'Selecionar os cargos do player') {
        if (!arrayCargosSelecionados.includes(Selecionado)) {
            var html = `
            <div class="adicionarmembro_cargoselecionado" cargoingame="${Selecionado}">
                <h2>${NomeSelecionado}</h2>
                <img src="./skdev/img/apagar.png" draggable="false" onclick="cargosselecionadosremoverorgpropia(this)">
            </div>
            `
            $('.adicionarmembro_cargosselecionadosbox').append(html)
            arrayCargosSelecionados.push(Selecionado)
        }
    }
}

function cargosselecionadosremoverorgpropia(e) {
    var textoRemovido = $(e.parentNode).attr('cargoingame')
    arrayCargosSelecionados.forEach((texto, index) => {
        if (texto === textoRemovido) {
            const index = arrayCargosSelecionados.indexOf(textoRemovido)
            const x = arrayCargosSelecionados.splice(index, 1)
        }
    })
    var root = e.parentNode
    root.parentNode.removeChild(root)
}

function gerenciarGrupoPropioUpar(nomeorg,iddomembro) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesorgpropia`, JSON.stringify({iddocidadao: false, permissao: 'Upar Membros'}), (data) => {
        let status = data.status

        if (status) {
            $.post(`http://${GetParentResourceName()}/uparMembroOrgPropia`, JSON.stringify({ nomedaorg: nomeorg, iddomembro: iddomembro }))
        }
    })
}

function gerenciarGrupoPropioRebaixar(nomeorg,iddomembro) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesorgpropia`, JSON.stringify({iddocidadao: false, permissao: 'Rebaixar Membros'}), (data) => {
        let status = data.status

        if (status) {
            $.post(`http://${GetParentResourceName()}/rebaixarMembroOrgPropia`, JSON.stringify({ nomedaorg: nomeorg, iddomembro: iddomembro }))
        }
    })
}

function gerenciarGrupoPropioRemover(nomeorg,iddomembro) {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesorgpropia`, JSON.stringify({iddocidadao: false, permissao: 'Remover Membros'}), (data) => {
        let status = data.status

        if (status) {
            $.post(`http://${GetParentResourceName()}/removerMembroOrgPropia`, JSON.stringify({ nomedaorg: nomeorg, iddomembro: iddomembro }))
        }
    })
}

function salvarAlteracoesdeLogOrgPropia() {
    $.post(`http://${GetParentResourceName()}/verificarpermissoesorgpropia`, JSON.stringify({iddocidadao: false, permissao: 'Alterar Logs'}), (data) => {
        let status = data.status

        if (status) {
            var LogEdicaoDaOrganizacao = $('.gerenciarpainelstaff_inputloggeral').val()
            var LogAlteracaoDeLog = $('.gerenciarpainelstaff_inputcriacaodeorg').val()
            var LogMembrosAdicionados = $('.gerenciarpainelstaff_inputmembroremovidostaff').val()
            var LogMembrosExpulsos = $('.gerenciarpainelstaff_inputmembrosupadosstaff').val()
            var LogMembrosUpados = $('.gerenciarpainelstaff_inputmembrosrebaixadosstaff').val()
            var LogMembrosRebaixados = $('.gerenciarpainelstaff_inputmembrosadicionadosstaff').val()
        
            $.post(`http://${GetParentResourceName()}/logsAlteradasOrgPropia`, JSON.stringify({ logedicaodaorganizacao: LogEdicaoDaOrganizacao, logalteracaodelog: LogAlteracaoDeLog, logmembrosupados: LogMembrosUpados, logmembrosrebaixados: LogMembrosRebaixados, logmembrosexpulsos: LogMembrosExpulsos, logmembrosadicionados: LogMembrosAdicionados }))
            AlterarMenu('Inicio')
        }
    })
}

window.addEventListener('keydown', function (evento) {
    if (evento.isComposing || evento.keyCode === 27) {
        if ($('.groups').css('display') === 'flex') {
            $('.groups').attr('desaparecer', '')
            setTimeout(() => {
                $('.groups').removeAttr('desaparecer')
                $('.groups').css('display', 'none')
            }, 800)

            $.post(`http://${GetParentResourceName()}/fecharpainel`)
        }
    }
})

window.addEventListener('message', (event) => {
    let data = event.data

    if (data.abrirpainel != undefined) {
        if (data.abrirpainel === 'PainelADM') {
            if ($('.groups').css('display') === 'none') {
                acoes = 'staff'
                $('.teladeloading').css('display', 'flex')
                setTimeout(() => {
                    let resetadorhtml = `
                    <div class="barralateral">
                    <div class="perfilusuario">
                        <img src="./skdev/img/usuario-de-perfil.png" class="perfilimg" draggable="false">
                        <div class="box-perfil">
                            <img src="./skdev/img/nome.png" class="imgbox" draggable="false">
                            <h2>Erick Silva #100092</h2>
                        </div>
                        <div class="box-perfil">
                            <img src="./skdev/img/grupo.png" class="imgbox" draggable="false">
                            <h2>Administração</h2>
                        </div>
                        <div class="box-perfil">
                            <img src="./skdev/img/cargo.png" class="imgbox" draggable="false">
                            <h2>Ajudante</h2>
                        </div>
                    </div>
                    <div class="botoesmenu">
                        <div class="box-botaomenu" onclick="AlterarMenu('Inicio')">
                            <h2>Inicio</h2>
                            <img src="./skdev/img/inicio.png" class="img-boxmenu" draggable="false">
                        </div>
                        <div class="box-botaomenu" onclick="AlterarMenu('CriarGrupos')">
                            <h2>Criar Grupos</h2>
                            <img src="./skdev/img/adicionar.png" class="img-boxmenu" draggable="false">
                        </div>
                        <div class="box-botaomenu" onclick="AlterarMenu('GerenciarGrupos')">
                            <h2>Gerenciar Grupos</h2>
                            <img src="./skdev/img/gerenciar.png" class="img-boxmenu" draggable="false">
                        </div>
                        <div class="box-botaomenu" onclick="AlterarMenu('GerenciarStaff')">
                            <h2>Gerenciar Staff</h2>
                            <img src="./skdev/img/staff.png" class="img-boxmenu" draggable="false">
                        </div>
                        <div class="box-botaomenu" onclick="AlterarMenu('ConfigurarPainel')">
                            <h2>Configurar Painel</h2>
                            <img src="./skdev/img/configurar.png" class="img-boxmenu" draggable="false">
                        </div>
                    </div>
                </div>
        
                <!-- Começo Botão Inicio -->
                <div class="fundopainel">
                    <div class="informacoespainel">
                        <div class="boxinformacao">
                            <img src="./skdev/img/membros.png" class="informacaoimg" draggable="false">
                            <h2>Ajudantes Online: 12</h2>
                        </div>
                        <div class="boxinformacao">
                            <img src="./skdev/img/organizacoes.png" class="informacaoimg" draggable="false">
                            <h2>Organizações: 20</h2>
                        </div>
                        <div class="boxinformacao">
                            <img src="./skdev/img/pessoas.png" class="informacaoimg" draggable="false">
                            <h2>Cidadões Online: 108</h2>
                        </div>
                        <div class="logobolinha">
                            <img src="./skdev/img/logo.png" class="logocidade" draggable="false">
                        </div>
                    </div>
        
                    <div class="bemvindopainel">
                        <h2>Seja bem-vindo, Erick Silva!</h2>
                        <h3>
                            Você está dentro do painel gerenciador de organizações<br>
                            Onde foi criado no intuito de ser um painel facilitador de vidas<br>
                            Nele você vai poder desde criar novos grupos<br>
                            Até configurar permissões de cargos<br>
                            Caso você receba uma permissão especial irá poder acessar<br>
                            Configurações de blacklist, Configuração de logs e mais!
                        </h3>
                        <img src="./skdev/img/personagem.png" class="personagembomvindo" draggable="false">
                    </div>
        
                    <h2 class="textologs">Ultimas ações da administração</h2>
                    <div class="barraseparar"></div>
        
                    <div class="logsbox">
                        <div class="logdiv">
                            <img src="./skdev/img/informacao.png" class="logdivimg" draggable="false">
                            <h2>Nenhuma log encontrada #1</h2>
                        </div>
                        <div class="logdiv">
                            <img src="./skdev/img/informacao.png" class="logdivimg" draggable="false">
                            <h2>Nenhuma log encontrada #2</h2>
                        </div>
                        <div class="logdiv">
                            <img src="./skdev/img/informacao.png" class="logdivimg" draggable="false">
                            <h2>Nenhuma log encontrada #3</h2>
                        </div>
                    </div>
                </div>
                <!-- Final Botão Inicio -->
        
                <!-- Começo Criar Grupos -->
                <div class="adicionarcargo">
                    <img src="./skdev/img/voltar.png" class="setavoltar-adicionarcargo" draggable="false" onclick="voltarAdicionarCargo()">
                    <div class="logobolinha-adicionarcargo"><img src="./skdev/img/logo.png" draggable="false"></div>
        
                    <img src="./skdev/img/organizacao.png" class="orgcargoimg" draggable="false">
                    <h2 class="criarcargoadicionarh2">Criar Cargo</h2>
        
                    <h2 class="nomedocargopainelh2">Nome do Cargo no Painel</h2>
                    <input type="text" class="inputnomedocargo">
        
                    <h2 class="nomedocargoingameh2">Nome do cargo ingame</h2>
                    <input type="text" class="inputnomedocargoingame">


                    <h2 class="cargoinvisivelingameh2">Cargo Invisivel</h2>
                    <div class="confirmarcargoinvisivel" onclick="confirmarBotaoCargoInvisivel()"></div>
        
                    <h2 class="permissoesdocargo">Permissões do Cargo</h2>
                    <img src="./skdev/img/seta.png" class="selecionarpermissoesdocargoimg" draggable="false">
                    <select class="selecionarpermissoesdocargo" onchange="selecionarPermissaodoCargo()">
                        <option>Selecione As Permissões</option>
                        <option>Membros Protegidos</option>
                        <option>Criar Organizações</option>
                        <option>Gerenciar Organizações</option>
                        <option>Gerenciar Staff</option>
                        <option>Alterar Logs</option>
                        <option>Adicionar Membros</option>
                        <option>Upar Membros</option>
                        <option>Rebaixar Membros</option>
                        <option>Remover Membros</option>
                        <option>Gerenciar Cidadoes</option>
                    </select>
        
                    <div class="espacopermissoes">
                        <div class="divpermissao">
                            <h2>Mudar nome da organização</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="divpermissao">
                            <h2>Mudar nome da organização</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="divpermissao">
                            <h2>Mudar nome da organização</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="divpermissao">
                            <h2>Mudar nome da organização</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="divpermissao">
                            <h2>Mudar nome da organização</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="divpermissao">
                            <h2>Mudar nome da organização</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                    </div>
                    <button class="botaoconfirmarcriargrupo">
                        Confirmar
                        <img src="./skdev/img/confirmar.png" draggable="false">
                    </button>
                </div>
        
                <div class="selecionarcriarouexistente">
                    <div class="boxcriarouexistente">
                        <h2>
                            Você pretende criar uma organização<br>
                            ou usar uma existente para criar outra?
                        </h2>
        
                        <img src="./skdev/img/seta.png" class="setaselecionarcriarouexistentesssss" draggable="false">
                        <select class="selecionarcriarouexistentessssss" onchange="SelecionarCriacaodegrupos()">
                            <option value="nada">Selecionar Opção</option>
                            <option value="valor2">Criar Uma Nova Organização</option>
                            <option value="valor3">Usar Organização Existente</option>
                        </select>
                    </div>
                </div>
        
                <div class="painelcriargrupo">
                    <div class="informacaogrupo">
                        <div class="fotogrupo" onclick="mudarFotoCriacao()">
                            <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                        </div>
                        <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>
        
                        <h2 class="grupoh2">Nome da Organização:</h2>
                        <input type="text" class="textonomedaorg" onkeydown="$(this).css('border','none')">
        
                        <h2 class="maximodemembroscriacao">Máximo de Membros:</h2>
                        <input type="text" class="textomaximodemembros" onkeydown="return ( event.ctrlKey || event.altKey 
                            || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                            || (95<event.keyCode && event.keyCode<106)
                            || (event.keyCode==8) || (event.keyCode==9) 
                            || (event.keyCode>34 && event.keyCode<40) 
                            || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
        
                        <h2 class="logsgeraish2">Logs Gerais:</h2>
                        <input type="text" class="textologsgerais" onkeydown="$(this).css('border','none')">
        
                        <h2 class="blacklisth2">Blacklist:</h2>
                        <div class="selectbox1" onclick="blacklist(1)"><img src="./skdev/img/cancelar.png" draggable="false"></div>
                        <div class="selectbox2" onclick="blacklist(2)"><img src="./skdev/img/confirmar.png" draggable="false"></div>
        
                        <h2 class="blacklisthorash2">Blacklist Horas:</h2>
                        <input type="text" class="blacklisthorasinput" onkeydown="return ( event.ctrlKey || event.altKey 
                            || (47<event.keyCode && event.keyCode<58 && event.shiftKey==false) 
                            || (95<event.keyCode && event.keyCode<106)
                            || (event.keyCode==8) || (event.keyCode==9) 
                            || (event.keyCode>34 && event.keyCode<40) 
                            || (event.keyCode==46) )" onkeyup="$(this).css('border','none')">
        
                        <button class="botaocriar" onclick="criarOrganizacao()">
                            <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                            <h2>Criar Organização</h2>
                        </button>
                        <button class="botaocancelar" onclick="cancelarCriacao()">
                            <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                            <h2>Cancelar Criação</h2>
                        </button>
                    </div>
        
                    <div class="partedegrupos">
                        <h2 class="partedecargosh2">Parte de Cargos</h2>
                        <div class="barrapartedecargos"></div>
        
                        <button class="botaoadicionarcargo" onclick="adicionarCargo()">
                            <img src="./skdev/img/adicionar.png" class="adicionarcargoimg" draggable="false">
                            <h2>ADICIONAR CARGO</h2>
                        </button>
        
                        <div class="boxcargos">
                            <div class="cargodiv">
                                <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                                <h2 class="cargoh2">Supervisor Geral</h2>
        
                                <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                                    <img src="./skdev/img/clonar.png" draggable="false">
                                    <h2>Clonar Cargo</h2>
                                </button>
                                <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                                    <img src="./skdev/img/editar.png" draggable="false">
                                    <h2>Editar Cargo</h2>
                                </button>
                                <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                                    <img src="./skdev/img/excluir.png" draggable="false">
                                    <h2>Excluir Cargo</h2>
                                </button>
                            </div>
                            <div class="cargodiv">
                                <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                                <h2 class="cargoh2">Supervisor Geral</h2>
        
                                <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                                    <img src="./skdev/img/clonar.png" draggable="false">
                                    <h2>Clonar Cargo</h2>
                                </button>
                                <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                                    <img src="./skdev/img/editar.png" draggable="false">
                                    <h2>Editar Cargo</h2>
                                </button>
                                <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                                    <img src="./skdev/img/excluir.png" draggable="false">
                                    <h2>Excluir Cargo</h2>
                                </button>
                            </div>
                            <div class="cargodiv">
                                <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                                <h2 class="cargoh2">Supervisor Geral</h2>
        
                                <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                                    <img src="./skdev/img/clonar.png" draggable="false">
                                    <h2>Clonar Cargo</h2>
                                </button>
                                <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                                    <img src="./skdev/img/editar.png" draggable="false">
                                    <h2>Editar Cargo</h2>
                                </button>
                                <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                                    <img src="./skdev/img/excluir.png" draggable="false">
                                    <h2>Excluir Cargo</h2>
                                </button>
                            </div>
                            <div class="cargodiv">
                                <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                                <h2 class="cargoh2">Supervisor Geral</h2>
        
                                <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                                    <img src="./skdev/img/clonar.png" draggable="false">
                                    <h2>Clonar Cargo</h2>
                                </button>
                                <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                                    <img src="./skdev/img/editar.png" draggable="false">
                                    <h2>Editar Cargo</h2>
                                </button>
                                <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                                    <img src="./skdev/img/excluir.png" draggable="false">
                                    <h2>Excluir Cargo</h2>
                                </button>
                            </div>
                            <div class="cargodiv">
                                <img src="./skdev/img/cargo.png" class="cargoimg" draggable="false">
                                <h2 class="cargoh2">Supervisor Geral</h2>
        
                                <button class="clonarcargobotao" onclick="CargoAcaodeClonar(this)">
                                    <img src="./skdev/img/clonar.png" draggable="false">
                                    <h2>Clonar Cargo</h2>
                                </button>
                                <button class="editarcargobotao" onclick="CargoacaodeEditar(this)">
                                    <img src="./skdev/img/editar.png" draggable="false">
                                    <h2>Editar Cargo</h2>
                                </button>
                                <button class="excluircargobotao" onclick="CargoacaodeExcluir(this)">
                                    <img src="./skdev/img/excluir.png" draggable="false">
                                    <h2>Excluir Cargo</h2>
                                </button>
                            </div>
                        </div>
        
                    </div>
                </div>
                <!-- Final Criar Grupos -->
        
        
                <!-- Começo Gerenciar Grupos Staff -->
                <div class="gerenciargrupostaff">
                <h2 class="h2organizações">Organizações</h2>
                <div class="barrasepararorganizacoes"></div>
    
                <div class="logobolinhagerenciargrupostaff"><img src="./skdev/img/logo.png" draggable="false"></div>
    
                <div class="boxgrupos">
                    <div class="grupogerenciargrupobox">
                        <div class="bolinhalogogerenciargrupo">
                            <img src="https://lojabarddal.com.br/wp-content/uploads/2018/07/policia_federal_bordado.png" draggable="false">
                        </div>
    
                        <h2 class="h2gruponome">Policial Federal</h2>
                        <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('Policia Federal')">
                            <img src="./skdev/img/visualizar.png" draggable="false">
                            <h2>Visualizar Estatisticas</h2>
                        </button>
                        <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('Policia Federal')">
                            <img src="./skdev/img/editar.png" draggable="false">
                            <h2>Editar Organização</h2>
                        </button>
                    </div>
                    <div class="grupogerenciargrupobox">
                        <div class="bolinhalogogerenciargrupo">
                            <img src="https://lojabarddal.com.br/wp-content/uploads/2018/07/policia_federal_bordado.png" draggable="false">
                        </div>
    
                        <h2 class="h2gruponome">Policial Federal</h2>
                        <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('Policia Federal')">
                            <img src="./skdev/img/visualizar.png" draggable="false">
                            <h2>Visualizar Estatisticas</h2>
                        </button>
                        <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('Policia Federal')">
                            <img src="./skdev/img/editar.png" draggable="false">
                            <h2>Editar Organização</h2>
                        </button>
                    </div>
                    <div class="grupogerenciargrupobox">
                        <div class="bolinhalogogerenciargrupo">
                            <img src="https://lojabarddal.com.br/wp-content/uploads/2018/07/policia_federal_bordado.png" draggable="false">
                        </div>
    
                        <h2 class="h2gruponome">Policial Federal</h2>
                        <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('Policia Federal')">
                            <img src="./skdev/img/visualizar.png" draggable="false">
                            <h2>Visualizar Estatisticas</h2>
                        </button>
                        <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('Policia Federal')">
                            <img src="./skdev/img/editar.png" draggable="false">
                            <h2>Editar Organização</h2>
                        </button>
                    </div>
                    <div class="grupogerenciargrupobox">
                        <div class="bolinhalogogerenciargrupo">
                            <img src="https://lojabarddal.com.br/wp-content/uploads/2018/07/policia_federal_bordado.png" draggable="false">
                        </div>
    
                        <h2 class="h2gruponome">Policial Federal</h2>
                        <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('Policia Federal')">
                            <img src="./skdev/img/visualizar.png" draggable="false">
                            <h2>Visualizar Estatisticas</h2>
                        </button>
                        <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('Policia Federal')">
                            <img src="./skdev/img/editar.png" draggable="false">
                            <h2>Editar Organização</h2>
                        </button>
                    </div>
                    <div class="grupogerenciargrupobox">
                        <div class="bolinhalogogerenciargrupo">
                            <img src="https://lojabarddal.com.br/wp-content/uploads/2018/07/policia_federal_bordado.png" draggable="false">
                        </div>
    
                        <h2 class="h2gruponome">Policial Federal</h2>
                        <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('Policia Federal')">
                            <img src="./skdev/img/visualizar.png" draggable="false">
                            <h2>Visualizar Estatisticas</h2>
                        </button>
                        <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('Policia Federal')">
                            <img src="./skdev/img/editar.png" draggable="false">
                            <h2>Editar Organização</h2>
                        </button>
                    </div>
                    <div class="grupogerenciargrupobox">
                        <div class="bolinhalogogerenciargrupo">
                            <img src="https://lojabarddal.com.br/wp-content/uploads/2018/07/policia_federal_bordado.png" draggable="false">
                        </div>
    
                        <h2 class="h2gruponome">Policial Federal</h2>
                        <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('Policia Federal')">
                            <img src="./skdev/img/visualizar.png" draggable="false">
                            <h2>Visualizar Estatisticas</h2>
                        </button>
                        <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('Policia Federal')">
                            <img src="./skdev/img/editar.png" draggable="false">
                            <h2>Editar Organização</h2>
                        </button>
                    </div>
                    <div class="grupogerenciargrupobox">
                        <div class="bolinhalogogerenciargrupo">
                            <img src="https://lojabarddal.com.br/wp-content/uploads/2018/07/policia_federal_bordado.png" draggable="false">
                        </div>
    
                        <h2 class="h2gruponome">Policial Federal</h2>
                        <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('Policia Federal')">
                            <img src="./skdev/img/visualizar.png" draggable="false">
                            <h2>Visualizar Estatisticas</h2>
                        </button>
                        <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('Policia Federal')">
                            <img src="./skdev/img/editar.png" draggable="false">
                            <h2>Editar Organização</h2>
                        </button>
                    </div>
                    <div class="grupogerenciargrupobox">
                        <div class="bolinhalogogerenciargrupo">
                            <img src="https://lojabarddal.com.br/wp-content/uploads/2018/07/policia_federal_bordado.png" draggable="false">
                        </div>
    
                        <h2 class="h2gruponome">Policial Federal</h2>
                        <button class="visualizarestatisticagerenciargrupo" onclick="visualizarEstatisticas('Policia Federal')">
                            <img src="./skdev/img/visualizar.png" draggable="false">
                            <h2>Visualizar Estatisticas</h2>
                        </button>
                        <button class="editarorganizacaogerenciargrupo" onclick="editarOrganizacaoGrupo('Policia Federal')">
                            <img src="./skdev/img/editar.png" draggable="false">
                            <h2>Editar Organização</h2>
                        </button>
                    </div>
                </div>
            </div>
        
                <div class="estatisticasgrupo">
                    <img src="./skdev/img/setavoltar.png" class="setavoltar_estatisticas" draggable="false" onclick="voltarEstatistica()">
        
                    <div class="estatisticas_logobolinha">
                        <img src="https://i.pinimg.com/736x/69/27/95/692795bd1ce94265e2cb349793bca464.jpg" draggable="false">
                    </div>
        
                    <h2 class="estatisticas_nomeorgh2">Nome da Organização</h2>
                    <div class="estatisticas_nomeorgdiv">
                        <h2>Policia Federal</h2>
                    </div>
        
                    <div class="estatisticas_boxtotaldemembros">
                        <img src="./skdev/img/membrostotal.png" draggable="false">
                        <h2>Total de Membros</h2>
                        <h3>20</h3>
                    </div>
                    <div class="estatisticas_boxmembrosonline">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2>Membros Online</h2>
                        <h3>20</h3>
                    </div>
                    <div class="estatisticas_boxmembrosoffline">
                        <img src="./skdev/img/offline.png" draggable="false">
                        <h2>Membros Offline</h2>
                        <h3>20</h3>
                    </div>
        
                    <h2 class="estatisticas_cargosh2">Cargos</h2>
                    <div class="estatisticas_separarh2"></div>
        
                    <div class="estatisticas_boxcargos">
                        <div class="estatisticas_cargo">
                            <h2>Tenente Coronel</h2>
                            <img src="./skdev/img/cargo.png" draggable="false">
                        </div>
                        <div class="estatisticas_cargo">
                            <h2>Tenente Coronel</h2>
                            <img src="./skdev/img/cargo.png" draggable="false">
                        </div>
                        <div class="estatisticas_cargo">
                            <h2>Tenente Coronel</h2>
                            <img src="./skdev/img/cargo.png" draggable="false">
                        </div>
                        <div class="estatisticas_cargo">
                            <h2>Tenente Coronel</h2>
                            <img src="./skdev/img/cargo.png" draggable="false">
                        </div>
                        <div class="estatisticas_cargo">
                            <h2>Tenente Coronel</h2>
                            <img src="./skdev/img/cargo.png" draggable="false">
                        </div>
                        <div class="estatisticas_cargo">
                            <h2>Tenente Coronel</h2>
                            <img src="./skdev/img/cargo.png" draggable="false">
                        </div>
                    </div>
        
                    <h2 class="estatisticas_partedosmembroh2">Parte dos Membros</h2>
                    <div class="estatisticas_separadorpartedosmembro"></div>
        
                    <img src="./skdev/img/pesquisar.png" class="estatisticas_pesquisarmembroimg" draggable="false">
                    <input type="text" class="estatisticas_pesquisarmembro" oninput="pesquisar(this)"></input>
        
                    <button class="estatisticas_botaodeaaz" onclick="filtrodeaazestatisticasacao()">
                        <img src="./skdev/img/aaz.png" draggable="false">
                    </button>
                    
                    <div class="estatisticas_membrosbox">
 				<div class="estatisticas_membro">
					<img src="./skdev/img/membro.png" draggable="false">
					<h2 class="estatisticas_membro_id">38676</h2>
					<h2 class="estatisticas_membro_nome">Kevin Pietro Aparício</h2>
					<h2 class="estatisticas_membro_cargo">Lider</h2>
				</div>
				<div class="estatisticas_membro">
					<img src="./skdev/img/membro.png" draggable="false">
					<h2 class="estatisticas_membro_id">42262</h2>
					<h2 class="estatisticas_membro_nome">Lucas Benjamin Miguel Moura</h2>
					<h2 class="estatisticas_membro_cargo">Lider</h2>
				</div>
				<div class="estatisticas_membro">
					<img src="./skdev/img/membro.png" draggable="false">
					<h2 class="estatisticas_membro_id">48665</h2>
					<h2 class="estatisticas_membro_nome">Hugo Geraldo André Cardoso</h2>
					<h2 class="estatisticas_membro_cargo">membro</h2>
				</div>
				<div class="estatisticas_membro">
					<img src="./skdev/img/membro.png" draggable="false">
					<h2 class="estatisticas_membro_id">24770</h2>
					<h2 class="estatisticas_membro_nome">Edson Geraldo Sales</h2>
					<h2 class="estatisticas_membro_cargo">membro</h2>
				</div>
				<div class="estatisticas_membro">
					<img src="./skdev/img/membro.png" draggable="false">
					<h2 class="estatisticas_membro_id">27029</h2>
					<h2 class="estatisticas_membro_nome">Renan André Peixoto</h2>
					<h2 class="estatisticas_membro_cargo">membro</h2>
				</div>
				<div class="estatisticas_membro">
					<img src="./skdev/img/membro.png" draggable="false">
					<h2 class="estatisticas_membro_id">34684</h2>
					<h2 class="estatisticas_membro_nome">Enzo Arthur Farias</h2>
					<h2 class="estatisticas_membro_cargo">membro</h2>
				</div>
                    </div>
                </div>
                <!-- Final Gerenciar Grupos Staff -->
        
                <!-- Começo Gerenciar Staff -->
                <div class="gerenciarstaff">
                    <div class="gerenciarstaff_logobolinha"><img src="./skdev/img/perfil.png" draggable="false"></div>
        
                    <h2 class="gerenciarstaff_nomedaorg">Nome da Organização</h2>
                    <input type="text" value="Administração" class="gerenciarstaff_inputnomedaorg" disabled>
        
                    <div class="gerenciarstaff_membrostotais">
                        <img src="./skdev/img/membros.png" draggable="false">
                        <h2>Membros Totais: 22</h2>
                    </div>
                    <div class="gerenciarstaff_membrosonline">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2>Membros Online: 3</h2>
                    </div>
                    <div class="gerenciarstaff_membrosoffline">
                        <img src="./skdev/img/offline.png" draggable="false">
                        <h2>Membros Offline: 19</h2>
                    </div>
        
                    <button class="gerenciarstaff_botaoeditargrupodestaff" onclick="gerenciarStaffEditarGrupo()">
                        Editar Grupo de Staff
                        <img src="./skdev/img/editar.png" draggable="false">
                    </button>
        
                    <h2 class="gerenciarstaff_partedemembrosh2">Parte dos Membros</h2>
                    <div class="gerenciarstaff_barraseparacaopartedemembros"></div>
        
                    <img src="./skdev/img/pesquisar.png" class="gerenciarstaff_pesquisarimg" draggable="false">
                    <input type="text" class="gerenciarstaff_pesquisarmembroinput" oninput="gerenciarstaffinput()">
        
                    <button class="gerenciarstaff_botaodeaaz" onclick="AAZBotaogerenciarstaff()"><img src="./skdev/img/aaz.png" draggable="false"></button>
                    <button class="gerenciarstaff_botaoadicionarmembro" onclick="gerenciarstaffBotaoadicionarmembro()">
                        Adicionar Membro
                        <img src="./skdev/img/adicionar.png" draggable="false">
                    </button>
        
                    <div class="gerenciarstaff_boxmembros">
                        <div class="gerenciarstaff_membro">
                            <img src="./skdev/img/online.png" draggable="false">
                            <h2 class="gerenciarstaff_iddomembroh2">6775844</h2>
                            <h2 class="gerenciarstaff_nomedomembroh2">Mirella Daiane Assunção</h2>
                            <h2 class="gerenciarstaff_cargodomembroh2">Moderador Geral</h2>
        
                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                        </div>
                        <div class="gerenciarstaff_membro">
                            <img src="./skdev/img/online.png" draggable="false">
                            <h2 class="gerenciarstaff_iddomembroh2">6839786</h2>
                            <h2 class="gerenciarstaff_nomedomembroh2">Enrico Diego Lima</h2>
                            <h2 class="gerenciarstaff_cargodomembroh2">Staff Geral</h2>
        
                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                        </div>
                        <div class="gerenciarstaff_membro">
                            <img src="./skdev/img/online.png" draggable="false">
                            <h2 class="gerenciarstaff_iddomembroh2">1576320</h2>
                            <h2 class="gerenciarstaff_nomedomembroh2">Julio Sérgio Theo Rodrigues</h2>
                            <h2 class="gerenciarstaff_cargodomembroh2">Admin Geral</h2>
        
                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                        </div>
                        <div class="gerenciarstaff_membro">
                            <img src="./skdev/img/online.png" draggable="false">
                            <h2 class="gerenciarstaff_iddomembroh2">7285583</h2>
                            <h2 class="gerenciarstaff_nomedomembroh2">Adriana Fernanda Malu Gomes</h2>
                            <h2 class="gerenciarstaff_cargodomembroh2">Admin Geral</h2>
        
                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                        </div>
                        <div class="gerenciarstaff_membro">
                            <img src="./skdev/img/online.png" draggable="false">
                            <h2 class="gerenciarstaff_iddomembroh2">3402811</h2>
                            <h2 class="gerenciarstaff_nomedomembroh2">Noah Nathan Alves</h2>
                            <h2 class="gerenciarstaff_cargodomembroh2">Staff Geral</h2>
        
                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                        </div>
                        <div class="gerenciarstaff_membro">
                            <img src="./skdev/img/online.png" draggable="false">
                            <h2 class="gerenciarstaff_iddomembroh2">3148586</h2>
                            <h2 class="gerenciarstaff_nomedomembroh2">Lara Yasmin Marina Lima</h2>
                            <h2 class="gerenciarstaff_cargodomembroh2">Moderador Geral</h2>
        
                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                        </div>
                        <div class="gerenciarstaff_membro">
                            <img src="./skdev/img/online.png" draggable="false">
                            <h2 class="gerenciarstaff_iddomembroh2">7117361</h2>
                            <h2 class="gerenciarstaff_nomedomembroh2">Heitor Otávio da Mota</h2>
                            <h2 class="gerenciarstaff_cargodomembroh2">Suporte Geral</h2>
        
                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                        </div>
                    </div>
                </div>


                <div class="adicionarmembro">
                    <img src="./skdev/img/voltar.png" class="adicionarmembro_setavoltar" draggable="false">
        
                    <img src="./skdev/img/membro.png" class="adicionarmembro_membroimg" draggable="false">
        
                    <div class="adicionarmembro_logobolinha">
                        <img src="./skdev/img/logo.png" draggable="false">
                    </div>
        
                    <h2 class="adicionarmembro_adicionarcargonomembroh2">Adicionar Cargo no Membro</h2>
                    <h2 class="adicionarmembro_informariddomembroh2">Informe o Seguinte ID do Membro</h2>
                    <input type="text" class="adicionarmembro_inputiddomembro">
                    
                    <button class="adicionarmembro_botaoverificariddomembro">
                        Verificar
                        <img src="./skdev/img/confirmar.png" draggable="false">
                    </button>
                    
                    <h2 class="adicionarmembro_selecionarcargosdomembroh2">Selecione Abaixo os Cargos Que o Membro irá Receber</h2>
        
                    <img src="./skdev/img/seta.png" class="adicionarmembro_setaselectcargos" draggable="false">
                    <select class="adicionarmembro_selectselecaodecargos">
                        <option value="nada">Selecionar os cargos do player</option>
                        <option value="valor1">Suporte</option>
                        <option value="valor1">Administrador</option>
                        <option value="valor1">Moderador</option>
                    </select>
        
                    <div class="adicionarmembro_cargosselecionadosbox">
                        <div class="adicionarmembro_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="adicionarmembro_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="adicionarmembro_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="adicionarmembro_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="adicionarmembro_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="adicionarmembro_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="adicionarmembro_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="adicionarmembro_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                    </div>
        
                    <button class="adicionarmembro_confirmaradicaomembro">
                        Confirmar
                        <img src="./skdev/img/confirmar.png" draggable="false">
                    </button>
                </div>
                <!-- Final Gerenciar Staff -->
        
                <!-- Começo Gerenciar Painel Staff -->
        
                <div class="gerenciarpainelstaff">
                    <div class="gerenciarpainelstaff_logobolinha">
                        <img src="./skdev/img/logo.png" draggable="false">
                    </div>
        
                    <div class="gerenciarpainelstaff_fotodeperfil"><img src="./skdev/img/perfil.png" draggable="false"></div>
                    <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputusuarioimagenenviar" onchange="perfilusuarioImagenEnviar(event)">
                    <div class="gerenciarpainelstaff_boxnome">
                        <img src="./skdev/img/nome.png" draggable="false">
                        <h2>Erick Silva #1023032</h2>
                    </div>
                    <div class="gerenciarpainelstaff_boxgrupo">
                        <img src="./skdev/img/grupo.png" draggable="false">
                        <h2>Administração do servidor</h2>
                    </div>
                    <div class="gerenciarpainelstaff_boxcargo">
                        <img src="./skdev/img/cargo.png" draggable="false">
                        <h2>Supervisor Geral de Organizações</h2>
                    </div>
        
                    <button class="gerenciarpainelstaff_botaopaineladicionarmembros">
                        <h2>Painel Adicionar Membros</h2>
                        <img src="./skdev/img/adicionarmembro.png" draggable="false">
                    </button>
                    <button class="gerenciarpainelstaff_botaosalvaralteracoesdelog">
                        <h2>Salvar Alterações de Log</h2>
                        <img src="./skdev/img/salvar.png" draggable="false">
                    </button>
        
                    <h2 class="gerenciarpainelstaff_h2loggeral">Log Geral</h2>
                    <input type="text" class="gerenciarpainelstaff_inputloggeral">
                    <h2 class="gerenciarpainelstaff_h2criacaodeorg">Log Criação de Organização</h2>
                    <input type="text" class="gerenciarpainelstaff_inputcriacaodeorg">
                    <h2 class="gerenciarpainelstaff_h2membroremovidostaff">Log Removido Staff</h2>
                    <input type="text" class="gerenciarpainelstaff_inputmembroremovidostaff">
                    <h2 class="gerenciarpainelstaff_h2membrosupadosstaff">Log Membros upados staff</h2>
                    <input type="text" class="gerenciarpainelstaff_inputmembrosupadosstaff">
                    <h2 class="gerenciarpainelstaff_h2membrosrebaixadosstaff">Log Membros rebaixados staff</h2>
                    <input type="text" class="gerenciarpainelstaff_inputmembrosrebaixadosstaff">
                    <h2 class="gerenciarpainelstaff_h2membrosadicionadosstaff">Log Membros Adicionados staff</h2>
                    <input type="text" class="gerenciarpainelstaff_inputmembrosadicionadosstaff">
                </div>

                <div class="gerenciarcidadao">
                    <img src="./skdev/img/voltar.png" class="gerenciarcidadao_setavoltar" draggable="false" onclick="gerenciarCidadaoVoltar()">
        
                    <img src="./skdev/img/membro.png" class="gerenciarcidadao_membroimg" draggable="false">
        
                    <div class="gerenciarcidadao_logobolinha">
                        <img src="./skdev/img/logo.png" draggable="false">
                    </div>
        
                    <h2 class="gerenciarcidadao_adicionarcargonomembroh2">Gerenciar Cidadão</h2>
                    <h2 class="gerenciarcidadao_informariddomembroh2">Informe o Seguinte ID do Cidadao</h2>
                    <input type="text" class="gerenciarcidadao_inputiddomembro">
                    
                    <h2 class="gerenciarcidadao_selecionarcargosdomembroh2">Selecione abaixo a ação no seguinte membro</h2>
        
                    <img src="./skdev/img/seta.png" class="gerenciarcidadao_setaselectcargos" draggable="false">
                    <select class="gerenciarcidadao_selectselecaodecargos" onchange="SelecionarAcaodeGerenciarCidadao()">
                        <option>Selecionar a ação</option>
                        <option>Gerenciar Cargos</option>
                        <option>Adicionar Blacklist</option>
                        <option>Remover Blacklist</option>
                    </select>
        
                    <div class="gerenciarcidadao_cargosselecionadosbox">
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                        <div class="gerenciarcidadao_cargoselecionado">
                            <h2>Supervisor Geral</h2>
                            <img src="./skdev/img/apagar.png" draggable="false">
                        </div>
                    </div>
        
                    <h2 class="gerenciarcidadao_horasadicionarh2">Digite abaixo o total de horas para adicionar de blacklist</h2>
                    <input type="text" class="gerenciarcidadao_inputhorasadicionar">
        
                    <h2 class="gerenciarcidadao_horasdeblacklistdoplayerh2">Deseja remover a seguinte blacklist do player: 10/05/2023?</h2>
        
                    <button class="gerenciarcidadao_confirmaradicaomembro" onclick="ConfirmarGerenciamentodocidadao()">
                        Confirmar
                        <img src="./skdev/img/confirmar.png" draggable="false">
                    </button>
                </div>
        
                <!-- Final Gerenciar Painel Staff -->
                    `
                    $('.groups').html(resetadorhtml)
                    $('.box-perfil:nth-of-type(1) h2').html(data.nomeplayer)
                    $('.box-perfil:nth-of-type(2) h2').html(data.orgplayer)
                    $('.box-perfil:nth-of-type(3) h2').html(data.cargoplayer)
                    $('.bemvindopainel h2').html('Seja bem vindo, '+data.nomedoplayer2+'!')
                    $('.box-botaomenu').removeAttr('selecionadobox')
                    $('.box-botaomenu:nth-of-type(1)').attr('selecionadobox', '')
                    $('.groups').css('display', 'flex')
                    $('.fundopainel').css('display', 'flex')
                    $('.boxinformacao:nth-of-type(1) h2').html(`Ajudantes Online: ${data.ajudantesonline}`)
                    $('.boxinformacao:nth-of-type(2) h2').html(`Organizações: ${data.totaldeorgs}`)
                    $('.boxinformacao:nth-of-type(3) h2').html(`Cidadões Online: ${data.totaldecidadoesonline}`)

                    if (data.imagemplayer != undefined && data.imagemplayer.length > 0) {
                        $('.perfilimg').attr('src', data.imagemplayer)
                    }
                    if (data.UltimaLogstaff1 != undefined) {
                        $('.logdiv:nth-of-type(1) h2').html(`${data.UltimaLogstaff1}`)
                    }
                    if (data.UltimaLogstaff2 != undefined) {
                        $('.logdiv:nth-of-type(2) h2').html(`${data.UltimaLogstaff2}`)
                    }
                    if (data.UltimaLogstaff3 != undefined) {
                        $('.logdiv:nth-of-type(3) h2').html(`${data.UltimaLogstaff3}`)
                    }
                    $('.teladeloading').attr('desaparecer', '')
                    setTimeout(() => {
                        $('.teladeloading').removeAttr('desaparecer')
                        $('.teladeloading').css('display', 'none')
                    }, 800)
                }, 1000)
            }
        } else if (data.abrirpainel === 'PainelORG') {
            if ($('.groups').css('display') === 'none') {
                acoes = 'organizacao'

                let resetadorhtml = `
                <div class="barralateral">
                    <div class="perfilusuario">
                        <img src="./skdev/img/usuario-de-perfil.png" class="perfilimg" draggable="false">
                        <div class="box-perfil">
                            <img src="./skdev/img/nome.png" class="imgbox" draggable="false">
                            <h2>Erick Silva #100092</h2>
                        </div>
                        <div class="box-perfil">
                            <img src="./skdev/img/grupo.png" class="imgbox" draggable="false">
                            <h2>Organizacao</h2>
                        </div>
                        <div class="box-perfil">
                            <img src="./skdev/img/cargo.png" class="imgbox" draggable="false">
                            <h2>Membro</h2>
                        </div>
                    </div>
                    <div class="botoesmenu">
                        <div class="box-botaomenu" onclick="AlterarMenu('Inicio')">
                            <h2>Inicio</h2>
                            <img src="./skdev/img/inicio.png" class="img-boxmenu" draggable="false">
                        </div>
                        <div class="box-botaomenu" onclick="AlterarMenu('GerenciarStaff')">
                            <h2>Gerenciar Grupos</h2>
                            <img src="./skdev/img/gerenciar.png" class="img-boxmenu" draggable="false">
                        </div>
                        <div class="box-botaomenu" onclick="AlterarMenu('ConfigurarPainel')">
                            <h2>Configurar Painel</h2>
                            <img src="./skdev/img/configurar.png" class="img-boxmenu" draggable="false">
                        </div>
                    </div>
                </div>

            <!-- Começo Botão Inicio -->
            <div class="fundopainel">
                <div class="informacoespainel">
                    <div class="boxinformacao">
                        <img src="./skdev/img/membros.png" class="informacaoimg" draggable="false">
                        <h2>Ajudantes Online: 12</h2>
                    </div>
                    <div class="boxinformacao">
                        <img src="./skdev/img/organizacoes.png" class="informacaoimg" draggable="false">
                        <h2>Organizações: 20</h2>
                    </div>
                    <div class="boxinformacao">
                        <img src="./skdev/img/pessoas.png" class="informacaoimg" draggable="false">
                        <h2>Cidadões Online: 108</h2>
                    </div>
                    <div class="logobolinha">
                        <img src="./skdev/img/logo.png" class="logocidade" draggable="false">
                    </div>
                </div>
    
                <div class="bemvindopainel">
                    <h2>Seja bem-vindo, Erick Silva!</h2>
                    <h3>
                        Você está dentro do painel gerenciador de organizações<br>
                        Onde foi criado no intuito de ser um painel facilitador de vidas<br>
                        Nele você vai poder desde criar novos grupos<br>
                        Até configurar permissões de cargos<br>
                        Caso você receba uma permissão especial irá poder acessar<br>
                        Configurações de blacklist, Configuração de logs e mais!
                    </h3>
                    <img src="./skdev/img/personagem.png" class="personagembomvindo" draggable="false">
                </div>
    
                <h2 class="textologs">Ultimas ações da administração</h2>
                <div class="barraseparar"></div>
    
                <div class="logsbox">
                    <div class="logdiv">
                        <img src="./skdev/img/informacao.png" class="logdivimg" draggable="false">
                        <h2>Nenhuma log encontrada #1</h2>
                    </div>
                    <div class="logdiv">
                        <img src="./skdev/img/informacao.png" class="logdivimg" draggable="false">
                        <h2>Nenhuma log encontrada #2</h2>
                    </div>
                    <div class="logdiv">
                        <img src="./skdev/img/informacao.png" class="logdivimg" draggable="false">
                        <h2>Nenhuma log encontrada #3</h2>
                    </div>
                </div>
            </div>
            <!-- Final Botão Inicio -->

            <!-- Começo Criar Grupos -->
            <div class="painelcriargrupo">
                <div class="informacaogrupo">
                    <div class="fotogrupo" onclick="mudarFotoCriacao()">
                        <img src="./skdev/img/perfil-criar-grupo.png" class="imgfoto" draggable="false">
                    </div>
                    <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputfotogrupo" onchange="imagenEnviar(event)"/>

                    <h2 class="grupoh2">Nome da Organização:</h2>
                    <input type="text" class="textonomedaorg" onkeydown="$(this).css('border','none')">

                    <button class="botaocriar" onclick="criarOrganizacao()">
                        <img src="./skdev/img/criar.png" class="criarimg" draggable="false">
                        <h2>Criar Organização</h2>
                    </button>
                    <button class="botaocancelar" onclick="cancelarCriacao()">
                        <img src="./skdev/img/cancelarcriacao.png" class="cancelarimg" draggable="false">
                        <h2>Cancelar Criação</h2>
                    </button>
                </div>
            </div>
        <!-- Final Criar Grupos -->
    
            <!-- Começo Gerenciar Staff -->
            <div class="gerenciarstaff">
                <div class="gerenciarstaff_logobolinha"><img src="./skdev/img/perfil.png" draggable="false"></div>

                <h2 class="gerenciarstaff_nomedaorg">Nome da Organização</h2>
                <input type="text" value="Administração" class="gerenciarstaff_inputnomedaorg" disabled>

                <div class="gerenciarstaff_membrostotais">
                    <img src="./skdev/img/membros.png" draggable="false">
                    <h2>Membros Totais: 22</h2>
                </div>
                <div class="gerenciarstaff_membrosonline">
                    <img src="./skdev/img/online.png" draggable="false">
                    <h2>Membros Online: 3</h2>
                </div>
                <div class="gerenciarstaff_membrosoffline">
                    <img src="./skdev/img/offline.png" draggable="false">
                    <h2>Membros Offline: 19</h2>
                </div>

                <button class="gerenciarstaff_botaoeditargrupodestaff" onclick="gerenciarStaffEditarGrupo()">
                    Editar Grupo de Staff
                    <img src="./skdev/img/editar.png" draggable="false">
                </button>

                <h2 class="gerenciarstaff_partedemembrosh2">Parte dos Membros</h2>
                <div class="gerenciarstaff_barraseparacaopartedemembros"></div>

                <img src="./skdev/img/pesquisar.png" class="gerenciarstaff_pesquisarimg" draggable="false">
                <input type="text" class="gerenciarstaff_pesquisarmembroinput" oninput="gerenciarstaffinput()">

                <button class="gerenciarstaff_botaodeaaz" onclick="AAZBotaogerenciarstaff()"><img src="./skdev/img/aaz.png" draggable="false"></button>
                <button class="gerenciarstaff_botaoadicionarmembro" onclick="gerenciarstaffBotaoadicionarmembro()">
                    Adicionar Membro
                    <img src="./skdev/img/adicionar.png" draggable="false">
                </button>

                <div class="gerenciarstaff_boxmembros">
                    <div class="gerenciarstaff_membro">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2 class="gerenciarstaff_iddomembroh2">6775844</h2>
                        <h2 class="gerenciarstaff_nomedomembroh2">Mirella Daiane Assunção</h2>
                        <h2 class="gerenciarstaff_cargodomembroh2">Moderador Geral</h2>

                        <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                    </div>
                    <div class="gerenciarstaff_membro">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2 class="gerenciarstaff_iddomembroh2">6839786</h2>
                        <h2 class="gerenciarstaff_nomedomembroh2">Enrico Diego Lima</h2>
                        <h2 class="gerenciarstaff_cargodomembroh2">Staff Geral</h2>

                        <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                    </div>
                    <div class="gerenciarstaff_membro">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2 class="gerenciarstaff_iddomembroh2">1576320</h2>
                        <h2 class="gerenciarstaff_nomedomembroh2">Julio Sérgio Theo Rodrigues</h2>
                        <h2 class="gerenciarstaff_cargodomembroh2">Admin Geral</h2>

                        <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                    </div>
                    <div class="gerenciarstaff_membro">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2 class="gerenciarstaff_iddomembroh2">7285583</h2>
                        <h2 class="gerenciarstaff_nomedomembroh2">Adriana Fernanda Malu Gomes</h2>
                        <h2 class="gerenciarstaff_cargodomembroh2">Admin Geral</h2>

                        <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                    </div>
                    <div class="gerenciarstaff_membro">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2 class="gerenciarstaff_iddomembroh2">3402811</h2>
                        <h2 class="gerenciarstaff_nomedomembroh2">Noah Nathan Alves</h2>
                        <h2 class="gerenciarstaff_cargodomembroh2">Staff Geral</h2>

                        <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                    </div>
                    <div class="gerenciarstaff_membro">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2 class="gerenciarstaff_iddomembroh2">3148586</h2>
                        <h2 class="gerenciarstaff_nomedomembroh2">Lara Yasmin Marina Lima</h2>
                        <h2 class="gerenciarstaff_cargodomembroh2">Moderador Geral</h2>

                        <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                    </div>
                    <div class="gerenciarstaff_membro">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2 class="gerenciarstaff_iddomembroh2">7117361</h2>
                        <h2 class="gerenciarstaff_nomedomembroh2">Heitor Otávio da Mota</h2>
                        <h2 class="gerenciarstaff_cargodomembroh2">Suporte Geral</h2>

                        <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                        <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                    </div>
                </div>
		    </div>

            <div class="adicionarmembro">
                <img src="./skdev/img/voltar.png" class="adicionarmembro_setavoltar" draggable="false">
    
                <img src="./skdev/img/membro.png" class="adicionarmembro_membroimg" draggable="false">
    
                <div class="adicionarmembro_logobolinha">
                    <img src="./skdev/img/logo.png" draggable="false">
                </div>
    
                <h2 class="adicionarmembro_adicionarcargonomembroh2">Adicionar Cargo no Membro</h2>
                <h2 class="adicionarmembro_informariddomembroh2">Informe o Seguinte ID do Membro</h2>
                <input type="text" class="adicionarmembro_inputiddomembro">
                
                <button class="adicionarmembro_botaoverificariddomembro">
                    Verificar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
                
                <h2 class="adicionarmembro_selecionarcargosdomembroh2">Selecione Abaixo os Cargos Que o Membro irá Receber</h2>
    
                <img src="./skdev/img/seta.png" class="adicionarmembro_setaselectcargos" draggable="false">
                <select class="adicionarmembro_selectselecaodecargos">
                    <option value="nada">Selecionar os cargos do player</option>
                    <option value="valor1">Suporte</option>
                    <option value="valor1">Administrador</option>
                    <option value="valor1">Moderador</option>
                </select>
    
                <div class="adicionarmembro_cargosselecionadosbox">
                    <div class="adicionarmembro_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="adicionarmembro_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="adicionarmembro_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="adicionarmembro_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="adicionarmembro_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="adicionarmembro_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="adicionarmembro_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="adicionarmembro_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                </div>
    
                <button class="adicionarmembro_confirmaradicaomembro">
                    Confirmar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
            </div>
            <!-- Final Gerenciar Staff -->


            <!-- Começo Gerenciar Painel Org -->
    
            <div class="gerenciarpainelstaff">
                <div class="gerenciarpainelstaff_logobolinha">
                    <img src="./skdev/img/logo.png" draggable="false">
                </div>
    
                <div class="gerenciarpainelstaff_fotodeperfil"><img src="./skdev/img/perfil.png" draggable="false"></div>
                <input type="file" accept="image/jpeg, image/png, image/jpg" class="inputusuarioimagenenviar" onchange="perfilusuarioImagenEnviar(event)">
                <div class="gerenciarpainelstaff_boxnome">
                    <img src="./skdev/img/nome.png" draggable="false">
                    <h2>Erick Silva #1023032</h2>
                </div>
                <div class="gerenciarpainelstaff_boxgrupo">
                    <img src="./skdev/img/grupo.png" draggable="false">
                    <h2>Administração do servidor</h2>
                </div>
                <div class="gerenciarpainelstaff_boxcargo">
                    <img src="./skdev/img/cargo.png" draggable="false">
                    <h2>Supervisor Geral de Organizações</h2>
                </div>
    
                <button class="gerenciarpainelstaff_botaopaineladicionarmembros">
                    <h2>Painel Adicionar Membros</h2>
                    <img src="./skdev/img/adicionarmembro.png" draggable="false">
                </button>
                <button class="gerenciarpainelstaff_botaosalvaralteracoesdelog">
                    <h2>Salvar Alterações de Log</h2>
                    <img src="./skdev/img/salvar.png" draggable="false">
                </button>
    
                <h2 class="gerenciarpainelstaff_h2loggeral">Log Geral</h2>
                <input type="text" class="gerenciarpainelstaff_inputloggeral">
                <h2 class="gerenciarpainelstaff_h2criacaodeorg">Log Criação de Organização</h2>
                <input type="text" class="gerenciarpainelstaff_inputcriacaodeorg">
                <h2 class="gerenciarpainelstaff_h2membroremovidostaff">Log Removido Staff</h2>
                <input type="text" class="gerenciarpainelstaff_inputmembroremovidostaff">
                <h2 class="gerenciarpainelstaff_h2membrosupadosstaff">Log Membros upados staff</h2>
                <input type="text" class="gerenciarpainelstaff_inputmembrosupadosstaff">
                <h2 class="gerenciarpainelstaff_h2membrosrebaixadosstaff">Log Membros rebaixados staff</h2>
                <input type="text" class="gerenciarpainelstaff_inputmembrosrebaixadosstaff">
                <h2 class="gerenciarpainelstaff_h2membrosadicionadosstaff">Log Membros Adicionados staff</h2>
                <input type="text" class="gerenciarpainelstaff_inputmembrosadicionadosstaff">
            </div>

            <div class="gerenciarcidadao">
                <img src="./skdev/img/voltar.png" class="gerenciarcidadao_setavoltar" draggable="false" onclick="gerenciarCidadaoVoltar()">

                <img src="./skdev/img/membro.png" class="gerenciarcidadao_membroimg" draggable="false">

                <div class="gerenciarcidadao_logobolinha">
                    <img src="./skdev/img/logo.png" draggable="false">
                </div>

                <h2 class="gerenciarcidadao_adicionarcargonomembroh2">Gerenciar Cidadão</h2>
                <h2 class="gerenciarcidadao_informariddomembroh2">Informe o Seguinte ID do Cidadao</h2>
                <input type="text" class="gerenciarcidadao_inputiddomembro">
                
                <h2 class="gerenciarcidadao_selecionarcargosdomembroh2">Selecione abaixo a ação no seguinte membro</h2>

                <img src="./skdev/img/seta.png" class="gerenciarcidadao_setaselectcargos" draggable="false">
                <select class="gerenciarcidadao_selectselecaodecargos" onchange="SelecionarAcaodeGerenciarCidadao()">
                    <option>Selecionar a ação</option>
                    <option>Gerenciar Cargos</option>
                    <option>Adicionar Blacklist</option>
                    <option>Remover Blacklist</option>
                </select>

                <div class="gerenciarcidadao_cargosselecionadosbox">
                    <div class="gerenciarcidadao_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="gerenciarcidadao_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="gerenciarcidadao_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="gerenciarcidadao_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="gerenciarcidadao_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="gerenciarcidadao_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="gerenciarcidadao_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                    <div class="gerenciarcidadao_cargoselecionado">
                        <h2>Supervisor Geral</h2>
                        <img src="./skdev/img/apagar.png" draggable="false">
                    </div>
                </div>

                <h2 class="gerenciarcidadao_horasadicionarh2">Digite abaixo o total de horas para adicionar de blacklist</h2>
                <input type="text" class="gerenciarcidadao_inputhorasadicionar">

                <h2 class="gerenciarcidadao_horasdeblacklistdoplayerh2">Deseja remover a seguinte blacklist do player: 10/05/2023?</h2>

                <button class="gerenciarcidadao_confirmaradicaomembro" onclick="ConfirmarGerenciamentodocidadao()">
                    Confirmar
                    <img src="./skdev/img/confirmar.png" draggable="false">
                </button>
		    </div>
    
            <!-- Final Gerenciar Painel Staff -->
                `
                $('.groups').html(resetadorhtml)
                $('.teladeloading').css('display', 'flex')
                setTimeout(() => {
                    var texto = `Você está dentro do painel de organizações<br>que no qual foi criado pensando em agilizar a etapa<br>de você gerenciar sua organização sendo assim agilizando<br>etapas que poderiam demorar horas de espera<br>nesse painel você poderá upar, rebaixar, expulsar, adicionar<br>sendo uma etapa muito interativa com você e seus membros!`
                    $('.bemvindopainel h3').html(texto)
                    let htmlgrupo = `
                    <div class="box-botaomenu" onclick="AlterarMenu('Inicio','${data.orgplayer}')">
                        <h2>Inicio</h2>
                        <img src="./skdev/img/inicio.png" class="img-boxmenu" draggable="false">
				    </div>
                    <div class="box-botaomenu" onclick="AlterarMenu('GerenciarStaff','${data.orgplayer}')">
                        <h2>Gerenciar Grupo</h2>
                        <img src="./skdev/img/gerenciar.png" class="img-boxmenu" draggable="false">
                    </div>
                    <div class="box-botaomenu" onclick="AlterarMenu('ConfigurarPainel','${data.orgplayer}')">
                        <h2>Configurar Painel</h2>
                        <img src="./skdev/img/configurar.png" class="img-boxmenu" draggable="false">
                    </div>
                    `
                    $('.botoesmenu').html(htmlgrupo)
                    $('.textologs').html(`Ultimas ações dos seus membros`)
                    $('.box-perfil:nth-of-type(1) h2').html(data.nomeplayer)
                    $('.box-perfil:nth-of-type(2) h2').html(data.orgplayer)
                    $('.box-perfil:nth-of-type(3) h2').html(data.cargoplayer)
                    $('.bemvindopainel h2').html('Seja bem vindo, '+data.nomeplayer2+'!')
                    $('.box-botaomenu').removeAttr('selecionadobox')
                    $('.box-botaomenu:nth-of-type(1)').attr('selecionadobox', '')
                    $('.groups').css('display', 'flex')
                    $('.fundopainel').css('display', 'flex')
                    $('.boxinformacao:nth-of-type(1) img').attr('src', './skdev/img/membros.png')
                    $('.boxinformacao:nth-of-type(2) img').attr('src', './skdev/img/membrostotal.png')
                    $('.boxinformacao:nth-of-type(3) img').attr('src', './skdev/img/pessoas.png')
                    $('.boxinformacao:nth-of-type(1) h2').html(`Membros totais: ${data.membrostotais}`)
                    $('.boxinformacao:nth-of-type(2) h2').html(`Membros online: ${data.membrosonline}`)
                    $('.boxinformacao:nth-of-type(3) h2').html(`Membros offline: ${data.membrosoffline}`)

                    if (data.imagemplayer) {
                        $('.perfilimg').attr('src', data.imagemplayer)
                    }
                    if (data.Ultimalogorganizacao1) {
                        $('.logdiv:nth-of-type(1) h2').html(`${data.Ultimalogorganizacao1}`)
                    }
                    if (data.Ultimalogorganizacao2) {
                        $('.logdiv:nth-of-type(2) h2').html(`${data.Ultimalogorganizacao2}`)
                    }
                    if (data.Ultimalogorganizacao3) {
                        $('.logdiv:nth-of-type(3) h2').html(`${data.Ultimalogorganizacao3}`)
                    }
                    $('.teladeloading').attr('desaparecer', '')
                    setTimeout(() => {
                        $('.teladeloading').removeAttr('desaparecer')
                        $('.teladeloading').css('display', 'none')
                    }, 800)
                }, 1000)
            }
        }
    }

    if (data.updates != undefined) {
        if (data.updates == 'MembrosStaff') {
            $('.teladeloading').css('display', 'flex')
            setTimeout(() => {
                $('.fundopainel').css('display', 'none')
                $('.adicionarcargo').css('display', 'none')
                $('.selecionarcriarouexistente').css('display', 'none')
                $('.painelcriargrupo').css('display', 'none')
                $('.estatisticasgrupo').css('display', 'none')
                $('.gerenciargrupostaff').css('display', 'none')
                $('.gerenciarstaff').css('display', 'none')
                $('.adicionarmembro').css('display', 'none')
                $('.gerenciarpainelstaff').css('display', 'none')
                $('.gerenciarcidadao').css('display', 'none')

                $.post(`http://${GetParentResourceName()}/staffreceberInformacoes`, JSON.stringify({}), (data) => {
                    let imagemstaff = ''
                    if (data.imagemorgstaff.length > 0) {
                        imagemstaff = data.imagemorgstaff
                    } else {
                        imagemstaff = './skdev/img/perfil.png'
                    }

                    let html = `
                            <div class="gerenciarstaff_logobolinha"><img src="${imagemstaff}" draggable="false"></div>
                
                            <h2 class="gerenciarstaff_nomedaorg">Nome da Organização</h2>
                            <input type="text" value="${data.nomeorgstaff}" class="gerenciarstaff_inputnomedaorg" disabled>
                
                            <div class="gerenciarstaff_membrostotais">
                                <img src="./skdev/img/membros.png" draggable="false">
                                <h2>Membros Totais: ${data.membrostotaisstaff}</h2>
                            </div>
                            <div class="gerenciarstaff_membrosonline">
                                <img src="./skdev/img/online.png" draggable="false">
                                <h2>Membros Online: ${data.membrosonlinestaff}</h2>
                            </div>
                            <div class="gerenciarstaff_membrosoffline">
                                <img src="./skdev/img/offline.png" draggable="false">
                                <h2>Membros Offline: ${data.membrosofflinestaff}</h2>
                            </div>
                
                            <button class="gerenciarstaff_botaoeditargrupodestaff" onclick="gerenciarStaffEditarGrupoStaff()">
                                Editar Grupo de Staff
                                <img src="./skdev/img/editar.png" draggable="false">
                            </button>
                
                            <h2 class="gerenciarstaff_partedemembrosh2">Parte dos Membros</h2>
                            <div class="gerenciarstaff_barraseparacaopartedemembros"></div>
                
                            <img src="./skdev/img/pesquisar.png" class="gerenciarstaff_pesquisarimg" draggable="false">
                            <input type="text" class="gerenciarstaff_pesquisarmembroinput" oninput="pesquisarMembrosOrgPropia()">
                
                            <button class="gerenciarstaff_botaodeaaz" onclick="AAZBotaoorgpropia()"><img src="./skdev/img/aaz.png" draggable="false"></button>
                            <button class="gerenciarstaff_botaoadicionarmembro" onclick="gerenciarstaffBotaoadicionarmembro()">
                                Adicionar Membro
                                <img src="./skdev/img/adicionar.png" draggable="false">
                            </button>
                
                            <div class="gerenciarstaff_boxmembros">
                                <div class="gerenciarstaff_membro">
                                    <img src="./skdev/img/online.png" draggable="false">
                                    <h2 class="gerenciarstaff_iddomembroh2">1000234</h2>
                                    <h2 class="gerenciarstaff_nomedomembroh2">Guilherme da Cunha</h2>
                                    <h2 class="gerenciarstaff_cargodomembroh2">Supervisor Geral</h2>
                
                                    <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                                    <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                    <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                </div>
                            </div>
                            `

                    $('.gerenciarstaff').html(html)
                    $('.gerenciarstaff_boxmembros').html('')

                    let membrosOrgPropia = data.membrosorgpropia
                    if (membrosOrgPropia != undefined) {
                        membrosOrgPropia.forEach((texto, index) => {
                            if (texto.status === 'online') {
                                let appendMembroGerenciarStaff = `
                                        <div class="gerenciarstaff_membro">
                                            <img src="./skdev/img/online.png" draggable="false">
                                            <h2 class="gerenciarstaff_iddomembroh2">${texto.iddomembro}</h2>
                                            <h2 class="gerenciarstaff_nomedomembroh2">${texto.nomedomembro}</h2>
                                            <h2 class="gerenciarstaff_cargodomembroh2">${texto.cargodomembro}</h2>
                        
                                            <div class="gerenciarstaff_boxupar" onclick="gerenciarStaffUpar(${texto.iddomembro})"><img src="./skdev/img/upar.png" draggable="false"></div>
                                            <div class="gerenciarstaff_boxrebaixar" onclick="gerenciarStaffRebaixar(${texto.iddomembro})"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                            <div class="gerenciarstaff_boxremover" onclick="gerenciarStaffRemover(${texto.iddomembro})"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                        </div>
                                        `
                                $('.gerenciarstaff_boxmembros').append(appendMembroGerenciarStaff)
                            }
                            if (texto.status === 'offline') {
                                let appendMembroGerenciarStaff = `
                                        <div class="gerenciarstaff_membro">
                                            <img src="./skdev/img/offline.png" draggable="false">
                                            <h2 class="gerenciarstaff_iddomembroh2">${texto.iddomembro}</h2>
                                            <h2 class="gerenciarstaff_nomedomembroh2">${texto.nomedomembro}</h2>
                                            <h2 class="gerenciarstaff_cargodomembroh2">${texto.cargodomembro}</h2>
                        
                                            <div class="gerenciarstaff_boxupar" onclick="gerenciarStaffUpar(${texto.iddomembro})"><img src="./skdev/img/upar.png" draggable="false"></div>
                                            <div class="gerenciarstaff_boxrebaixar" onclick="gerenciarStaffRebaixar(${texto.iddomembro})"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                            <div class="gerenciarstaff_boxremover" onclick="gerenciarStaffRemover(${texto.iddomembro})"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                        </div>
                                        `
                                $('.gerenciarstaff_boxmembros').append(appendMembroGerenciarStaff)
                            }
                        })
                    }

                    $('.box-botaomenu').removeAttr('selecionadobox')
                    $('.box-botaomenu:nth-of-type(4)').attr('selecionadobox', '')
                    $('.gerenciarstaff').css('display', 'flex')
                })


                $('.teladeloading').attr('desaparecer', '')
                setTimeout(() => {
                    $('.teladeloading').removeAttr('desaparecer')
                    $('.teladeloading').css('display', 'none')
                }, 800)
            }, 1000)
        }
        if (data.updates == 'MembrosOrgPropia') {
            $('.teladeloading').css('display', 'flex')
            setTimeout(() => {
                $('.fundopainel').css('display', 'none')
                $('.adicionarcargo').css('display', 'none')
                $('.selecionarcriarouexistente').css('display', 'none')
                $('.painelcriargrupo').css('display', 'none')
                $('.estatisticasgrupo').css('display', 'none')
                $('.gerenciargrupostaff').css('display', 'none')
                $('.gerenciarstaff').css('display', 'none')
                $('.adicionarmembro').css('display', 'none')
                $('.gerenciarpainelstaff').css('display', 'none')
                $('.gerenciarcidadao').css('display', 'none')

                $.post(`http://${GetParentResourceName()}/grupopropioreceberInformacoes`, JSON.stringify({}), (data) => {
                    let imagemorg = ''
                    if (data.imagemorgpropia.length > 0) {
                        imagemorg = data.imagemorgpropia
                    } else {
                        imagemorg = './skdev/img/perfil.png'
                    }

                    let html = `
                    <div class="gerenciarstaff_logobolinha"><img src="${imagemorg}" draggable="false"></div>
        
                    <h2 class="gerenciarstaff_nomedaorg">Nome da Organização</h2>
                    <input type="text" value="${data.nomeorgpropia}" class="gerenciarstaff_inputnomedaorg" disabled>
        
                    <div class="gerenciarstaff_membrostotais">
                        <img src="./skdev/img/membros.png" draggable="false">
                        <h2>Membros Totais: ${data.membrostotaisorgpropia}</h2>
                    </div>
                    <div class="gerenciarstaff_membrosonline">
                        <img src="./skdev/img/online.png" draggable="false">
                        <h2>Membros Online: ${data.membrosonlineorgpropia}</h2>
                    </div>
                    <div class="gerenciarstaff_membrosoffline">
                        <img src="./skdev/img/offline.png" draggable="false">
                        <h2>Membros Offline: ${data.membrosofflineorgpropia}</h2>
                    </div>
        
                    <button class="gerenciarstaff_botaoeditargrupodestaff" onclick="gerenciarOrgpropiaEditarGrupo()">
                        Editar Grupo Propio
                        <img src="./skdev/img/editar.png" draggable="false">
                    </button>
        
                    <h2 class="gerenciarstaff_partedemembrosh2">Parte dos Membros</h2>
                    <div class="gerenciarstaff_barraseparacaopartedemembros"></div>
        
                    <img src="./skdev/img/pesquisar.png" class="gerenciarstaff_pesquisarimg" draggable="false">
                    <input type="text" class="gerenciarstaff_pesquisarmembroinput" oninput="pesquisarMembrosOrgPropia()">
        
                    <button class="gerenciarstaff_botaodeaaz" onclick="AAZBotaoorgpropia()"><img src="./skdev/img/aaz.png" draggable="false"></button>
                    <button class="gerenciarstaff_botaoadicionarmembro" onclick="gerenciarorgpropiaBotaoadicionarmembro()">
                        Adicionar Membro
                        <img src="./skdev/img/adicionar.png" draggable="false">
                    </button>
        
                    <div class="gerenciarstaff_boxmembros">
                        <div class="gerenciarstaff_membro">
                            <img src="./skdev/img/online.png" draggable="false">
                            <h2 class="gerenciarstaff_iddomembroh2">1000234</h2>
                            <h2 class="gerenciarstaff_nomedomembroh2">Guilherme da Cunha</h2>
                            <h2 class="gerenciarstaff_cargodomembroh2">Supervisor Geral</h2>
        
                            <div class="gerenciarstaff_boxupar"><img src="./skdev/img/upar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxrebaixar"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                            <div class="gerenciarstaff_boxremover"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                        </div>
                    </div>
                    `

                    $('.gerenciarstaff').html(html)
                    $('.gerenciarstaff_boxmembros').html('')

                    let membrosOrgPropia = data.membrosorgpropia
                    if (membrosOrgPropia != undefined) {
                        membrosOrgPropia.forEach((texto, index) => {
                            if (texto.status === 'online') {
                                let appendMembroGerenciarOrgPropia = `
                                <div class="gerenciarstaff_membro">
                                    <img src="./skdev/img/online.png" draggable="false">
                                    <h2 class="gerenciarstaff_iddomembroh2">${texto.iddomembro}</h2>
                                    <h2 class="gerenciarstaff_nomedomembroh2">${texto.nomedomembro}</h2>
                                    <h2 class="gerenciarstaff_cargodomembroh2">${texto.cargodomembro}</h2>
                
                                    <div class="gerenciarstaff_boxupar" onclick="gerenciarGrupoPropioUpar('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/upar.png" draggable="false"></div>
                                    <div class="gerenciarstaff_boxrebaixar" onclick="gerenciarGrupoPropioRebaixar('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                    <div class="gerenciarstaff_boxremover" onclick="gerenciarGrupoPropioRemover'${data.nomeorgpropia}',texto.iddomembro})"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                </div>
                                `
                                $('.gerenciarstaff_boxmembros').append(appendMembroGerenciarOrgPropia)
                            }
                            if (texto.status === 'offline') {
                                let appendMembroGerenciarOrgPropia = `
                                <div class="gerenciarstaff_membro">
                                    <img src="./skdev/img/offline.png" draggable="false">
                                    <h2 class="gerenciarstaff_iddomembroh2">${texto.iddomembro}</h2>
                                    <h2 class="gerenciarstaff_nomedomembroh2">${texto.nomedomembro}</h2>
                                    <h2 class="gerenciarstaff_cargodomembroh2">${texto.cargodomembro}</h2>
                
                                    <div class="gerenciarstaff_boxupar" onclick="gerenciarGrupoPropioUpar('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/upar.png" draggable="false"></div>
                                    <div class="gerenciarstaff_boxrebaixar" onclick="gerenciarGrupoPropioRebaixar('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/rebaixar.png" draggable="false"></div>
                                    <div class="gerenciarstaff_boxremover" onclick="gerenciarGrupoPropioRemover('${data.nomeorgpropia}',${texto.iddomembro})"><img src="./skdev/img/expulsar.png" draggable="false"></div>
                                </div>
                                `
                                $('.gerenciarstaff_boxmembros').append(appendMembroGerenciarOrgPropia)
                            }
                        })
                    }

                    $('.box-botaomenu').removeAttr('selecionadobox')
                    $('.box-botaomenu:nth-of-type(2)').attr('selecionadobox', '')
                    $('.gerenciarstaff').css('display', 'flex')
                })

                $('.teladeloading').attr('desaparecer', '')
                setTimeout(() => {
                    $('.teladeloading').removeAttr('desaparecer')
                    $('.teladeloading').css('display', 'none')
                }, 800)
            }, 1000)
        }
    }

    if (data.fecharpainel != undefined) {
        if (data.fecharpainel) {
            if ($('.groups').css('display') === 'flex') {
                $('.groups').attr('desaparecer', '')
                setTimeout(() => {
                    $('.groups').removeAttr('desaparecer')
                    $('.groups').css('display', 'none')
                }, 800)

                $.post(`http://${GetParentResourceName()}/fecharpainel`)
            }
        }
    }
})