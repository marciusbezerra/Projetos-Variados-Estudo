/*
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 \ Empresa.: MCB SISTEMAS
 \ Programa: ORF_ATRI.PRG
 \ Data....: 03-11-06
 \ Sistema.: ORCAMENTO DE FINAIS DE SEMANA
 \ Funcao..: Define atributos dos arquivos (sistema[])
 \ Analista: MARCIUS C. BEZERRA
 \ Criacao.: GAS-Pro v4.0o
 \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
*/
#include "orfin.ch"     // inicializa constantes manifestas


/*
   A adicao das  definicoes dos campos (mascara, titulo, cmd esp, when/defa,
   critica, ajuda) dentro do vetor sistema e' feita atraves da funcao AADD(),
   isto previne erro "memory overbooked" do CA-Clipper, durante a compilacao,
   devido a linha ser muito extensa
*/

sistema[001]={;
            "Categorias de produtos",;                      // opcao do menu
            "Categorias de produtos",;                      // titulo do sistema
            {"cod_cat","des_cat"},;                         // chaves do arquivo
            {"Codigo da categoria","Descricao da categoria"},;// titulo dos indices para consulta
            {"01","02"},;                                   // ordem campos chaves
            {"CATS",drvdbf,drvntx},;                        // nome do DBF
            {"CATS1","CATS2"},;                             // nomes dos NTX
            {"SUBCATS"},;                                   // nome dos dbf's relacionados
            {},;                                            // campos de relacionamento
            {1,1,6,9,10,73},;                               // num telas/tela atual/coordenadas
            {1,.t.,.f.},;                                   // nivel acesso/tp chave/pede dir
            {},;                                            // campos do arquivo
            {};                                             // formula mostradas
           }

