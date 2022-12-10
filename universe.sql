--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    description text,
    distance_from_earth_in_km numeric(10,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planet (
    galaxy_planet_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    name character varying(40)
);


ALTER TABLE public.galaxy_planet OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_galaxy_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_galaxy_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_galaxy_planet_id_seq OWNED BY public.galaxy_planet.galaxy_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_million_of_years integer,
    description text,
    distance_from_earth numeric(10,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_million_of_years integer,
    description text,
    distance_from_earth numeric(10,1)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    description text,
    distance_from_earth_in_km numeric(10,1),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_planet galaxy_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet ALTER COLUMN galaxy_planet_id SET DEFAULT nextval('public.galaxy_planet_galaxy_planet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'spiral', true, false, 3000, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'elleptical', false, false, 2000, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'irregular', false, true, 2500, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'ESO 325_G004', false, false, 3000, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'M101', false, false, 1500, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 1569', false, false, 3000, NULL, NULL);


--
-- Data for Name: galaxy_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planet VALUES (1, 1, 1, false, false, 'spiral_earth');
INSERT INTO public.galaxy_planet VALUES (2, 1, 2, false, false, 'Spiral_jupiter');
INSERT INTO public.galaxy_planet VALUES (3, 1, 3, false, false, 'Spiral_Earth');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Dactly', false, false, 3000, NULL, NULL);
INSERT INTO public.moon VALUES (2, 2, 'Charon', false, false, 5000, NULL, NULL);
INSERT INTO public.moon VALUES (3, 3, 'Atlas', false, false, 4000, NULL, NULL);
INSERT INTO public.moon VALUES (4, 4, 'Hyperion', false, false, 2000, NULL, NULL);
INSERT INTO public.moon VALUES (5, 5, 'Mimas', false, false, 1000, NULL, NULL);
INSERT INTO public.moon VALUES (6, 6, 'Ipetus', false, false, 8000, NULL, NULL);
INSERT INTO public.moon VALUES (7, 7, 'Pan', false, false, 2000, NULL, NULL);
INSERT INTO public.moon VALUES (8, 8, 'Nereid', false, false, 2000, NULL, NULL);
INSERT INTO public.moon VALUES (9, 9, 'Callisto', false, false, 9000, NULL, NULL);
INSERT INTO public.moon VALUES (10, 10, 'Phobos', false, false, 5, NULL, NULL);
INSERT INTO public.moon VALUES (11, 11, 'Ganymede', false, false, 1, NULL, NULL);
INSERT INTO public.moon VALUES (12, 12, 'Miranda', false, false, 8, NULL, NULL);
INSERT INTO public.moon VALUES (13, 2, 'Epimetheus', false, false, 3000, NULL, NULL);
INSERT INTO public.moon VALUES (14, 2, 'Triton', false, false, 5000, NULL, NULL);
INSERT INTO public.moon VALUES (15, 3, 'Titan', false, false, 4000, NULL, NULL);
INSERT INTO public.moon VALUES (16, 4, 'Io', false, false, 2000, NULL, NULL);
INSERT INTO public.moon VALUES (17, 5, 'Rhea', false, false, 1000, NULL, NULL);
INSERT INTO public.moon VALUES (18, 6, 'Europa', false, false, 8000, NULL, NULL);
INSERT INTO public.moon VALUES (19, 7, 'The moon', false, false, 2000, NULL, NULL);
INSERT INTO public.moon VALUES (20, 8, 'Encelodus', false, false, 2000, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', true, false, 3000, NULL, NULL);
INSERT INTO public.planet VALUES (2, 2, 'Jupiter', false, false, 5000, NULL, NULL);
INSERT INTO public.planet VALUES (3, 3, 'Mercury', false, false, 4000, NULL, NULL);
INSERT INTO public.planet VALUES (4, 4, 'Mars', false, false, 2000, NULL, NULL);
INSERT INTO public.planet VALUES (5, 1, 'Venus', false, false, 1000, NULL, NULL);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', false, false, 8000, NULL, NULL);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', false, false, 2000, NULL, NULL);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', false, false, 2000, NULL, NULL);
INSERT INTO public.planet VALUES (9, 1, 'Ceres', false, false, 9000, NULL, NULL);
INSERT INTO public.planet VALUES (10, 1, 'Makemake', false, false, 5, NULL, NULL);
INSERT INTO public.planet VALUES (11, 1, 'Haumea', false, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (12, 1, 'Eris', false, false, 8, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'solar', true, false, 3000, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Hot Blue', false, false, 2000, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Red dwarf', false, true, 2500, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'Red Giant', false, false, 3000, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'White Dwarfs', false, false, 1500, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'Neutron Stars', false, false, 3000, NULL, NULL, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_galaxy_planet_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_planet galaxy_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_name_key UNIQUE (name);


--
-- Name: galaxy_planet galaxy_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_pkey PRIMARY KEY (galaxy_planet_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planet UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

