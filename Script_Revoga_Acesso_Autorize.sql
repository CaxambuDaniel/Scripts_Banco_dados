--conecta a base de dados onde a tabela dos logins � serem inativados se encontra 
database autenticador

--Seleciona os logins � serem inativados e os armazena em uma tabela tempor�ria chamada 'inativa_logins'(o intuito � melhorar o desempenho do script) 							 
select usu_login 
from tbusuario 
where usu_login in ('ALLE2020','ABERTTA456','MRMINFR151','TESITAUC21','CABESP003','TESTE0209','LABBARO23','SAMELWS1','SIRIO13480','SIRIO2021T','TSTORZ2021','HCOR2021','TESTITAU21','BP2021WS','IGESP2018','3580116PWS','ITAUSEG01','3012190PWS','CRUZES01','MOGIRAD02','PILOTO2020','EVAND0TEST','COROTWS1','FORT2019','FORTCFOWS1','FORTWS01','UROMED01','FRATURA123','FUADMWS1','NISERVMED1','TESTE252','SBJBSC2017','INTERMED1','UNICARD01','8367640PWS','CLIN43923','PAINFANT19','COBRAPWS19','SMARTAWS1','CMEDWEBS1','4406120PWS','7222747PWS','CLINMOURA2','WAJMANWS1','3065854PWS','OFTALCLIN1','SEPTOWS1','2997228PWS','CNHLTDAWS1','CNHNEFRO19','2947428PWS','JUSCELINO9','ALERGO19','TESTI009','COFE2019','FARESP2020','MINASG2018','ORTOREAB01','BALBI2018','MATERNALW1','AROSA029','BEDRANP01','LACPSWS1','NUCLEOPWS1','PERORALWS1','2832829PWS','CTOCLINWS3','TOMO2018','CLINRADIO9','CLINSAPED1','TUPAWS17','CPETRO19','UBERLAN19','BRAGANCA1','ITULAB01','LABSTAL18','LABSIPE2','LABORCLIW1','LABORWS1','AVIGDORWS1','LABORAWS1','BRAGAWS01','VBRAGAWS1','2069566PW','LABCLAU18','OMAR2020','CLINDR2018','MATERB19','MATERWS1','LABTAJARA2','VCUORIM19','VITACWS1','CLILUNAWS1','CLINLUNA19','CADIG2019','2471250PWS','CHYRUS01','HFCPPROD17','2256389PWS','5837687PWS','PROBEMWS1','SELISAWS1','UROCLINWS1','UROSTAEL19','ICEOMEDWS2','OFTALMOWS1','CLINSTA02','BIOAPT19','MARILIAP2','LABVIC02','CEUESP2019','VINI193801','LABDIVWS1','VINI196053','ESPEC2018','NUCLEOWS1','MATER0018','SACEACE01','4445603PWS','UROM2018','ANDROLWS01','JUNDIAIWS1','SAOLUC01','CLINOLHOS2','PROSIMTRA2','CASAESA2','CETEWS01','LABPATBIO1','VINI251550','MICROWS1','3062586PWS','BONATTIWS1','CATALAO20','LABQUEI19','LABIS2019','BRSIR2019','DMERICA20','4638257PWS','CEFRO2019','ABERTTA18','CARDIOPH01','OTUR2019','OTURORTWS1','CEPTUS01','CENTROWS1','LABIPDWS1','ICOHEN2019','BCASSOC19','OCULARWS1','INTERM2021','CENTROMOH2','3184892PWS','ACSAUDE19','ACSMPWS1','3184942PWS','FROTAWS1','4008242PWS','MORIBEWS1','RUBENSWS1','CIDADE2018','TESTEC2019','DIMEG2019','SKINLASER9','CITACWS1','2953381PWS','CALIFREWS1','GAMALBWS1','HIGIEWS1','OFTALHWS01','BPPWS2017','LABBA19P','ATIBAIA19','PRECISION5','CENTRALD19','DERMESTE19','ICDEST19','INSTCDE19','INSTDERWS1','ICOINSTWS1','5503311TWS','SHSJC2017','PARDO2020','CLINMAMO19','COFCL2019','HSSAUDE01','IDAB2019','NOOBA2019','6318951PWS','INSTWS17','SABINWS321','UNIMED191','4028011PWS','APICEHOSP1','GONN2019','GONNELIWS1','LUCIAWS1','CLINR2017','CRPROD2017','KASSITWS1','KRASUAM19','KRAUSWS1','KFSMEAWS1','FERRAZWS1','IMADIM19','VACINAWS1','YASEME19','YASUDA19','MEDZZ2019','OSVALDOWS2','MED2017O','UNILABWS1','SANTAFEW1','7346570PWS','LABPVWS1','HOFFMANN19','BIOCLINWS1','ALEDASA19','PACARATU01','SAOLUCAS99','THONSONWS2','BROMBERWS1','CLINNEW19','DERMDER19','NEWDERM19','NEWDERMWS1','XLEMEWS1','6860776PWS','7357443PWS','2899259PWS','SUZUKI18','OMILENIUM1','WALDIR02','BEMESTARW1','LABANTO17','TESTEORZ22','CASAWS19','ENDOSMWS1','LABMEDL01','CEDIMAGEM3','PORTALWS1','HEMOLABWS2','CLIMEGE19','MATERSA01','IONB2017','MEDCEN2019','CLINCR01','UMINF2019','CLIDAY2018','SANDES19','CVEX2017','LABOPWS1','STACASA19','IMONO2018','TESTAORZ1','AMEATEMED1','CLIMEC106','FISIOM2018','SOTE2018','MATRE2019','HEMOLAB001','PROMATWS1','CCMA2017','5753820PWS','CATICA19','ALERGOD19','ANORF2018','POLIMED19','PROSAME19','LACLINWS1','LACLIWS1','UNIMEC2019','CLINO2018','LDEDUARDO1','MATTER19','EXTREMA20','LABSJWS1','STCASA2018','ELABELWS1','3272619PWS','DIAG2031','CASAJ2018','STAHELENA4','1100629PWS','GNDI2020','LIBERD19','CEDRO1131','CLANGIO19','LABDJP19','FUNDHSS01','LABIO2018','GALGANI17','CLILAB2020','APAE2019','LAVINIA113','VERCLIN19','NEWTON19','CLIPEBA19','TESTE1211','ALERGO113','CATO2019','CLJESUS20','VITREO19','CRAB2019','SGABRIEL20','LABJPINTO1','SILVANY19','LABMATOWS1','BAHIANO19','PROFEM2019','SALVACOR19','CABULA2018','SERMECAWS1','STSPRO2017','LABOCLIN17','DERMA2019','CHECAP19','PROBABYWS1','STACLARA18','HOSPF2018','OLHOSSP19','IRBA2019','ULTRAWS1','IBOPC2020','01149083L','DIAGNOST02','9679225PWS','LABOR2020','DOREA2018','EUTROPIO19','CENTRALWS1','LABWEBS18','LIDILAB1','WEBS2020','CLIMOD01','MARIAL2019','CLIGEP19','PRONEU01','FISIOCAD19','ODONTOC19','CEMVDWS1','LCDM2017','CIAM2019','HCEHOSP19','CLIOLHOS19','SERVRGR19','KICHFY19','1420861PWS','ORTRA2018','SEMC0019','SEMC2019','INTENS19','CENTROCAD1','UNIDERMA20','PMEP2017','CDSROSA2','HOSPMS2018','AVIEIRA19','IOFEOF19','ANALISE18P','ASSOC2019','CECAMC01','ENDO120488','DERMACL19','CLINISEWS1','CHECKUPWS1','IDIP18WS','TESTEBKO19','ADSCAR1208','IMEN2019','GYNECO2019','MEDVAS1214','MEDWEB19','CLINSTAM01','MUNIZ2019','JJGINECO19','2ORIZON1TE','GASTR003','CLINGER19','CLINGERO19','GASTROP19','ANGIOL20','DERMACO19','HOXIGWS1','LEALIVO19','UNIFETAL2','LABOCS2018','GONTIJO12','GONTIJOWS1','LDCLAB18','CLINOBAW1','SERVIF122','DIAGRIOW1','NEFROLOWS1','RETINA19','RETINA20','BANGU201','BERILO2019','HLNETOWS01','LABOCLIWS1','NOALER19','CLIN1233','VITONCO19','CAMOHO2018','ALERGON19','ALLMED19','CLINSTA01','ANESTESI19','HILARIO19','BARREIRA18','EYECLIN01','EYECLINIC0','EYECLINWS1','GMDP2019','ANMO2018','ALERGOI1','ALERGOI2','DLAWEBS1','ANDRAD19','SAUDEINST1','BONFIM2018','LABPAST01','5863057PWS','MASTOGIN19','AMAZONIA19','CLINWEB1','CLINWS20','INCARWS01','CSASAUDE19','INSTBA19','3304537PWS','ILHEUSMED1','CEOF2018','CHECK2019','COOPS2018','HEMOLABWS1','PGURGELWS1','2524174PWS','BIOLABWS1','BIOSALLI02','BYOSAL85','CLINOF01','SANFINS19','PUBERALWS1','PUBERAWS1','CONFIAR19','ITAIGARA20','CLINCO2018','COLHOS19','CLIOSP20','CLOB2019','CONSULT20','ENDOPLUS1','HEMODLC2','IDERME2018','IDUBPT18','JAMFISIO02','JANFIS19','JMMCIA19','LABCLINOP2','LUCIMA2018','MEDEMAWS1','OFTALM19','PMEP12017','RTLAB1485','ECOGRAF19','SOSSOS19','UROCLIN20','ARTICULAR9','MNCARDIO19','5589836PWS','FONSEWS1','GSFTESTE19','AMU15640','CLIDAL2019','BENEVIDE19','CLISUR2019','CLINDRAMF1','IHEBA019','SALUTE02','SMLABOR1','VITA2019','AUTA1585','ASFEBTEST1','CLIEF2019','DERMAE2019','CIRURGIA19','QUARTZLWS1','FBCLIN01','CMCSP001','2679048PWS','VILLAS2018','SERMEC2019','CLISANNA17','ESTETIC20','EQUILI19','BRANDAO19','MNEIVA02','AMGPOLI17','SONIA188','ITAIM2029','IRECE2019','UNIPED01','2867319PWS','5131309PWS','2461791PWS','MEDICALWS1','BONIWS01','STRTESTE1','CMD2019P','CABESP002','CODIAG19','CODIAS19','CODIASC19','COTODIA19','DIAG2029','LOGINO19','LTDACO01','1115579PWS','REMOCWS1','DASA7640','ESTET2020','JMEDICAWS1','8541147PWS','PSEMANAL13','QUALI2016','SPINOLA19','AGNUS2018','DRCARDIO01','ANGIOWS1','SANDRE01','FONO2020','FISIODEWS1','PNUCLEOWS1','BIOVAL18','MEDCAR2018','ARTROS19','LABHM017','CLIMIL2019','DERM2018','CALINO19','COIMBRAWS1','IOTE2019','ORTOLABWS1','CAMACAR19','COCAMA19','OTOCAMA19','ITABINA01','ITABUNA01','POSTURA19','HSEPACO1','FAIRIWS1','CLINDOR19','CLINMED19','AMEATL19','OTORRINOM1','LCSSML19','RITMOCLI19','MEDI2019','LABFLE2019','INSTCB01','CANDEIAS19','CENOEC19','URODAY01','SEMDOR2018','1127111PWS','INATROWS1','CLIFELIZ24','CENTROCIM1','GEORTG19','1059807PWS','ASLFSM19','8896226PWS','PROCOR19','CLAMF2428','REDE2021','CLINIVAN01','YANO2018','GAVAZZAW1','TAVARES20','9132050PWS','CLIFACE20','STAFEIRA20','MONITORA','PILAR2019','CEDICD02','CETRAD01','CETRAD09','1192044PWS','CLVIVA2018','HACOSTA1','CLINDIAG01','CLOM2017','IMUNOA02','VIDAFIS01','NUCLEOP19','JOVEM2511','CESME2019','H2529513','ANGI2018','SKAMCWS1','RETINAEYE1','5322125PWS','CEVEM2019','CARPANED17','ORTOC2019','ORTOCE2019','CMFAGU19','1822224PWS','PEROLA10','CLINDERMA2','1351283PWS','8729864PWS','LAFEWS17','CLIMEC19','1473626PWS','LABVIDA17','VISAOWS01','HOSPISM1','SEGUROS100','FSANTOWS1','FSANTOWS2','3707061PWS','2921258PWS','LABWEBS1','GRUPO5565','1542023PWS','MAURO2019','CEAP2019','ORTOMIP19','OSERVMED19','7366055PWS','TESTEORZ21','AURA2020','7306547PWS','2028866PWS','CAMACARI12','FERRAZ2019','TLABOR12','RJDERM2019','1024125PWS','ALERGOLOG1','ESPACO2019','REVITALI01','REABIL19','NFISIO2019','SERVME2019','ULTRA2753','ANGRA222','LAQUE2018','BIOLABWS2','RICARDOWS1','HOSPCR01','2038085PWS','CALAZANS19','UNIMEDCWS1','1986041PWS','MEDAL2019','CLISMA2019','5726994PWS','VILA2019','EIRELI19','2310205PWS','4514595PWS','9380782PWS','FISIO288','1148898PWS','FEMME2020','LABORSL01','ITABUNA19','RAINHAS1','BIOLAWS1','7364149PWS','AUDITWS1','MEDCLIN19','1349886PWS','CMNPLM01','HSBC2017','AMOFE2019','PROINFAN18','8252188PWS','FAFPWS19','LSBIOWS1','TESTEBKO1','LABORLAB18','2527634PWS','AMOFIS01','EIRELI01','DRCONSUT19','1909728PWS','AIMUNO01','CAMBRA19','REQUEMED1','1687443PWS','2406595PWS','FRANZ2019','COMPSS01','CABESP001','POLIMAIS19','BIOMET571','MULTI2010','IMAG2020','2824195PWS','2626321PWS','CLINITA19','1201109PWS','CITOLABWS1','ESAB2019','NEUROP19','HCLABWS1','GIKA2019','PREIHS2019','SLUCAS19','IORB2019','TERAPIA20','PROSAUDE30','LCSERV2019','TESTE2019','LABSABIN9','TESTEPR1','INSLEITE19','FARES2020','3141640POC','LABMM2019','BIOLAB02','N3154459','TAGUA2019','FLORENZO19','2636526PWS','CACULE01','LABPAT2109','N03180840','TELAVITA19','PSIVIVA19','DAVITAT1','CAREPLUS20','SAUDE2021','SZELES123','TESTETI123','TSTORZ21')
into temp inativa_logins							);							 

--utiliza as informa��es armazenadas na tabela temporaria como par�metro para inativa��o dos logins.
update autenticador:TBUSUARIO
set usu_situacao = '5'
--select * from autenticador:tbusuario 
where usu_login in (select * from inativa_logins)