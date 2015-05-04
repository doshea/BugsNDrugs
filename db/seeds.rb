#TODO
# Gardnerella vaginalis
# Propionibacterium acnes


User.delete_all
BugClass.delete_all
Bug.delete_all
DrugClass.delete_all
Drug.delete_all

#creates a non-admin User
User.create(
  first_name: 'Test',
  last_name: 'Testerson',
  email: 'test@gmail.com',
  username: 'test_user',
  is_admin: false,
  password: 'qwerty',
  password_confirmation: 'qwerty'
)

#creates an admin User
User.create(
  first_name: 'Chief',
  last_name: 'Chieferson',
  email: 'chief@gmail.com',
  username: 'chief',
  is_admin: true,
  password: 'qwerty',
  password_confirmation: 'qwerty'
)

###BUGS##

bacteria = BugClass.create(name: 'Bacteria',tier: 0,order: 1)
viruses = BugClass.create(name: 'Viruses',tier: 0,order: 2)
fungi = BugClass.create(name: 'Fungi',tier: 0,order: 3)
parasites = BugClass.create(name: 'Parasites',tier: 0,order: 4)

gram_positives, gram_negatives, atypical_acid = bacteria.add_child_classes(['Gram Positive', 'Gram Negative', 'Atypical Acid-Fast'])

#Gram Pos
staph, strep, enterococci, sporulating, filamentous = gram_positives.add_child_classes(['Staphylococcus', 'Streptococcus', 'Enterococcus', 'Sporulating', 'Filamentous'])
bacillus, clostridia = sporulating.add_child_classes(['Bacillus', 'Clostridium'])

staph.add_bugs(['Staphylococcus aureus', 'Staphylococcus epidermidis', 'Staphylococcus saprophyticus', 'Staphylococcus lugdunensis'])
strep.add_bugs(['Streptococcus pyogenes', 'Streptococcus agalactiae', 'Streptococcus pneumoniae', 'Streptococcus viridans', 'Streptococcus bovis'])
enterococci.add_bugs(['Enterococcus faecalis', 'Enterococcus faecium'])
bacillus.add_bugs(['Bacillus anthracis', 'Bacillus cereus'])
clostridia.add_bugs(['Clostridium perfringens','Clostridium diff', 'Clostridium tetani', 'Clostridium bolutinum'])
filamentous.add_bugs(['Actinomyces israelii', 'Nocardia asteroides'])
gram_positives.add_bugs(['Listeria monocytogenes', 'Corynebacterium diphtheriae'])

#Atypical
mycobacteria = atypical_acid.add_child_class('Mycobacteria')
mycobacteria.add_bugs(['Mycobacterium tuberculosis', 'Mycobacterium leprae'])
atypical_acid.add_bugs(['Mycoplasma pneumoniae'])

#Gram Neg
cocci, aerobic_coccobacilli, lactose_fermenters, lactose_nonfermenters, zoonoses, curved, opportunistic, obligate_intracellular, spirochetes = gram_negatives.add_child_classes(['Cocci', 'Aerobic Coccobacilli','Lactose Fermenters','Lactose Non-fermenters','Zoonoses', 'Curved','Opportunistic', 'Obligate Intracellular','Spirochetes'])

cocci.add_bugs(['Neisseria meningitidis', 'Neisseria gonorrohoea'])

aerobic_coccobacilli.add_bugs(['Haemophilus influenzae', 'Bordatella pertussis', 'Listeria monocytogenes'])
ecoli = lactose_fermenters.add_child_class('E. coli')
ecoli.add_bugs(['ETEC','EPEC','EHEC'])
lactose_fermenters.add_bugs(['Klebsiella pneumoniae', 'Enterobacter cloacae'])

salmonella, yersinia = lactose_nonfermenters.add_child_classes(['Salmonella', 'Yersinia'])
lactose_nonfermenters.add_child_class('Shigella')
salmonella.add_bugs(['Salmonella typhii', 'Salmonella non-typhii'])
yersinia.add_bugs(['Yersinia enterocolitica', 'Yersinia pestis'])

