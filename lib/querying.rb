def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
   FROM books
   WHERE series_id = 1
   ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT a.name, a.motto
   FROM (
     select characters.name, characters.motto, length(characters.motto) as name_length
     from characters 
     order by name_length DESC 
     Limit 1) a;
    "
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, count(characters.species) as species_count
   FROM characters
   GROUP BY characters.species
   ORDER BY characters.species DESC 
   LIMIT 1;
  "
end

def select_name_and_series_subgenres_of_authors
  "
  SELECT authors.name, subgenres.name
  FROM series
  INNER JOIN authors
  on series.author_id = authors.id
  INNER JOIN subgenres
  on series.subgenre_id = subgenres.id;
  "
end

def select_series_title_with_most_human_characters

  "select series.title
  from authors
  join series 
  on authors.id = series.author_id
  join books
  on series.id = books.series_id
  join characters
  on series.author_id = characters.author_id
  where characters.species = 'human'
  group by series.title
  order by count(*) DESC
  limit 1;
  "


end

def select_character_names_and_number_of_books_they_are_in
  " select characters.name, count(character_books.book_id) as book_count
  from character_books
  join characters 
  ON character_books.character_id = characters.id 
  group by characters.name
  ORDER By book_count DESC, characters.name;
"
end
