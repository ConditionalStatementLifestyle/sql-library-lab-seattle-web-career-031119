def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
  FROM books
  INNER JOIN series
  ON books.series_id = series.id
  WHERE series.id = 1;
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
  FROM characters
  ORDER BY LENGTH(characters.motto) DESC LIMIT 1;
  "
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species)
  FROM characters
  GROUP BY characters.species
  ORDER BY COUNT(characters.species) DESC LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subname
FROM
(SELECT author_id, subgenres.name AS subname
FROM series
JOIN subgenres
ON subgenres.id = series. subgenre_id)
JOIN authors
ON authors.id = author_id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
FROM
(SELECT characters.species, characters.series_id
FROM characters
WHERE characters.species = 'human'
GROUP BY characters.series_id
ORDER BY COUNT(characters.species) DESC LIMIT 1)
JOIN series
ON series_id = series.id;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT name, count(*) as appearances
FROM  books
JOIN
(SELECT characters.name, character_id, book_id
FROM characters
JOIN character_books
ON characters.id = character_id)
ON book_id = books.id
GROUP BY name
ORDER BY appearances DESC;"
end