vibrio, helical = curved.add_child_classes(['Vibrio','Helical'])
vibrio.add_bugs(['Vibrio cholerae','Vibrio parahaemolyticus','Vibrio vulnificus'])
helical.add_bugs(['Helicobacter pylori','Campylobacter jejuni'])
opportunistic.add_bugs(['Pseudomonas aeruginosa', 'Bacteriodes fragilis'])

zoonoses.add_bugs(['Francisella tularensis', 'Pasturella multocida', 'Capnocytophaga canimorsus', 'Streptobacillus moniliformis','Spirillum minus'])
brucella = zoonoses.add_child_class('Brucella')
brucella.add_bugs(['Brucella melitensis', 'Brucella abortis', 'Brucella suis', 'Brucella canis'])
#TO DO: Add Legionella, Proteus mirabilis, H. ducreyi

borrelia = spirochetes.add_child_class('Borrelia')
borrelia.add_bugs(['Borrelia burgdorferi', 'Borrelia hermsii', 'Borrelia recurrentis'])

chlamydia, rickettsia, bartonella = obligate_intracellular.add_child_classes(['Chlamydia','Rickettsia','Bartonella'])
chlamydia.add_bugs(['Chlamydia trachomatis','Chlamydia psittaci'])
rickettsia.add_bugs(['Rickettsia rickettsii','Rickettsia prowazeki','Rickettsia typhii','Orientia tsutsumaguchi'])
bartonella.add_bugs(['Bartonella henselae', 'Bartonella quintana'])
obligate_intracellular.add_bugs(['Ehrlichia chafeensis', 'Anaplasma phagocytophilum','Coxiella burnetii'])


#Spirochetes
spirochetes.add_bugs(['Leptospira interogans', 'Treponema pallidum', 'Haemophilus ducreyi'])



#Viruses
ds_dna, ss_dna, ds_rna, plus_ss_rna, minus_ss_rna, retroviruses, partial_ds_dna = viruses.add_child_classes(['I. ds-DNA','II. ss-DNA','III. ds-RNA','IV. (+) ss-RNA','V. (-) ss-RNA','VI. Retrovirus','VII. Partial ds-DNA'])

pox, herpes, papilloma, polyoma = ds_dna.add_child_classes(['Pox', 'Herpes', 'Papilloma', 'Polyoma'])
pox.add_bugs(['Smallpox', 'Vaccinia', 'Molluscum contagiosum'])
herpes.add_bugs(['HSV1', 'HSV2', 'VZV', 'EBV', 'CMV', 'HHV6', 'HHV7', 'HHV8'])
papilloma.add_bugs(['HPV'])
polyoma.add_bugs(['JC', 'BK'])
ds_dna.add_bugs(['Adenovirus'])

parvo, dependo = ss_dna.add_child_classes(['Parvo','Dependo'])
parvo.add_bugs(['B19'])
dependo.add_bugs(['Adeno-associated', 'Bocavirus'])

reo = ds_rna.add_child_class('Reo')
reo.add_bugs(['Rotavirus', 'Coltivirus'])

corona, flavi, toga, picorna, calici = plus_ss_rna.add_child_classes(['Corona', 'Flavi', 'Toga', 'Picorna', 'Calici'])
corona.add_bugs(['SARS', 'MERS'])
flavi.add_bugs(['HCV', 'Dengue', 'Yellow', 'Powassan', 'West Nile', 'St. Louis'])
alpha = toga.add_child_class('Alpha')
alpha.add_bugs(['WEE','EEE','VEE','Chikungunya'])
toga.add_bugs(['Rubella'])
coxsackie = picorna.add_child_class('Coxsackie')
coxsackie.add_bugs(['CAV', 'CBV'])
picorna.add_bugs(['Polio', 'Enterovirus', 'HAV', 'Rhinovirus', 'Echovirus'])
calici.add_bugs(['Noro', 'Sapo'])
plus_ss_rna.add_bugs(['HEV', 'Astrovirus'])

orthomyxo,paramyxo,bunya,arena,rabdo,filo = minus_ss_rna.add_child_classes(['Orthomyxo','Paramyxo','Bunya','Arena','Rabdo','Filo'])
orthomyxo.add_bugs(['Influenza'])
paramyxo.add_bugs(['Rubeola','Rubulla','Parainfluenza','RSV','hMPV'])
bunya.add_bugs(['Hantavirus', 'Heartland'])
arena.add_bugs(['Hemorrhagic Fevers', 'LCM','Lassa'])
rabdo.add_bugs(['Lyssa'])
filo.add_bugs(['Ebola','Marburg'])

