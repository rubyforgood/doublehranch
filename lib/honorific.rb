class Honorific
  ALL = [
         "Admiral",
         "Air Cdre",
         "Air Marshal",
         "Alderman",
         "Ambassador",
         "Archbishop",
         "Archdeacon",
         "Baron of Lewes",
         "Baron",
         "Baroness",
         "Bishop",
         "Brigadier",
         "Brother",
         "Buergermeister",
         "Canon",
         "Captain",
         "Catholic Chaplain",
         "Chairman",
         "Chevalier",
         "Chief Constable",
         "Chief Fire Officer",
         "Chief Inspector",
         "Chief Rabbi Sir",
         "Chief Supt",
         "Chief",
         "Colonel Dr",
         "Colonel",
         "Commander",
         "Commodore",
         "Comte",
         "Consort to the Deputy Mayor of Wirral",
         "Consul",
         "Councillor Mrs",
         "Councillor",
         "Count",
         "Countess",
         "Dame",
         "Dato'",
         "Datuk",
         "Dean",
         "Deputy Mayor of Sefton Councillor",
         "Deputy Vice-Chancellor Professor",
         "District Attorney",
         "District Judge",
         "Doctor",
         "Dott.",
         "Dr",
         "Duchess",
         "Duke",
         "Earl",
         "Emeritus Professor",
         "Eng",
         "Eur Ing",
         "Father",
         "Fiona",
         "Flt Lt",
         "Frau",
         "Frú",
         "General",
         "Governor",
         "Group Captain",
         "Her Excellency",
         "Her Honour Judge",
         "Her Honour",
         "Her Royal Highness Princess",
         "Her Royal Highness",
         "Herr",
         "High Sheriff of Merseyside",
         "His Excellency Chief",
         "His Excellency",
         "His Grace the Duke of Westminster",
         "His Grace The Duke",
         "His Grace",
         "His Honour Judge",
         "His Honour",
         "His Royal Highness Prince",
         "His Royal Highness",
         "Hon. Lord",
         "Hon",
         "Honourable",
         "HRH Princess",
         "Ing",
         "Judge",
         "Justice",
         "Lady Mayoress",
         "Lady",
         "Lieutenant Colonel",
         "Lieutenant Commander",
         "Lieutenant",
         "Lord Lieutenant of Merseyside Dame",
         "Lord Lieutenant of Merseyside Dr",
         "Lord Lieutenant",
         "Lord Mayor",
         "Lord",
         "Lt Cdr",
         "Lt Colonel",
         "Madam",
         "Mademoiselle",
         "Major",
         "Majors",
         "Mar",
         "Marchioness",
         "Master",
         "Mayor",
         "Mayoress",
         "Messrs",
         "Methodist Chaplain",
         "Miss",
         "Mme",
         "Monsieur",
         "Monsignor",
         "Mr and Mrs",
         "Mr Justice",
         "Mr",
         "Mrs",
         "Ms",
         "Mx",
         "of Birkenhead",
         "of Quarry Bank",
         "Pastor",
         "Police Constable",
         "Pr Eng",
         "Prebendary",
         "President",
         "Prince",
         "Princess",
         "Pro-Vice-Chancellor Professor",
         "Pro-Vice-Chancellor",
         "Professor Dame",
         "Professor Lord",
         "Professor Sir",
         "Professor the Lord",
         "Professor",
         "QPM",
         "Rabbi",
         "Revd. Cannon Dr.",
         "Reverend Brother",
         "Reverend Canon",
         "Reverend Dr",
         "Reverend Father",
         "Reverend Professor",
         "Reverend Sister",
         "Reverend",
         "Right Reverend",
         "Rt Hon",
         "Rt. Hon. Dame",
         "Rt. Hon. Lord Justice",
         "Rt. Hon. Sir",
         "Senator",
         "Senior Executive Assistant",
         "Sergent",
         "Sheikh",
         "Sir",
         "Sister",
         "Squadron Leader",
         "Sub Lt",
         "The Countess of",
         "The Duke of",
         "The Earl of",
         "The Editor",
         "The High Sheriff of Merseyside Dr.",
         "The High Sheriff",
         "The Hon Dame",
         "The Hon. Dr.",
         "The Hon. Mr. Justice",
         "The Hon. Mr",
         "The Honorable Dame",
         "The Honorable Mrs",
         "The Honorable Sir",
         "The Honorable",
         "The Lord",
         "The Mayor-Elec of Wirral Councillor",
         "The Mayor",
         "The Most Rev",
         "The Right Hon. Lord Justice",
         "The Right Hon. the Lord",
         "The Right Honourable",
         "The Rt Hon Lady Justice",
         "The Rt Hon Lord",
         "The Rt Hon Mrs",
         "The Rt Hon the Lady",
         "The Rt Hon the Lord",
         "The Rt Hon",
         "The Rt Honourable Earl of",
         "The Rt Rev Bishop",
         "The Rt Rev Dr",
         "The Rt Rev",
         "The Rt. Hon the Lord",
         "The Rt. Hon. Dame",
         "The Rt. Hon. Lady Justice",
         "The Rt. Hon. Lord",
         "The Rt. Hon. The Baroness",
         "The Rt. Hon. the Earl of",
         "The Rt. Hon. The Lady",
         "The Rt. Hon. The Lord",
         "The Rt. Hon.",
         "The Rt. Hon",
         "The Rt. Rev. Dr.",
         "The Rt. Revd. Dr.",
         "The Rt. Worshipful",
         "The Rt. Worshipfull",
         "The Very Revd. Dr.",
         "The Very Reverend",
         "The Worship the Mayor of Wirral",
         "The Worship the Mayor",
         "The Worshipful the Lord Mayor of Liverpool",
         "The Worshipful the Lord Mayor",
         "The Worshipful the Mayor of Halton",
         "The Worshipful the Mayor of Knowsley",
         "The Worshipful the Mayor of Sefton",
         "The Worshipful the Mayor of St. Helens",
         "The Worshipful the Mayor of",
         "The Worshipful the Mayor",
         "Venerable",
         "Very Reverend",
         "Vice Admiral Sir",
         "Vice-Chancellor Professor",
         "Vice-Chancellor",
         "Viscount",
         "Viscountess",
         "Wing Commander"
   ]
   def self.find(title_and_name)
     ALL.select{ |title| title_and_name[/#{title}[ \.]/i] }
   end
end
