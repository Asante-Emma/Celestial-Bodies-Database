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
    name character varying(255) NOT NULL,
    number_of_planets integer,
    galaxy_type character varying(255),
    number_of_stars character varying(255)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    moon_mass_unit_ten_power_22_kg numeric(12,2),
    planet_id integer,
    moon_radius_km numeric(12,2)
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
    name character varying(255) NOT NULL,
    number_of_moons integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    star_id integer
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_age_in_millions_of_years numeric(12,2),
    description text
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
-- Name: telescope; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.telescope (
    telescope_id integer NOT NULL,
    name character varying(255) NOT NULL,
    location character varying(255),
    galaxy_id integer
);


ALTER TABLE public.telescope OWNER TO freecodecamp;

--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.telescope_telescope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telescope_telescope_id_seq OWNER TO freecodecamp;

--
-- Name: telescope_telescope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.telescope_telescope_id_seq OWNED BY public.telescope.telescope_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Name: telescope telescope_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope ALTER COLUMN telescope_id SET DEFAULT nextval('public.telescope_telescope_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 8, 'Spiral', '100 billion');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1, 'Spiral', '1 trillion');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 0, 'Spiral', '40 billion');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 0, 'Elliptical', '200 billion');
INSERT INTO public.galaxy VALUES (5, 'Missier 87', 0, 'Elliptical', '100 trillion');
INSERT INTO public.galaxy VALUES (6, 'NGC 1300', 1, 'Barred Spiral', '50 billion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 7.35, 1, 1737.10);
INSERT INTO public.moon VALUES (2, 'Phobos', 1.08, 4, 11.10);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.20, 4, 6.20);
INSERT INTO public.moon VALUES (4, 'Ganymede', 148.19, 2, 2634.10);
INSERT INTO public.moon VALUES (5, 'Europa', 48.19, 2, 1560.70);
INSERT INTO public.moon VALUES (6, 'Callisto', 107.59, 2, 2410.30);
INSERT INTO public.moon VALUES (7, 'Io', 89.32, 2, 1821.60);
INSERT INTO public.moon VALUES (8, 'Titan', 13455.30, 3, 2575.50);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1.08, 3, 252.10);
INSERT INTO public.moon VALUES (10, 'Triton', 21.39, 5, 1353.40);
INSERT INTO public.moon VALUES (11, 'Charon', 1.53, 6, 606.00);
INSERT INTO public.moon VALUES (12, 'Rhea', 23.12, 3, 764.50);
INSERT INTO public.moon VALUES (13, 'Titania', 3.53, 7, 788.90);
INSERT INTO public.moon VALUES (14, 'Oberon', 3.01, 7, 761.40);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1.27, 7, 584.70);
INSERT INTO public.moon VALUES (16, 'Ariel', 6.59, 7, 578.90);
INSERT INTO public.moon VALUES (17, 'Miranda', 0.66, 7, 235.80);
INSERT INTO public.moon VALUES (18, 'Dione', 10.52, 3, 561.40);
INSERT INTO public.moon VALUES (19, 'Iapetus', 18.50, 3, 734.50);
INSERT INTO public.moon VALUES (20, 'Mimas', 0.38, 3, 198.20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Third planet from the Sun, the only known planet to support life', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 2, 'Fourth planet from the Sun, often called the Red Planet', true, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 'Second planet from the Sun, known for its extreme greenhouse effect', true, false, 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 79, 'Fifth planet from the Sun, largest planet in the Solar System', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 82, 'Sixth planet from the Sun, known for its prominent ring system', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Uranus', 27, 'Seventh planet from the Sun, known for its unique axial tilt', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 14, 'Eighth and farthest known planet from the Sun in the Solar System', true, false, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 0, 'Closest planet to the Sun, smallest planet in the Solar System', true, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 'Dwarf planet in the Kuiper belt, formerly considered the ninth planet', true, false, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 0, 'First Earth-sized exoplanet discovered orbiting within the habitable zone of its star', true, false, 6);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 0, 'Hot Jupiter exoplanet located 63 light-years away from Earth', true, false, 3);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 0, 'One of the Earth-sized exoplanets orbiting the ultra-cool dwarf star TRAPPIST-1', true, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600.00, 'Main sequence star located in the Milky Way galaxy');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 250.00, 'Brightest star in the night sky, part of the Canis Major constellation');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 4, 6000.00, 'Closest star system to the Solar System, part of the Alpha Centauri binary star system');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 8500.00, 'Red supergiant star in the constellation Orion, one of the largest stars known');
INSERT INTO public.star VALUES (5, 'Vega', 1, 455.00, 'Bright star in the constellation Lyra, part of the Summer Triangle asterism');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 2, 4850.00, 'Closest known exoplanetary system to the Solar System, part of the Alpha Centauri system');


--
-- Data for Name: telescope; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.telescope VALUES (1, 'Hubble Space Telescope', 'Low Earth Orbit', 1);
INSERT INTO public.telescope VALUES (2, 'Kepler Space Telescope', 'Heliocentric Orbit', 2);
INSERT INTO public.telescope VALUES (3, 'James Webb Space Telescope', 'Lagrange Point 2', 1);
INSERT INTO public.telescope VALUES (4, 'Chandra X-ray Observatory', 'High Earth Orbit', 1);
INSERT INTO public.telescope VALUES (5, 'Spitzer Space Telescope', 'Heliocentric Orbit', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: telescope_telescope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.telescope_telescope_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: telescope telescope_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_name_key UNIQUE (name);


--
-- Name: telescope telescope_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_pkey PRIMARY KEY (telescope_id);


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
-- Name: telescope telescope_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescope_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

