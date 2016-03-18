DROP TABLE vwestatisticasmanifestacao;
DROP TABLE vwultimotramite;


INSERT INTO TbPreferenciaSistema
    (idPreferenciaSistema, nomeOuvidoria, emailOuvidoria, hostEmail, portaEmail, usuarioEmail,
    senhaEmail, sslEmail, encerrarTramiteEncaminhada, retornarTramiteOuvidoria, ctlPrazoManifSoluc,
    RespostasImediatas, prazoEntrada, prazoAreaSolucionadora, prazoRespostaCidadao)
VALUES
    (1, 'Ouvidoria MinC', 'naoresponda.ouvidoria@cultura.gov.br', '10.0.0.54', 25, 'ouvidoria@cultura.gov.br',
    '', '2', '1', '1', '1',
    '1', 1, 28, 1);



INSERT INTO tbparametro (idParametro, nmparametro, vlrparametro) VALUES (1, 'Sequencial da Manifestação', '1');
INSERT INTO tbparametro (idParametro, nmparametro, vlrparametro) VALUES (2, 'Ano atual', '2015');
INSERT INTO tbparametro (idParametro, nmparametro, vlrparametro) VALUES (3, 'Diretório para onde serão enviados os arquivos anexados', '/var/arquivos/');
INSERT INTO tbparametro (idParametro, nmparametro, vlrparametro) VALUES (4, 'URL base do Sistema', 'http://localhost:8080/GOG');
INSERT INTO tbparametro (idParametro, nmparametro, vlrparametro) VALUES (5, 'Email do Monitoramento', 'email@email.com');
INSERT INTO tbparametro (idParametro, nmparametro, vlrparametro) VALUES (6, 'Caminho do arquivo de propriedades de publicação dos arquivos de relatórios', '/var/arquivos/arquivos-ouvidoria/publicacaoArquivo.xml');


ALTER SEQUENCE tbparametro_idparametro_seq RESTART WITH 7;
