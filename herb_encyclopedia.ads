with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Indefinite_Hashed_Maps;
with Ada.Containers.Vectors;
with Ada.Containers.Indefinite_Vectors;
use Ada.Containers;


-- Library of Herb Encyclopedia types, functions, and information parsers.
-- "+" is used throughout to convert String types to contextual types
-- for use with the input and output from the user.
package Herb_Encyclopedia is
   Version : constant := 0.1;
   -- "+" will convert a string into an unbounded string.
   function "+" (S : String) return Unbounded_String;

   -- Plant_Part is an enumeration of parts of the plant that are to be used.
   type Plant_Part is (Unknown, Stem, Branch, Leaves, Root, Flower, Seeds, Sap, Sprout, Bark,
		       Beans, Gum, Pollen, Rhizome);
   function "+" (S : String) return Plant_Part;
   type Plant_Part_List is array (Positive range <>) of Plant_Part;

   -- Illness is a condition of illness:
   --  Illness ::= (Name, Category, Emphasis, Dynamic, Comment)
   -- + Illness_Category is an enumeration of illness common names, generalities,
   --   and diagnostic names.
   -- + Illness_Dynamic is boolean of whether illness is acute(0) or chronic(1).
   -- + Illness_Emphasized is boolean of whether extra emphasis or applicability is
   --   expressed.
   -- "+" converts a string to it's coorisponding value and contextual type.
   --
   type Illness_Category is (Unknown, From_Name, Acidity, Alcoholism);
   function "+" (S : String) return Illness_Category;
   type Illness_Dynamic is (Acute, Chronic);
   function "+" (S : String) return Illness_Dynamic;
   type Illness_Emphasis is (No_Emphasis, Emphasis);
   function "+" (S : String) return Illness_Emphasis;
   type Illness is record
      Name     : Unbounded_String := To_Unbounded_String ("");
      Category : Illness_Category := From_Name;
      Emphasis : Illness_Emphasis := No_Emphasis;
      Dynamic  : Illness_Dynamic := Acute;
      Comment  : Unbounded_String := To_Unbounded_String ("");
   end record;
   -- Influence is an enumeration of bodily influences herbs may have on a human.
   type Influence is (Unknown,
		      Abortificant, Adaptogen, Alterative, Analgesic, Anaphrodisiac,
		      Anesthetic, Anodyne, Antagonist, Anthelmintic, Antacid, Anti_Bacterial,
		      Anti_Bilious, Antibiotic, Anti_Catarrhal, Anti_Depressant, Antidote,
		      Anti_Emetic, Anti_Fungal, Anti_Galactagogue, Anti_Hemorrhagic,
		      Anti_Histamine, Anti_Inflammatory, Anti_Lithic, Anti_Microbial,
		      Anti_Neoplastic, Anti_Oxidant, Anti_Periodic, Anti_Phlogistic,
		      Anti_Pyretic, Anti_Rheumatic, Anti_Scorbutic, Antiseptic, Anti_Spasmodic,
		      Anti_Syphilitic, Anti_Thrombotic, Anti_Toxic, Anti_Tussive, Anti_Viral,
		      Aperient, Aperitive, Aphrodisiac, Aromatic, Astringent, Bactericide,
		      Bitter, Blood_Cleanser, Blood_Purifier, Calmative, Carminative,
		      Cathartic, Cell_Proliferator, Condiment, Corrects_Polarity, Cholagogue,
		      Cimcifuga, Counterirritant, Demulcent, Deobstruent, Detergent, Diaphoretic,
		      Discutient, Disinfectant, Diuretic, Drastic, Emmenagogue, Emollient,
		      Enervate, Expectorant, Febrifuge, Galactogogue, Hemolytic, Hemostatic,
		      Hepatic, Hormonal, Hydragogue, Hypertensive, Hypotensive, Immuno_Stimulant,
		      Interferon, Irritant, Laxative, Lithotriptic, Narcotic, Nauseant,
		      Nervine, Nutritive, Oxytocic, Parasiticide, Parturient, Pectoral,
		      Precursor, Prophylactic, Pungent, Purgative, Rubefacient, Refrigerant,
		      Relaxant, Resolvent, Restorative, Sedative, Sialagogue, Soporific,
		      Stimulant, Stomachic, Styptic, Sudorfic, Synergistic, Systemic,
		      Taenifuge, Tonic, Tonic_General, Vasoconstrictor, Vasodilator,
		      Vermifuge, Vulnerary
		     );
   function Identifier (S : String) return Influence;
   package Herb is
      Name : Unbounded_String := To_Unbounded_String("");


   end Herb;

end Herb_Encyclopedia;
