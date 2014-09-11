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

bact = ['Gram Positive', 'Gram Negative']
gram_positives = ['Staphylococci', 'Streptococci', 'Enterococci', 'Sporulating', 'Filamentous']
staphylococci = ['Staphylococcus aureus', 'Staphylococcus epidermidis', 'Staphylococcus saprophyticus', 'Staphylococcus lugdunensis']
streptococci = ['Streptococcus pyogenes', 'Streptococcus agalactiae', 'Streptococcus pneumo', 'Streptococcus viridans', 'Streptococcus pneumoniae', 'Streptococcus bovis']
enterococci = ['Enterococcus faecalis', 'Enterococcus faecium']
filamentous = ['Actinomyces israelii', 'Nocardia asteroides']
sporulating = ['Bacillus', 'Clostridia']
bacilli = ['Bacillus anthracis', 'Bacillus cereus']
clostridia = ['Clostridium perfringens','Clostridium diff', 'Clostridium tetani', 'Clostridium bolutinum']
other_gram_pos = ['Listeria monocytogenes', 'Corynebacterium diphtheriae']

gram_pos, gram_neg = bact.map{|b|bacteria.add_child_class(b)}
staph, strep, entero, sporu, filam = gram_positives.map{|b| gram_pos.add_child_class(b)}
bacill, clostrid = sporulating.map{|b| sporu.add_child_class(b)}

staphylococci.each{|b| staph.bugs << Bug.create(name: b)}
streptococci.each{|b| strep.bugs << Bug.create(name: b)}
enterococci.each{|b| entero.bugs << Bug.create(name: b)}
bacilli.each{|b| bacill.bugs << Bug.create(name: b)}
clostridia.each{|b| clostrid.bugs << Bug.create(name: b)}
filamentous.each{|b| filam.bugs << Bug.create(name: b)}
other_gram_pos.each{|b| gram_pos.bugs << Bug.create(name: b)}











