User.delete_all
BugClass.delete_all

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

bacteria = BugClass.create(
  name: 'Bacteria',
  tier: 1,
  order: 1
)
viruses = BugClass.create(
  name: 'Viruses',
  tier: 1,
  order: 2
)
fungi = BugClass.create(
  name: 'Fungi',
  tier: 1,
  order: 3
)
parasites = BugClass.create(
  name: 'Parasites',
  tier: 1,
  order: 4
)

gram_positives, gram_negatives = bacteria.add_child_classes(['Gram Positive', 'Gram Negative'])

#Gram Pos
staph, strep, enterococci, sporulating, filamentous = gram_positives.add_child_classes(['Staphylococcus', 'Streptococcus', 'Enterococcus', 'Sporulating', 'Filamentous'])
bacillus, clostridia = sporulating.add_child_classes(['Bacillus', 'Clostridium'])

staph.add_bugs(['Staphylococcus aureus', 'Staphylococcus epidermidis', 'Staphylococcus saprophyticus', 'Staphylococcus lugdunensis'])
strep.add_bugs(['Streptococcus pyogenes', 'Streptococcus agalactiae', 'Streptococcus pneumo', 'Streptococcus viridans', 'Streptococcus pneumoniae', 'Streptococcus bovis'])
enterococci.add_bugs(['Enterococcus faecalis', 'Enterococcus faecium'])
bacillus.add_bugs(['Bacillus anthracis', 'Bacillus cereus'])
clostridia.add_bugs(['Clostridium perfringens','Clostridium diff', 'Clostridium tetani', 'Clostridium bolutinum'])
filamentous.add_bugs(['Actinomyces israelii', 'Nocardia asteroides'])
gram_positives.add_bugs(['Listeria monocytogenes', 'Corynebacterium diphtheriae'])

#Gram Neg
gram_negatives = ['Diplococci', 'Coccoid Rods', 'Rods', '']

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