AADD(sistema[001,O_CAMPO],{;            // CATS
     /* mascara       */    "999",;
     /* titulo        */    "Codigo",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "V",;
     /* help do campo */    "";
                         };
)
AADD(sistema[001,O_CAMPO],{;            // CATS
     /* mascara       */    "@!",;
     /* titulo        */    "Descricao",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "!EMPT(des_cat)~Necess rio informar a descricao",;
     /* help do campo */    "Descricao da categoria";
                         };
)
AADD(sistema[001,O_CAMPO],{;            // CATS
     /* mascara       */    "99999999",;
     /* titulo        */    "Ref.Tabelas",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)

sistema[002]={;
            "SubCategorias de produtos",;                   // opcao do menu
            "Subcategorias de produtos",;                   // titulo do sistema
            {"cod_cat+cod_sub","des_sub"},;                 // chaves do arquivo
            {"Codigo da categoria","Descricao da sub categoria"},;// titulo dos indices para consulta
            {"0102","03"},;                                 // ordem campos chaves
            {"SUBCATS",drvdbf,drvntx},;                     // nome do DBF
            {"SUBCATS1","SUBCATS2"},;                       // nomes dos NTX
            {},;                                            // nome dos dbf's relacionados
            {"CATS->cod_cat"},;                             // campos de relacionamento
            {1,1,8,10,19,72,3,8},;                          // num telas/tela atual/coordenadas/inicio scroll/qtde scroll
            {1,.t.,.f.},;                                   // nivel acesso/tp chave/pede dir
            {},;                                            // campos do arquivo
            {};                                             // formula mostradas
           }

AADD(sistema[002,O_CAMPO],{;            // SUBCATS
     /* mascara       */    "999",;
     /* titulo        */    "Codigo",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[002,O_CAMPO],{;            // SUBCATS
     /* mascara       */    "999",;
     /* titulo        */    "Codigo",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "V",;
     /* help do campo */    "";
                         };
)
AADD(sistema[002,O_CAMPO],{;            // SUBCATS
     /* mascara       */    "@!",;
     /* titulo        */    "Descricao",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "!EMPT(des_sub)~Necess rio informar a descricao",;
     /* help do campo */    "Descricao da sub-categoria";
                         };
)
AADD(sistema[002,O_CAMPO],{;            // SUBCATS
     /* mascara       */    "!",;
     /* titulo        */    "Flag",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[002,O_CAMPO],{;            // SUBCATS
     /* mascara       */    "99999999",;
     /* titulo        */    "Ref.Tabelas",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)


sistema[003]={;
            "Produtos e servicos",;                         // opcao do menu
            "Produtos e servicos",;                         // titulo do sistema
            {"cod_pro","des_pro"},;                         // chaves do arquivo
            {"Codigo do produto","Descricao do produto"},;// titulo dos indices para consulta
            {"01","02"},;                                   // ordem campos chaves
            {"PRODUTOS",drvdbf,drvntx},;                    // nome do DBF
            {"PRODUTO1","PRODUTO2"},;                       // nomes dos NTX
            {},;                                            // nome dos dbf's relacionados
            {},;                                            // campos de relacionamento
            {1,1,9,7,15,74},;                               // num telas/tela atual/coordenadas
            {1,.t.,.f.},;                                   // nivel acesso/tp chave/pede dir
            {},;                                            // campos do arquivo
            {};                                             // formula mostradas
           }

AADD(sistema[003,O_CAMPO],{;            // PRODUTOS
     /* mascara       */    "9999",;
     /* titulo        */    "Codigo",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "V",;
     /* help do campo */    "";
                         };
)
AADD(sistema[003,O_CAMPO],{;            // PRODUTOS
     /* mascara       */    "@!",;
     /* titulo        */    "Descricao",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "!EMPT(des_pro)~Necess rio informar a descricao",;
     /* help do campo */    "Descricao de produto ou servico";
                         };
)
AADD(sistema[003,O_CAMPO],{;            // PRODUTOS
     /* mascara       */    "999",;
     /* titulo        */    "Categoria",;
     /* cmd especial  */    "VDBF(6,24,20,77,'CATS',{'des_cat'},2,'cod_cat',[])",;
     /* default       */    "",;
     /* pre-validacao */    "VDBF(6,24,20,77,'CATS',{'des_cat'},2,'cod_cat',[])",;
     /* validacao     */    "PTAB(cod_cat,'CATS',1)~Categoria nao encontrada (Pressione F8)",;
     /* help do campo */    "Pressione F8 para selecionar uma categoria";
                         };
)
AADD(sistema[003,O_CAMPO],{;            // PRODUTOS
     /* mascara       */    "999",;
     /* titulo        */    "Subcategoria",;
     /* cmd especial  */    "VDBF(6,24,20,77,'SUBCATS',{'des_sub'},2,'cod_sub',[cod_cat=CATS->cod_cat])",;
     /* default       */    "",;
     /* pre-validacao */    "VDBF(6,24,20,77,'SUBCATS',{'des_sub'},2,'cod_sub',[cod_cat=CATS->cod_cat])",;
     /* validacao     */    "PTAB(cod_cat+cod_sub,'SUBCATS',1)~Subcategoria invalida (Pressione F8)",;
     /* help do campo */    "Pressione F8 para selecionar uma subcategoria";
                         };
)
AADD(sistema[003,O_CAMPO],{;            // PRODUTOS
     /* mascara       */    "@!",;
     /* titulo        */    "Unidade",;
     /* cmd especial  */    "MTAB([UNIDADE|CAIXA|GARRAFA|ML|METRO|PACOTE|KIT|LITRO|KG],[UNIDADE])",;
     /* default       */    "'UNIDADE'",;
     /* pre-validacao */    "",;
     /* validacao     */    "!EMPT(uni_pro)~Informe uma unidade ou pressione F8 para selecione uma",;
     /* help do campo */    "Pressione F8 para unidades de medida";
                         };
)
AADD(sistema[003,O_CAMPO],{;            // PRODUTOS
     /* mascara       */    "99999999",;
     /* titulo        */    "Ref.Tabelas",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[003,O_FORMULA],{;          // PRODUTOS - f_des_cat
     /* form mostrar  */    "LEFT(TRAN(CATS->des_cat,[@!]),44)",;
     /* lin da formula*/    3,;
     /* col da formula*/    22;
                         };
)
AADD(sistema[003,O_FORMULA],{;          // PRODUTOS - f_des_sub
     /* form mostrar  */    "LEFT(TRAN(SUBCATS->des_sub,[@!]),44)",;
     /* lin da formula*/    4,;
     /* col da formula*/    22;
                         };
)


sistema[004]={;
            "Metas e gastos diarios",;                      // opcao do menu
            "Metas e gastos diarios",;                      // titulo do sistema
            {"STR(mes_met,02,00)+STR(ano_met,04,00)"},;     // chaves do arquivo
            {"Mes/Ano"},;                                   // titulo dos indices para consulta
            {"0102"},;                                      // ordem campos chaves
            {"METAS",drvdbf,drvntx},;                       // nome do DBF
            {"METAS1"},;                                    // nomes dos NTX
            {"GASTOS"},;                                    // nome dos dbf's relacionados
            {},;                                            // campos de relacionamento
            {1,1,4,6,17,69},;                               // num telas/tela atual/coordenadas
            {0,.t.,.f.},;                                   // nivel acesso/tp chave/pede dir
            {},;                                            // campos do arquivo
            {};                                             // formula mostradas
           }

AADD(sistema[004,O_CAMPO],{;            // METAS
     /* mascara       */    "99",;
     /* titulo        */    "Mes/Ano",;
     /* cmd especial  */    "",;
     /* default       */    "MET_01F9()",;
     /* pre-validacao */    "",;
     /* validacao     */    "mes_met>0.and.mes_met<13~O mes deve variar entre 1 e 12",;
     /* help do campo */    "Mes para essa meta";
                         };
)
AADD(sistema[004,O_CAMPO],{;            // METAS
     /* mascara       */    "9999",;
     /* titulo        */    "Mes/Ano",;
     /* cmd especial  */    "",;
     /* default       */    "MET_02F9()",;
     /* pre-validacao */    "",;
     /* validacao     */    "ano_met>2005 .and. ano_met<2011~O ano deve variar entre 2006 e 2010",;
     /* help do campo */    "Ano para essa meta";
                         };
)
AADD(sistema[004,O_CAMPO],{;            // METAS
     /* mascara       */    "@E 9,999,999.99",;
     /* titulo        */    "Meta",;
     /* cmd especial  */    "",;
     /* default       */    "500",;
     /* pre-validacao */    "",;
     /* validacao     */    "met_met>0~A meta deve ser maior que 0",;
     /* help do campo */    "Informe sua meta de gastos nesse mes";
                         };
)
AADD(sistema[004,O_CAMPO],{;            // METAS
     /* mascara       */    "99",;
     /* titulo        */    "Se1_met",;
     /* cmd especial  */    "",;
     /* default       */    "1",;
     /* pre-validacao */    "",;
     /* validacao     */    "se1_met>0.and.se1_met<=28~O dia deve ser maior que 0 e menor ou igual a 28.",;
     /* help do campo */    "1o. dia da 1a. semana. Pressione F5 para calendario.";
                         };
)
AADD(sistema[004,O_CAMPO],{;            // METAS
     /* mascara       */    "99",;
     /* titulo        */    "Se2_met",;
     /* cmd especial  */    "",;
     /* default       */    "se1_met+7",;
     /* pre-validacao */    "",;
     /* validacao     */    "se2_met>se1_met.and.se2_met<=28~O dia deve ser maior que o 1o. dia da 1a. semana e menor ou igual a 28.",;
     /* help do campo */    "1o. dia da 2a. semana. Pressione F5 para calendario.";
                         };
)
AADD(sistema[004,O_CAMPO],{;            // METAS
     /* mascara       */    "99",;
     /* titulo        */    "Se3_met",;
     /* cmd especial  */    "",;
     /* default       */    "se2_met+7",;
     /* pre-validacao */    "",;
     /* validacao     */    "se3_met>se2_met.and.se3_met<=28~O dia deve ser maior que o 1. dia da 2a. semana e menor ou igual a 28.",;
     /* help do campo */    "1o. dia da 3a. semana. Pressione F5 para calendario.";
                         };
)
AADD(sistema[004,O_CAMPO],{;            // METAS
     /* mascara       */    "99",;
     /* titulo        */    "Se4_met",;
     /* cmd especial  */    "",;
     /* default       */    "se3_met+7",;
     /* pre-validacao */    "",;
     /* validacao     */    "se4_met>se3_met.and.se4_met<=28~O dia de ser maior que o 1o. dia da 3a. semana e menor ou igual a 28.",;
     /* help do campo */    "1o. dia da 4a. e ultima semana. Pressione F5 para calendario.";
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Gasto sem. 1
     /* form mostrar  */    "LEFT(TRAN(MET_03F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    6,;
     /* col da formula*/    19;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Gasto sem. 2
     /* form mostrar  */    "LEFT(TRAN(MET_04F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    7,;
     /* col da formula*/    19;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Gasto sem. 3
     /* form mostrar  */    "LEFT(TRAN(MET_05F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    8,;
     /* col da formula*/    19;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Gasto sem. 4
     /* form mostrar  */    "LEFT(TRAN(MET_06F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    9,;
     /* col da formula*/    19;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Esp. Sem. 1
     /* form mostrar  */    "LEFT(TRAN(met_met/4,[@E 9,999,999.99]),12)",;
     /* lin da formula*/    6,;
     /* col da formula*/    34;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Esp. Sem. 2
     /* form mostrar  */    "LEFT(TRAN(MET_09F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    7,;
     /* col da formula*/    34;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Esp. Sem. 3
     /* form mostrar  */    "LEFT(TRAN(MET_10F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    8,;
     /* col da formula*/    34;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Esp. Sem. 4
     /* form mostrar  */    "LEFT(TRAN(MET_11F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    9,;
     /* col da formula*/    34;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Res. Sem. 1
     /* form mostrar  */    "LEFT(TRAN((met_met/4)-met_03f9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    6,;
     /* col da formula*/    49;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Res. Sem. 2
     /* form mostrar  */    "LEFT(TRAN(met_09f9()-met_04f9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    7,;
     /* col da formula*/    49;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Res. Sem. 3
     /* form mostrar  */    "LEFT(TRAN(met_10f9()-met_05f9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    8,;
     /* col da formula*/    49;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Res. Sem. 4
     /* form mostrar  */    "LEFT(TRAN(met_11f9()-met_06f9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    9,;
     /* col da formula*/    49;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Total Esperado
     /* form mostrar  */    "LEFT(TRAN(met_met,[@E 9,999,999.99]),12)",;
     /* lin da formula*/    11,;
     /* col da formula*/    34;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Total Gasto
     /* form mostrar  */    "LEFT(TRAN(MET_07F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    11,;
     /* col da formula*/    19;
                         };
)
AADD(sistema[004,O_FORMULA],{;          // METAS - Restante
     /* form mostrar  */    "LEFT(TRAN(MET_08F9(),[@E 9,999,999.99]),12)",;
     /* lin da formula*/    11,;
     /* col da formula*/    49;
                         };
)


sistema[005]={;
            "Gastos diarios",;                              // opcao do menu
            "Gastos diarios",;                              // titulo do sistema
            {"STR(mes_met,02,00)+STR(ano_met,04,00)+cod_gas"},;// chaves do arquivo
            {"Mes/Ano"},;                                   // titulo dos indices para consulta
            {"010203"},;                                    // ordem campos chaves
            {"GASTOS",drvdbf,drvntx},;                      // nome do DBF
            {"GASTOS1"},;                                   // nomes dos NTX
            {},;                                            // nome dos dbf's relacionados
            {"METAS->mes_met","METAS->ano_met"},;           // campos de relacionamento
            {1,1,4,0,19,79,3,12},;                          // num telas/tela atual/coordenadas/inicio scroll/qtde scroll
            {0,.t.,.f.},;                                   // nivel acesso/tp chave/pede dir
            {},;                                            // campos do arquivo
            {};                                             // formula mostradas
           }

AADD(sistema[005,O_CAMPO],{;            // GASTOS
     /* mascara       */    "99",;
     /* titulo        */    "Mes/Ano",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[005,O_CAMPO],{;            // GASTOS
     /* mascara       */    "9999",;
     /* titulo        */    "Mes/Ano",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[005,O_CAMPO],{;            // GASTOS
     /* mascara       */    "999999",;
     /* titulo        */    "Cod_gas",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "V",;
     /* help do campo */    "";
                         };
)
AADD(sistema[005,O_CAMPO],{;            // GASTOS
     /* mascara       */    "@D",;
     /* titulo        */    "Data",;
     /* cmd especial  */    "",;
     /* default       */    "date()",;
     /* pre-validacao */    "",;
     /* validacao     */    "month(dat_gas)=METAS->mes_met.and.year(dat_gas)=METAS->ano_met~O mes e ano devem ser os mesmos da meta",;
     /* help do campo */    "Data do gasto";
                         };
)
AADD(sistema[005,O_CAMPO],{;            // GASTOS
     /* mascara       */    "9999",;
     /* titulo        */    "Produto",;
     /* cmd especial  */    "VDBF(6,24,20,77,'PRODUTOS',{'des_pro'},2,'cod_pro',[])",;
     /* default       */    "",;
     /* pre-validacao */    "VDBF(6,24,20,77,'PRODUTOS',{'des_pro'},2,'cod_pro',[])",;
     /* validacao     */    "PTAB(cod_pro,'PRODUTOS',1)~Produto nao localizado",;
     /* help do campo */    "Pressione F8 para lista de produtos e servicos";
                         };
)
AADD(sistema[005,O_CAMPO],{;            // GASTOS
     /* mascara       */    "@E 999.9",;
     /* titulo        */    "Quantidade",;
     /* cmd especial  */    "",;
     /* default       */    "1",;
     /* pre-validacao */    "",;
     /* validacao     */    "qtd_gas>0~A quantidade deve ser maior que 0",;
     /* help do campo */    "Quantidade usada";
                         };
)
AADD(sistema[005,O_CAMPO],{;            // GASTOS
     /* mascara       */    "@E 9,999,999.99",;
     /* titulo        */    "Valor Unitario",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "vlr_gas>0~O valor unitario deve ser maior que 0",;
     /* help do campo */    "Valor de uma unidade do produto";
                         };
)
AADD(sistema[005,O_CAMPO],{;            // GASTOS
     /* mascara       */    "!",;
     /* titulo        */    "Flag",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[005,O_FORMULA],{;          // GASTOS - Valor total
     /* form mostrar  */    "LEFT(TRAN(qtd_gas*vlr_gas,[@E 9,999,999.99]),12)",;
     /* lin da formula*/    {||l_a},;
     /* col da formula*/    67;
                         };
)
AADD(sistema[005,O_FORMULA],{;          // GASTOS - Nome produto
     /* form mostrar  */    "LEFT(TRAN(PRODUTOS->des_pro,[@!]),30)",;
     /* lin da formula*/    {||l_a},;
     /* col da formula*/    17;
                         };
)


sistema[nss-2]={;
            "Senhas",;                   // opcao do menu
            "Grupos de usu rios",;       // titulo do sistema
            {"pw_grupo"},;               // chaves do arquivo
            {"Codigo"},;                 // titulo dos indices para consulta
            {"01"},;                     // ordem campos chaves
            {"PWGRUPOS",drvpw,drvpw},;   // nome do DBF
            {"PWGRUPO1"},;               // nomes dos NTX
            {"PWTABELA","PWUSUA"},;      // nome dos dbf's relacionados
            {},;                         // campos de relacionamento
            {1,1,1,12,3,65},;            // num telas/tela atual/coordenadas
            {3,.t.,.f.},;                // nivel acesso/tp chave/pede dir
            {},;                         // campos do arquivo
            {}; // fromula { mascara, titulo, formula, linha, coluna }
           }

AADD(sistema[nss-2,O_CAMPO],{;           // PWGRUPOS
     /* mascara       */    "9999",;
     /* titulo        */    "C¢digo",;
     /* cmd especial  */    "",;
     /* default       */    "1",;
     /* pre-validacao */    "",;
     /* validacao     */    "V",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss-2,O_CAMPO],{;           // PWGRUPOS
     /* mascara       */    "@!",;
     /* titulo        */    "Grupo",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "!EMPT(_nogrupo)~Necess rio informar GRUPO",;
     /* help do campo */    "";
                         };
)

sistema[nss-1]={;
            "Tabelas",;                  // opcao do menu
            "Tabelas",;                  // titulo do sistema
            {"pw_grupo+pw_dbf"},;        // chaves do arquivo
            {"Por Grupo"},;              // titulo dos indices para consulta
            {"0102"},;                   // ordem campos chaves
            {"PWTABELA",drvpw,drvpw},;   // nome do DBF
            {"PWTABEL1"},;               // nomes dos NTX
            {},;                         // nome dos dbf's relacionados
            {"PWGRUPOS->pw_grupo"},;     // campos de relacionamento
            {1,1,4,12,12,65,3,5},;       // num telas/tela atual/coordenadas/inicio scroll/qtde scroll
            {3,.t.,.f.},;                // nivel acesso/tp chave/pede dir
            {},;                         // campos do arquivo
            {}; // fromula { mascara, titulo, formula, linha, coluna }
           }

AADD(sistema[nss-1,O_CAMPO],{;           // PWTABELA
     /* mascara       */    "9999",;
     /* titulo        */    "C¢digo",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss-1,O_CAMPO],{;           // PWTABELA
     /* mascara       */    "@S27",;
     /* titulo        */    "Arquivo",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "!EMPT(_dbf)~Necess rio informar ARQUIVO",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss-1,O_CAMPO],{;           // PWTABELA
     /* mascara       */    "@!",;
     /* titulo        */    "Permis”es",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "",;
     /* help do campo */    "DIGITE INICIAIS DAS ROTINAS CERCEADAS AO USURIO|"+;
                            "P. Procura    F. Filtragem    D. Digita‡„o     ÿ|"+;
                            "M. Modifica   E. Exclui       R. Recupera      ÿ|"+;
                            "V. Vˆ global  N. Nova coluna  A. Apaga coluna  ÿ|"+;
                            "I. Imprime    O. Ordena       Q. Quantifica    ÿ|"+;
                            "L. Localiza   G. Global       C. Congela Colunas|"+;
                            "T. Tamanho    J. nova Janela ÿX. eXporta       ÿ|"+;
                            "Z. totaliZa   B. marca linha                   ÿ|";
                         };
)
AADD(sistema[nss-1,O_CAMPO],{;           // PWTABELA
     /* mascara       */    "!",;
     /* titulo        */    "Flag",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)

sistema[nss]={;
            "Usu rios",;                               // opcao do menu
            "Usu rios",;                               // titulo do sistema
            {"pw_grupo+pw_codigo","pw_nome+pw_pass"},; // chaves do arquivo
            {"Por Grupo","Nome+pass"},;                // titulo dos indices para consulta
            {"0102","0306"},;                          // ordem campos chaves
            {"PWUSUA",drvpw,drvpw},;                   // nome do DBF
            {"PWUSUA1","PWUSUA2"},;                    // nomes dos NTX
            {},;                                       // nome dos dbf's relacionados
            {"PWGRUPOS->pw_grupo"},;                   // campos de relacionamento
            {1,1,13,12,23,65,3,7},;                    // num telas/tela atual/coordenadas/inicio scroll/qtde scroll
            {3,.f.,.f.},;                              // nivel acesso/tp chave/pede dir
            {},;                                       // campos do arquivo
            {}; // fromula { mascara, titulo, formula, linha, coluna }
           }

AADD(sistema[nss,O_CAMPO],{;            // PWUSUA
     /* mascara       */    "9999",;
     /* titulo        */    "C¢digo",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss,O_CAMPO],{;            // PWUSUA
     /* mascara       */    "9999",;
     /* titulo        */    "C¢digo",;
     /* cmd especial  */    "",;
     /* default       */    "1",;
     /* pre-validacao */    "",;
     /* validacao     */    "V",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss,O_CAMPO],{;            // PWUSUA
     /* mascara       */    "@!",;
     /* titulo        */    "Nome",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "!EMPT(_nome)~Necess rio informar NOME",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss,O_CAMPO],{;            // PWUSUA
     /* mascara       */    "9",;
     /* titulo        */    "Nivel",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "MTAB([1. Opera‡„o|2. Manuten‡„o|3. Gerˆncia],[N¡VEL DE ACESSO])",;
     /* validacao     */    "VAL(_nivel)>0~NIVEL n„o aceit vel",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss,O_CAMPO],{;            // PWUSUA
     /* mascara       */    "",;
     /* titulo        */    "Obs",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss,O_CAMPO],{;            // PWUSUA
     /* mascara       */    "",;
     /* titulo        */    "PW",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)
AADD(sistema[nss,O_CAMPO],{;            // PWUSUA
     /* mascara       */    "!",;
     /* titulo        */    "Flag",;
     /* cmd especial  */    "",;
     /* default       */    "",;
     /* pre-validacao */    "",;
     /* validacao     */    "I",;
     /* help do campo */    "";
                         };
)

* \\ Final de ORF_ATRI.PRG
