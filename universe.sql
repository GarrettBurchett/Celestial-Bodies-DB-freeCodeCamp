--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    constellation character varying,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean,
    planet_id integer,
    discovered integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    planet_types character varying,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    galaxy_id integer,
    age_in_millions_of_years numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    users_id integer NOT NULL,
    name character varying NOT NULL,
    email character varying
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.users_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: users users_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN users_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Where Earth is located', 'Sagittarius', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Closest big galaxy to Milky Way', 'Andromeda', NULL);
INSERT INTO public.galaxy VALUES (3, 'Black Hole Galaxy', 'Nicknamed Black Eye or Evil Eye', 'Coma Berenices', false);
INSERT INTO public.galaxy VALUES (4, 'Butterfly Galaxies', 'Looks are similar to butterflies', 'Virgo', NULL);
INSERT INTO public.galaxy VALUES (5, 'Grasshopper', 'Named after its appearance to grasshoppers', 'Lynx', NULL);
INSERT INTO public.galaxy VALUES (6, 'Peekaboo Galaxy', 'Was hidden behind fast-moving foreground star', 'Hydra', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'moon for Earth', false, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Deimos', '1 of 2 moons on Mars', false, 4, 1877);
INSERT INTO public.moon VALUES (3, 'Phobos', '2nd moon on Mars', false, 4, 1877);
INSERT INTO public.moon VALUES (4, 'Arche', '1 of the 67 moons of Jupiter', NULL, 5, 2002);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Another moon for Jupiter. Discovered by Galileo', NULL, 5, 1610);
INSERT INTO public.moon VALUES (6, 'Europa', 'Another moon for Jupiter', NULL, 5, 1610);
INSERT INTO public.moon VALUES (7, 'locaste', 'Another moon for Jupiter', NULL, 5, 2000);
INSERT INTO public.moon VALUES (8, 'S/2011 J 1', 'Another moon for Jupiter', NULL, 5, 2011);
INSERT INTO public.moon VALUES (9, 'Aegir', '1 of 62 moon of Saturn', NULL, 6, 2005);
INSERT INTO public.moon VALUES (10, 'Calypso', 'Another moon of Saturn', NULL, 6, 1980);
INSERT INTO public.moon VALUES (11, 'Dione', 'Another moon of Saturn', NULL, 6, 1684);
INSERT INTO public.moon VALUES (12, 'Janus', 'Another Saturn moon', NULL, 6, 1966);
INSERT INTO public.moon VALUES (13, 'Ariel', '1 of 27 Uranus moons', NULL, 7, 1851);
INSERT INTO public.moon VALUES (14, 'Bianca', 'Another Uranus moon', NULL, 7, 1986);
INSERT INTO public.moon VALUES (15, 'Puck', 'Another Uranus moon', NULL, 7, 1985);
INSERT INTO public.moon VALUES (16, 'Nereid', '1 of 14 Neptune moons', NULL, 8, 1949);
INSERT INTO public.moon VALUES (17, 'Sao', 'Another Neptune moon', NULL, 8, 2002);
INSERT INTO public.moon VALUES (18, 'S/2004 N 1', 'Another Neptune Moon', NULL, 8, 2013);
INSERT INTO public.moon VALUES (19, 'Hydra', '1 of 5 Pluto moons', NULL, 9, 2005);
INSERT INTO public.moon VALUES (20, 'Styx', 'Another Pluto moon', NULL, 9, 2012);
INSERT INTO public.moon VALUES (21, 'Congo', 'Moon I made up for Crichton', true, 10, 1980);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '1st planet in Milky Way', NULL, false, true, 4568, 222, 1);
INSERT INTO public.planet VALUES (2, 'Venus', '2nd planet in the Milky Way', NULL, false, true, 4568, 111, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The planet we live on', NULL, true, true, 4568, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', '4th planet in the Milky Way', NULL, false, true, 4568, 111, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', '5th planet in the Milky Way', NULL, false, true, 4568, 222, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', '6th planet in the Milky Way', NULL, false, true, 4568, 444, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', '7th planet in the Milky Way', NULL, false, true, 4568, 666, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', '8th planet in the Milky Way', NULL, false, true, 4568, 888, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Was 9th planet in the Milky Way. Demoted to dwarf planet', 'Dwarf', false, true, 4568, 999, 1);
INSERT INTO public.planet VALUES (10, 'Crichton', 'Planet I made up in the Andromeda galaxy', 'Not Real', true, true, 7896.3, 123456, 2);
INSERT INTO public.planet VALUES (11, 'Buckeye', 'Planet I made up for the Butterfly galaxy', 'Not Real', false, false, 3249684, 985, 4);
INSERT INTO public.planet VALUES (12, 'Baby', 'Planet I made up for the Peekaboo galaxy', 'Not Real', false, false, 84561, 351, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The one that powers Earth', 1, 100000);
INSERT INTO public.star VALUES (2, 'Andromeda Sun', 'Sun of the Andromeda galaxy', 2, 1000000);
INSERT INTO public.star VALUES (3, 'Black Eye', 'Star in the Black Hole galaxy', 3, 750000);
INSERT INTO public.star VALUES (4, 'Monarch', 'Star I made up in the Butterfly galaxy', 4, 1200);
INSERT INTO public.star VALUES (5, 'Lubber', 'Star I made up for the Grasshopper Galaxy', 5, 123);
INSERT INTO public.star VALUES (6, 'CU', 'Star I made up for the Peekaboo galaxy', 6, 456);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Garrett Burchett', 'email@hotmail.com');
INSERT INTO public.users VALUES (2, 'Mike Jones', 'stilltippin@htown.net');
INSERT INTO public.users VALUES (3, 'Dexter Morgan', 'sliceoflife@miamimetro.com');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (users_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--