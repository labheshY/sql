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
-- Name: asteroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroids (
    asteroids_id integer NOT NULL,
    name character varying(20),
    in_solar_system boolean NOT NULL,
    description text,
    size integer,
    diameter integer
);


ALTER TABLE public.asteroids OWNER TO freecodecamp;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroids_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroids_id_seq OWNED BY public.asteroids.asteroids_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    constellation character varying(20),
    type character varying(20) NOT NULL,
    distance integer,
    size integer
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
    planet_id integer,
    name character varying(20) NOT NULL,
    diameter integer NOT NULL,
    description text
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
    star_id integer DEFAULT 2 NOT NULL,
    name character varying(20) NOT NULL,
    has_life boolean NOT NULL,
    distance_in_au integer
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
    galaxy_id integer,
    name character varying(20) NOT NULL,
    type character varying(10),
    color character varying(10),
    diameter integer,
    age numeric
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
-- Name: asteroids asteroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids ALTER COLUMN asteroids_id SET DEFAULT nextval('public.asteroids_asteroids_id_seq'::regclass);


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
-- Data for Name: asteroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroids VALUES (1, 'CERES', true, 'The largest asteroid in our solar system, about a quarter the size of the moon. It orbits the sun in the asteroid belt between Mars and Jupiter.', NULL, NULL);
INSERT INTO public.asteroids VALUES (2, 'VESTA', true, ' The third largest asteroid and one of the brightest main-belt asteroids. It can sometimes be seen with the naked eye.', NULL, NULL);
INSERT INTO public.asteroids VALUES (3, 'PALLAS', true, 'The second largest asteroid', NULL, NULL);
INSERT INTO public.asteroids VALUES (4, 'HYGIEA', true, ' One of the four largest asteroids.', NULL, NULL);
INSERT INTO public.asteroids VALUES (5, 'Oumuamua', false, 'The first confirmed object from another star to visit our solar system. It is a rocky, cigar-shaped object with a reddish hue. The name means "a messenger from afar arriving first" in Hawaiian.', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 'barred spiral', 27000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda', 'barred spiral', 2500000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Pinwheel Galaxy', 'Ursa Major', 'unbarred spiral', 25000000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Sunflower Galaxy', 'Canes Venatici', 'spiral', 37000000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Triangulum', 'spiral', 3070000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Canes Venatici', 'spiral', 23500000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'MOON', 3475, 'The Moon is Earths sole natural satellite and nearest large celestial body. It is a spherical rocky body, probably with a small metallic core, revolving around Earth in a slightly eccentric orbit at a mean distance of about 384,000 km');
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 23, NULL);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 12, NULL);
INSERT INTO public.moon VALUES (4, 5, 'Io', 1821, 'The most volcanically active place in the solar system, with hundreds of volcanoes');
INSERT INTO public.moon VALUES (5, 5, 'Europa', 3100, 'Thought to have an iron core, rocky mantle, and a surface of frozen water ice');
INSERT INTO public.moon VALUES (6, 5, 'Callisto', 2995, 'The oldest icy surface in the solar system, with a surface completely covered with impact craters');
INSERT INTO public.moon VALUES (7, 5, 'Ganymede', 3270, 'The only moon in the solar system with its own magnetic field, which creates a magnetosphere that protects it from radiation');
INSERT INTO public.moon VALUES (15, 6, 'Titan', 3200, 'the second-largest moon in the solar system and the only moon with a dense atmosphere, clouds, and liquid lakes.');
INSERT INTO public.moon VALUES (16, 6, 'Dione', 618, 'It has a dense core and an icy mantle and crust.');
INSERT INTO public.moon VALUES (17, 6, 'Rhea', 960, 'A heavily cratered moon made of ice and rock.');
INSERT INTO public.moon VALUES (18, 6, 'Iapetus', 914, NULL);
INSERT INTO public.moon VALUES (19, 6, 'Tethys', 662, 'orbits close to Saturn. ');
INSERT INTO public.moon VALUES (20, 6, 'Mimas', 246, 'has a crater that makes it look like the Death Star from Star Wars.');
INSERT INTO public.moon VALUES (21, 6, 'Enceladus', 310, 'Has plumes of water near its south pole.');
INSERT INTO public.moon VALUES (22, 7, 'S/2023 U1', 5, 'Orbits Uranus in 680 days. It is likely the smallest of Uranus moons.');
INSERT INTO public.moon VALUES (23, 7, 'Miranda', 290, 'It has a surface with relatively few craters but canyons up to 12 miles deep.');
INSERT INTO public.moon VALUES (24, 7, 'Titania', 981, 'It is the eighth largest moon in the Solar System, with a surface area comparable to that of Australia.');
INSERT INTO public.moon VALUES (25, 8, 'Triton', 1680, 'Triton is the seventh-largest moon in the Solar System and the only large moon that orbits in the opposite direction of its planets rotation');
INSERT INTO public.moon VALUES (26, 8, 'Neso', 37, ' Neso has a highly inclined, eccentric, and retrograde orbit.');
INSERT INTO public.moon VALUES (27, 8, 'Proteus', 129, 'Proteus is close to a sphere, but its shape is slightly elongated in the direction of Neptune');
INSERT INTO public.moon VALUES (28, 8, 'Hippocamp', 20, 'The smallest known moon of Neptune. It is a third-generation satellite, meaning it is a broken-off piece of Proteus.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'MERCURY', false, 1);
INSERT INTO public.planet VALUES (2, 1, 'VENUS', false, 0);
INSERT INTO public.planet VALUES (3, 1, 'EARTH', true, 0);
INSERT INTO public.planet VALUES (4, 1, 'MARS', false, 1);
INSERT INTO public.planet VALUES (5, 1, 'JUPITER', false, 4);
INSERT INTO public.planet VALUES (6, 1, 'SATURN', false, 10);
INSERT INTO public.planet VALUES (7, 1, 'URANUS', false, 19);
INSERT INTO public.planet VALUES (8, 1, 'NEPTUNE', false, 30);
INSERT INTO public.planet VALUES (9, 2, 'PLUTO', false, 36);
INSERT INTO public.planet VALUES (10, 2, 'HAUMEA', false, 51);
INSERT INTO public.planet VALUES (11, 2, 'MAKEMAKE', false, 53);
INSERT INTO public.planet VALUES (12, 2, 'ERIS', false, 95);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G', 'white', NULL, NULL);
INSERT INTO public.star VALUES (2, 3, 'SN 2023ixf', 'Supernova2', 'red', NULL, NULL);
INSERT INTO public.star VALUES (3, 1, 'Sirius', 'binary', 'blue-white', NULL, NULL);
INSERT INTO public.star VALUES (4, 5, 'Delta Trianguli', 'binary', 'yellow', NULL, NULL);
INSERT INTO public.star VALUES (5, 2, 'Mirach', 'giant', 'red', NULL, NULL);
INSERT INTO public.star VALUES (6, 2, 'Alpheratz', 'binary', 'blue-white', NULL, NULL);


--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroids_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 28, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroids asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroids asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroids
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroids_id);


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