htlv = retroviruses.add_child_class('Human T-lymphotropic')
htlv.add_bugs(['HTLV-1', 'HTLV-2'])
retroviruses.add_bugs(['HIV'])

partial_ds_dna.add_bugs(['HBV'])


#Fungi
yeast, mould, dimorphic = fungi.add_child_classes(['Yeast', 'Mould', 'Dimorphic'])

candida, crypto = yeast.add_child_classes(yeasts = ['Candida', 'Cryptococcus'])

candida.add_bugs(['Candida albicans', 'Candida glabrata', 'Candida krusei', 'Candida lusitaniae', 'Candida guillermondi', 'Candida parapsilosis'])
crypto.add_bugs(['Cryptococcus neoformans', 'Cryptococcus gattii'])
yeast.add_bugs(['Trichosporon', 'Cryptococcus'])

septated, mucorales, dermatophytes = mould.add_child_classes(['Septated', 'Mucorales', 'Dermatophyte'])
septated.add_bugs(['Aspergillus', 'Fusarium', 'Scedosporium'])
mucorales.add_bugs(['Rhizopus', 'Rhizormucor', 'Mucor', 'Cunninhamella'])
dermatophytes.add_bugs(['Trichophyton', 'Microsporum', 'Epidermophyton'])

blasto, coccidio, histo = dimorphic.add_child_classes(['Blastomyces', 'Coccidioides', 'Histoplasma'])

blasto.add_bugs(['Blastomyces dermatidis'])
coccidio.add_bugs(['Coccidioides immitis', 'Coccidioides posadasii'])
histo.add_bugs(['Histoplasma capsulatum', 'Histoplasma duboisii'])
dimorphic.add_bugs(['Paracoccidiodes', 'Sporothrix'])

proto, helminth = parasites.add_child_classes(['Protozoan', 'Helminth'])
amoeba, flagellates, sporozoa = proto.add_child_classes(['Amoeba', 'Flagellate', 'Sporozoa'])
nematodes, cestodes, trematodes = helminth.add_child_classes(['Nematode', 'Cestode', 'Trematode'])

amoeba.add_bugs(['Entamoeba histolytica', 'Naeglaria fowleri', 'Acanthameba'])
luminal, hemoflagellates = flagellates.add_child_classes(['Luminal', 'Hemoflagellates'])

luminal.add_bugs(['Trichomonas vaginalis', 'Giardia lamblia'])
trypanosoma, leishmania = hemoflagellates.add_child_classes(['Trypanosoma', 'Leishmania'])
trypanosoma.add_bugs(['Trypanosoma brucei', 'Trypanosoma cruzei'])
leishmania.add_bugs(['Leishmania donovan','Leishmania braziliensis'])

plasmodium, coccidia = sporozoa.add_child_classes(['Plasmodium', 'Coccidia'])
sporozoa.add_bugs(['Babesia', 'Toxoplasma Gondii','Cryptosporidium', 'Microsporidium'])
plasmodium.add_bugs(['Plasmodium falciparum', 'Plasmodium vivas', 'Plasmodium ovale', 'Plasmodium malariae', 'Plasmodium knowlesi'])
coccidia.add_bugs(['Isospora', 'Cyclospora'])

intestinal_n, tissue_n = nematodes.add_child_classes(['Intestinal','Tissue'])
hookworm = intestinal_n.add_child_class('Hookworm')
ancylostoma = hookworm.add_child_class('Ancylostoma')
ancylostoma.add_bugs(['Ancylostoma duodenale', 'Ancylostoma braziliense'])
hookworm.add_bugs(['Necator americanus'])
intestinal_n.add_bugs(['Enterobiases', 'Trichuris trichuria', 'Ascaris lumbricoides', 'Strongyloides stercoralis'])

