CREATE TABLE Author (
    author_name VARCHAR(255) PRIMARY KEY NOT NULL
);

CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY NOT NULL, --serial # that uniquely IDs each book
    book_title VARCHAR(255) NOT NULL,
    publication_year INT
);

CREATE TABLE Genre (
    genre_name VARCHAR(255) PRIMARY KEY NOT NULL
);

CREATE TABLE Library (
    library_name VARCHAR(255) PRIMARY KEY NOT NULL
);

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE BorrowingRecord (
    record_id INT PRIMARY KEY,
    borrowing_date DATE,
    due_date DATE,
    return_date DATE,
    late_fees DECIMAL(10, 2),
    member_id INT,
    ISBN VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN) ON DELETE CASCADE
);

CREATE TABLE AuthorBook(
    author_name VARCHAR(255),
    ISBN VARCHAR(20),
    PRIMARY KEY (author_name, ISBN),
    FOREIGN KEY (author_name) REFERENCES Author(author_name) ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN) ON DELETE CASCADE
);

CREATE TABLE BookGenre (
    ISBN VARCHAR(20),
    genre_name VARCHAR(255),
    PRIMARY KEY (ISBN, genre_name),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN) ON DELETE CASCADE,
    FOREIGN KEY (genre_name) REFERENCES Genre(genre_name) ON DELETE CASCADE
);

CREATE TABLE LibraryMember (
    library_name VARCHAR(255),
    member_id INT,
    PRIMARY KEY (library_name, member_id),
    FOREIGN KEY (library_name) REFERENCES Library(library_name) ON DELETE CASCADE,
    FOREIGN KEY (member_id) REFERENCES Member(member_id) ON DELETE CASCADE
);