filarioidea, toxocara = tissue_n.add_child_classes(['Filarioidea', 'Toxocara'])
toxocara.add_bugs(['Toxocara cani', 'Toxocara cati'])
filarioidea.add_bugs(['Wucheria bancrofti', 'Brugia malayi', 'Loa loa', 'Onchocerca volvulus'])
tissue_n.add_bugs(['Trichinella spiralis', 'Anisakis', 'Dracunculiasis'])

taeniasis = cestodes.add_child_class('Taeniasis')
taeniasis.add_bugs(['Taeniasis saginata', 'Taeniasis solium'])
cestodes.add_bugs(['Echinococcus granulosus', 'Diphyllobothrium', 'Hymenolopiasis nana'])
blood_flukes, tissue_flukes, intestine_flukes = trematodes.add_child_classes(['Blood Flukes', 'Tissue Flukes', 'Intestine Flukes'])

schisto = blood_flukes.add_child_class('Schistoma')
schisto.add_bugs(['Schistoma mansoni','Schistoma haemotobium','Schistoma japonicum'])
tissue_flukes.add_bugs(['Paragonimus','Clonorchis','Fasciola'])
intestine_flukes.add_bugs(['Fasciolopsis'])

###DRUGS###

##SETUP##
penicillin_g = Drug.new(generic_name: 'Penicillin G', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
methicillin = Drug.new(generic_name: 'Methicillin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
nafcillin = Drug.new(generic_name: 'Nafcillin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
oxacillin = Drug.new(generic_name: 'Oxacillin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
ampicillin = Drug.new(generic_name: 'Ampicillin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
amoxicillin = Drug.new(generic_name: 'Amoxicillin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
pipericillin = Drug.new(generic_name: 'Pipericillin', csf: true, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Allergic reaction (cross-reactive)')
ticaricillin = Drug.new(generic_name: 'Ticaricillin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)', obscure: true)
cefazolin = Drug.new(generic_name: 'Cefazolin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
cephalexin = Drug.new(generic_name: 'Cephalexin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)', obscure: true)
ceftazidime = Drug.new(generic_name: 'Ceftazidime', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
ceftriaxone = Drug.new(generic_name: 'Ceftriaxone', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
cefepime = Drug.new(generic_name: 'Cefepime', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
ceftaroline = Drug.new(generic_name: 'Ceftaroline', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Allergic reaction (cross-reactive)')
meropenem = Drug.new(generic_name: 'Meropenem', csf: true, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Allergic reaction (cross-reactive)')
clavulanic_acid = Drug.new(generic_name: 'Clavulanic acid', csf: true, metabolized_in: 'Kidney',administered: 'PO')
sulbactam = Drug.new(generic_name: 'Sulbactam', csf: true, metabolized_in: 'Kidney',administered: 'PO', obscure: true)
tazobactam = Drug.new(generic_name: 'Tazobactam', csf: true, metabolized_in: 'Kidney',administered: 'PO', obscure: true)
vancomycin = Drug.new(generic_name: 'Vancomycin', csf: true, metabolized_in: 'Kidney',administered: 'IV')
fosfomycin = Drug.new(generic_name: 'Fosfomycin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'To Be Announced...', obscure: true)
bacitracin = Drug.new(generic_name: 'Bacitracin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'To Be Announced...', obscure: true)
cycloserine = Drug.new(generic_name: 'Cycloserine', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'To Be Announced...', obscure: true)
daptomycin = Drug.new(generic_name: 'Daptomycin', csf: true, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Myopathy')
tetracycline = Drug.new(generic_name: 'Tetracycline', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Tooth discoloration, Bone incorporation, Photosensitivity')
doxycycline = Drug.new(generic_name: 'Doxycycline', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Tooth discoloration, Bone incorporation, Photosensitivity')
minocycline = Drug.new(generic_name: 'Minocycline', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Tooth discoloration, Bone incorporation, Photosensitivity', obscure: true)
tigecycline = Drug.new(generic_name: 'Tigecycline', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Tooth discoloration, Bone incorporation, Photosensitivity', obscure: true)
gentamicin = Drug.new(generic_name: 'Gentamicin', csf: false, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Nephrotoxicity, Neurotoxicity, Ototoxicity')
tobramycin = Drug.new(generic_name: 'Tobramycin', csf: false, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Nephrotoxicity, Neurotoxicity, Ototoxicity')
amikacin = Drug.new(generic_name: 'Amikacin', csf: false, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Nephrotoxicity, Neurotoxicity, Ototoxicity', obscure: true)
streptomycin = Drug.new(generic_name: 'Streptomycin', csf: false, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Nephrotoxicity, Neurotoxicity, Ototoxicity', obscure: true)
neomycin = Drug.new(generic_name: 'Neomycin', csf: false, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Nephrotoxicity, Neurotoxicity, Ototoxicity', obscure: true)
spectinomycin = Drug.new(generic_name: 'Spectinomycin', csf: false, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Nephrotoxicity, Neurotoxicity, Ototoxicity', obscure: true)
erythromycin = Drug.new(generic_name: 'Erythromycin', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Cholestatic Hepatitis, Epigastric distress')
azithromycin = Drug.new(generic_name: 'Azithromycin', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Cholestatic Hepatitis, Epigastric distress')
clarithromycin = Drug.new(generic_name: 'Clarithromycin', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Cholestatic Hepatitis, Epigastric distress', obscure: true)
telithromycin = Drug.new(generic_name: 'Telithromycin', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Cholestatic Hepatitis, Epigastric distress', obscure: true)
fidaxomycin = Drug.new(generic_name: 'Fidaxomycin', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Cholestatic hepatitis, Epigastric distress', obscure: true)
clindamycin = Drug.new(generic_name: 'Clindamycin', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Superinfection')

quinupristin_dalfopristin = Drug.new(generic_name: 'Quinupristin-dalfopristin', csf: false, metabolized_in: 'Liver',administered: 'IV',toxicities: 'Venous inflammation, Arthralgia')
chloramphenicol = Drug.new(generic_name: 'Chloramphenicol', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Bone marrow suppression, Grey Baby Syndrome,Aplastic anemia')

linezolid = Drug.new(generic_name: 'Linezolid', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Thrombocytopoenia')

norfloxacin = Drug.new(generic_name: 'Norfloxacin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Tendon rupture', obscure: true)
ciprofloxacin = Drug.new(generic_name: 'Ciprofloxacin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Tendon rupture')
ofloxacin = Drug.new(generic_name: 'Ofloxacin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Tendon rupture', obscure: true)
levofloxacin = Drug.new(generic_name: 'Levofloxacin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Tendon rupture')
gemifloxacin = Drug.new(generic_name: 'Gemifloxacin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Tendon rupture', obscure: true)
moxifloxacin = Drug.new(generic_name: 'Moxifloxacin', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Tendon rupture')

metronidazole = Drug.new(generic_name: 'Metronidazole', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Headache, Peripheral neuropathy, Alcohol sensitivity')
nitrofurantoin = Drug.new(generic_name: 'Nitrofurantoin', csf: true, metabolized_in: 'TBA',administered: 'TBA',toxicities: 'TBA', obscure: true)

sulfamethoxazole = Drug.new(generic_name: 'Sulfamethoxazole', csf: true, metabolized_in: 'Kidney',administered: 'PO')
trimethoprim = Drug.new(generic_name: 'Trimethoprim', csf: true, metabolized_in: 'Kidney',administered: 'PO')

rifampin = Drug.new(generic_name: 'Rifampin', csf: true, metabolized_in: 'Liver',administered: 'PO')
isoniazid = Drug.new(generic_name: 'Isoniazid', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Pyridoxine deficiency, Hepatotoxicity')
pyrazinamide = Drug.new(generic_name: 'Pyrazinamide', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Polyarthralgia')
ethambutol = Drug.new(generic_name: 'Ethambutol', csf: true, metabolized_in: 'TBA',administered: 'PO',toxicities: 'TBA')
dapsone = Drug.new(generic_name: 'Dapsone', csf: true, metabolized_in: 'TBA',administered: 'PO',toxicities: 'TBA', obscure: true)

##Usage##
antimicrobials = DrugClass.create(name: 'Antimicrobials', tier: 0, order: 1)
chemotherapeutics = DrugClass.create(name: 'Chemotherapeutics', tier: 0, order: 2)
immunosuppressants = DrugClass.create(name: 'Immunosuppressants', tier: 0, order: 3)
autonomics = DrugClass.create(name: 'Autonomics', tier: 0, order: 4)
antibacterials, antivirals, antifungals, antiparasitics = antimicrobials.add_child_classes(['Antibacterials', 'Antivirals', 'Antifungals','Antiparasitics'])

#Anti-bacterials
cell_wall_inhibs,translation_inhibitors,membrane_depolarizers, fluoroquinolones, dna_damagers, antimetabolites, antimycobacterials = antibacterials.add_child_classes(['Cell Wall Inhibitors','Translation Inhibitors', 'Membrane Depolarizers', 'Fluoroquinolones','DNA Damagers', 'Antimetabolites', 'Antimycobacterials'])

penicillins, cephalosporins, carbapenems, beta_lactamase_inhibitors = cell_wall_inhibs.add_child_classes(['Penicillins', 'Cephalosporins', 'Carbapenems', 'β Lactamase Inhibitors'])
penicillins.add_leafs([penicillin_g, methicillin, nafcillin, oxacillin, ampicillin, amoxicillin,pipericillin, ticaricillin])
ceph_genI, ceph_genIII, ceph_genIV = cephalosporins.add_child_classes(['Gen I', 'Gen III', 'Gen IV'])
ceph_genI.add_leafs([cefazolin, cephalexin])
ceph_genIII.add_leafs([ceftazidime,ceftriaxone])
ceph_genIV.add_leafs([cefepime, ceftaroline])
carbapenems.add_leafs([meropenem])
beta_lactamase_inhibitors.add_leafs([clavulanic_acid,sulbactam,tazobactam])
cell_wall_inhibs.add_leafs([vancomycin,fosfomycin,bacitracin,cycloserine])
membrane_depolarizers.add_leafs([daptomycin])

inhib_30s, inhib_50s = translation_inhibitors.add_child_classes(['30S inhibitors','50S inhibitors'])
tetracyclines, aminoglycosides = inhib_30s.add_child_classes(['Tetracyclines', 'Aminoglycosides'])
macrolides, lincosamide, streptogramins = inhib_50s.add_child_classes(['Macrolides', 'Lincosamide', 'Streptogramins'])
tetracyclines.add_leafs([tetracycline,doxycycline,minocycline,tigecycline])
aminoglycosides.add_leafs([gentamicin,tobramycin,amikacin,streptomycin,neomycin,spectinomycin])
macrolides.add_leafs([erythromycin,azithromycin,clarithromycin,telithromycin,fidaxomycin])
lincosamide.add_leafs([clindamycin])
streptogramins.add_leafs([quinupristin_dalfopristin,chloramphenicol])
inhib_50s.add_leafs([linezolid])

fluoroquinolones.add_leafs([norfloxacin,ciprofloxacin,ofloxacin,levofloxacin,gemifloxacin,moxifloxacin])
dna_damagers.add_leafs([metronidazole,nitrofurantoin])
antimetabolites.add_leafs([sulfamethoxazole, trimethoprim])
antimycobacterials.add_leafs([rifampin,isoniazid,pyrazinamide,ethambutol, dapsone])


acyclovir = Drug.new(generic_name: 'Acyclovir', mechanism:'Blocks viral DNA polymerase, activated by viral Thymidine Kinase (TK)', csf: true, metabolized_in: 'Kidney',administered: 'PO')
ganciclovir = Drug.new(generic_name: 'Ganciclovir', mechanism: 'Blocks viral DNA polymerase, activated by viral Thymidine Kinase (TK)',csf: true, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Bone marrow toxicity')
foscarnet = Drug.new(generic_name: 'Foscarnet', mechanism:'Blocks viral DNA polymerase (and reverse transcriptase)',csf: true, metabolized_in: 'Kidney',administered: 'IV',toxicities: 'Nephrotoxicity')

lamivudine = Drug.new(generic_name: 'Lamivudine', csf: true, metabolized_in: 'Kidney',administered: 'PO')
zidovudine = Drug.new(generic_name: 'Zidovudine (AZT)',mechanism:'Inhibi', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Bone marrow depression')


efavirenz = Drug.new(generic_name: 'Efavirenz', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'CNS toxicity, Skin rashes')
fosamprenavir = Drug.new(generic_name: 'Fosamprenavir', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Lipodystrophy')
ritonavir = Drug.new(generic_name: 'Ritonavir', csf: true, metabolized_in: 'Liver',administered: 'PO',toxicities: 'Inhibits Cyp3A4')
raltegravir = Drug.new(generic_name: 'Raltegravir (Isentress)', csf: true, metabolized_in: 'Liver',administered: 'PO')
enfuvirtide = Drug.new(generic_name: 'Enfuvirtide', csf: true, metabolized_in: 'Liver',administered: 'IV')

oseltamivir = Drug.new(generic_name: 'Oseltamivir (Tamiflu)', csf: true, metabolized_in: 'Liver',administered: 'PO')

interferon = Drug.new(generic_name: 'Interferon-alpha', mechanism: 'Induces multiple anti-viral immune responses in host cells',csf: true, metabolized_in: 'Liver',administered: 'IV',toxicities: 'Bone marrow suppression, Flu-li symptoms')
telepravir = Drug.new(generic_name: 'Telepravir (Incivek)', mechanism:'Inhibits HCV protease',csf: true, metabolized_in: 'Liver',administered: 'PO')
sofosbuvir = Drug.new(generic_name: 'Sofosbuvir (Sovaldi)', mechanism: 'Inhibits HCV RNA-dependent RNA polymerase',csf: true, metabolized_in: 'Kidney',administered: 'PO')

#Anti-virals
herpes_drugs, hiv_drugs, flu_drugs, hepatitis_drugs = antivirals.add_child_classes(['Herpes Drugs','HIV Drugs','Flu Drugs','Hepatitis Drugs'])
herpes_drugs.add_leafs([acyclovir,ganciclovir,foscarnet])
rt_binders,protease_inhibitors = hiv_drugs.add_child_classes(['RT Binders','Protease Inhibitors'])
rt_binders.add_leafs([lamivudine,zidovudine,efavirenz])
protease_inhibitors.add_leafs([fosamprenavir,ritonavir])
hiv_drugs.add_leafs([raltegravir,enfuvirtide])
flu_drugs.add_leafs([oseltamivir])
hepatitis_drugs.add_leafs([interferon,telepravir,sofosbuvir])

#Antifungals
fluconazole = Drug.new(generic_name: 'Fluconazole', mechanism:'', csf: true, metabolized_in: 'Kidney',administered: 'PO')
voraconazole = Drug.new(generic_name: 'Voraconazole', mechanism:'', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Transient visual disturbance')
itraconazole = Drug.new(generic_name: 'Itraconazole', mechanism:'', csf: true, metabolized_in: 'Kidney',administered: 'PO', toxicities: 'TBA',obscure: true)
ketoconazole = Drug.new(generic_name: 'Ketoconazole', mechanism:'', csf: true, metabolized_in: 'Kidney',administered: 'PO', toxicities: 'TBA',obscure: true)
amphotericin_b = Drug.new(generic_name: 'Amphotericin B', mechanism:'', csf: false, metabolized_in: 'Kidney',administered: 'IV', toxicities: 'Nephrotoxicity,Fever,Chills')
terbinafine = Drug.new(generic_name: 'Terbinafine', mechanism:'', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Hepatotoxicity', obscure: true)
caspofungin = Drug.new(generic_name: 'Caspofungin', mechanism:'', csf: false, metabolized_in: 'Liver',administered: 'IV',toxicities: 'Headache, GI distress, Histamine release')
flucytosine = Drug.new(generic_name: 'Flucytosine (5-F-U)', mechanism:'', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'Rare bone marrow suppression')
griseofluvin = Drug.new(generic_name: 'Griseofluvin', mechanism:'', csf: true, metabolized_in: 'Kidney',administered: 'PO',toxicities: 'TBA', obscure: true)


membrane_permeabilizers, echinocandins, dna_synthesis_inhibitors, microtubule_inhibitors = antifungals.add_child_classes(['Membrane Permeabilizers','Echinocandins','DNA Synthesis Inhibitors','Microtubule Inhibitors'])
azoles = membrane_permeabilizers.add_child_class('Azoles')
azoles.add_leafs([fluconazole,voraconazole,itraconazole,ketoconazole])
membrane_permeabilizers.add_leafs([amphotericin_b])
membrane_permeabilizers.add_leafs([terbinafine])
dna_synthesis_inhibitors.add_leafs([flucytosine])

echinocandins.add_leafs([caspofungin])
microtubule_inhibitors.add_leafs([griseofluvin])

#Chemotherapeutics
dna_targeters,hormone_therapy,antibodies,protein_synth,mitotic_poisons,tyrosine_kinase_inhibitors = chemotherapeutics.add_child_classes(['DNA Targeters','Hormone Therapy','Antibodies','Protein Synth Inhibition','Mitotic Poisions','Tyrosine Kinase Inhibitors'])
crosslinkers,free_radicals,helix_inhibitors,synthesis_inhibitors = dna_targeters.add_child_classes(['Crosslinkers','Radical Producers','Helix Inhibitors','Synthesis Inhibitors'])
crosslinkers.add_leafs(['Methochlorethamine','Cyclophosphamide','Cisplatin'])
free_radicals.add_leafs(['Bleomycin'])
helix_inhibitors.add_leafs(['Actinomycin','Doxorubicin','Etoposide','Irinotecan'])
synthesis_inhibitors.add_leafs(['Methotrexate','Fluorouracil','Cytosine Arabinoside','Hydroxyurea','6-thioguanosine'])

hormone_therapy.add_leafs(['Tamoxifen','Anastrazole','Leuprolide'])

antibodies.add_leafs(['Trastuzamab (Herceptin)','Bevacizumab (Avastin)'])
protein_synth.add_leafs(['L-asparaginase'])
mitotic_poisons.add_leafs(['Vinca Alkaloids','Paclitaxel (Taxol)'])
tyrosine_kinase_inhibitors.add_leafs(['Imatinib (Gleevec)','Gefitinib (Iressa)','Vemurafenib (Zelboraf)'])

immunophilin_inhibs,gcs,anti_tnfs = immunosuppressants.add_child_classes(['Immunophilin Inhibitors','Glucocorticoids','Anti-TNF drugs'])
immunosuppressants.add_leafs(['Mycophenolate Mofitil'])
immunophilin_inhibs.add_leafs(['Cyclosporine','Tacrolimus','Serolimus'])
anti_tnfs.add_leafs(['Infliximab (Remicade)','Adalimumab (Humera)','Etanercept (Enbrel)'])

#Autonomics
cholinergics, anticholinergics = autonomics.add_child_classes(['Cholinergics', 'Anticholinergics'])
nicotinics, muscarinics, ache_antagonists = cholinergics.add_child_classes(['Nicotinics', 'Muscarinics', 'AChE Inhibitors'])
ache_sens_esters, ache_res_esters, alkaloids = muscarinics.add_child_classes(['AChE Sens. Esters', 'AChE Res. Esters', 'Alkaloids'])

nicotinics.add_leafs(['Nicotine', 'DMPP'])
ache_sens_esters.add_leafs(['ACh', 'Methacholine'])
ache_res_esters.add_leafs(['Bethanechol', 'Carbamylcholine'])
alkaloids.add_leafs(['Muscarine', 'Pilocarpine', 'Cevimiline'])

ache_antagonists.add_leafs(['Edrophonium', 'Neostigmine', 'Physostigmine', 'Donepezil'])
organophosphates = ache_antagonists.add_child_class('Organophosphates')
organophosphates.add_leafs(['Isofluorophate', 'Echothiophate'])

anti_muscarinics, anti_nicotinics = anticholinergics.add_child_classes(['Anti-Muscarinics', 'Anti-Nicotinics'])
depolarizing, non_depolarizing, cholinesterase_regens = anti_nicotinics.add_child_classes(['Depolarizing', 'Non-Depolarizing', 'Cholinesterase Regenerators'])

anti_muscarinics.add_leafs(['Pirenzepine (m1)','Tiotropium (m3)','Atropine','Scopalomine','N-methyl Atropine','Ipratropium'])
depolarizing.add_leafs(['Hexamethonium','Succinylcholine'])
non_depolarizing.add_leafs(['Mivacurium','D-tubocurarine'])
cholinesterase_regens.add_leafs(['Pralidoxime (2-PAM)'])










