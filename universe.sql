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
-- Name: energy_source; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.energy_source (
    energy_source_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.energy_source OWNER TO freecodecamp;

--
-- Name: energy_sources_energy_source_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.energy_sources_energy_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.energy_sources_energy_source_id_seq OWNER TO freecodecamp;

--
-- Name: energy_sources_energy_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.energy_sources_energy_source_id_seq OWNED BY public.energy_source.energy_source_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    type character varying(30),
    size_in_light_year integer,
    mass_scaled_to_one_billion integer
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
    name character varying(30) NOT NULL,
    classification character varying(50),
    planet_id integer,
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
    name character varying(30) NOT NULL,
    has_ring boolean,
    has_life boolean,
    star_id integer,
    different_star_type_visible boolean,
    energy_source_id integer
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
    name character varying(30) NOT NULL,
    type character varying(30),
    galaxy_id integer NOT NULL,
    description text,
    mass_in_solar_mass numeric(5,3)
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
-- Name: energy_source energy_source_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.energy_source ALTER COLUMN energy_source_id SET DEFAULT nextval('public.energy_sources_energy_source_id_seq'::regclass);


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
-- Data for Name: energy_source; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.energy_source VALUES (1, 'Tidal Heating', 'Tidal heating is the process by which the gravitational forces between a planet and its moon (or between a planet and another celestial body) create internal friction and heat within the planet or moon');
INSERT INTO public.energy_source VALUES (2, 'Radioactive Decay', 'the process by which unstable atomic nuclei lose energy by emitting radiation, leading to the formation of more stable nucle');
INSERT INTO public.energy_source VALUES (3, 'Residual Heat', 'the remaining thermal energy from the formation of a planet or moon that has not yet dissipated');
INSERT INTO public.energy_source VALUES (4, 'Solar Energy', 'the energy received from the Sun in the form of electromagnetic radiation');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'Our home galaxy, containing our Solar System', 'Spiral Galaxies', 100000, 1500);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 'The nearest spiral galaxy to the Milky Way and on a collision course with it', 'Spiral Galaxies', 220000, 1230);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way, rich in star-forming regions', 'Irregular Galaxies', 14000, 15);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Another satellite galaxy of the Milky Way, also containing active star formation regions', 'Irregular Galaxies', 7000, 7);
INSERT INTO public.galaxy VALUES (7, 'NGC 2787', 'A lenticular galaxy with a bar and a prominent ring structure', 'Lenticular Galaxies', 5000, 10);
INSERT INTO public.galaxy VALUES (8, 'NGC 5866', 'A lenticular galaxy that appears edge-on from our perspective', 'Lenticular Galaxies', 50000, 150);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Waxing Crescent', 'Based on Phase', 3, 'A sliver of the Moon becomes visible after the New Moon');
INSERT INTO public.moon VALUES (3, 'First Quarter', 'Based on Phase', 3, 'Half of the Moon is illuminated and visible');
INSERT INTO public.moon VALUES (4, 'Waxing Gibbous', 'Based on Phase', 3, 'More than half of the Moon is illuminated but not yet full');
INSERT INTO public.moon VALUES (5, 'Full Moon', 'Based on Phase', 3, 'The entire face of the Moon is illuminated');
INSERT INTO public.moon VALUES (6, 'Waning Gibbous', 'Based on Phase', 3, 'The illuminated part begins to decrease after the Full Moon');
INSERT INTO public.moon VALUES (7, 'Last Quarter', 'Based on Phase', 3, 'Half of the Moon is illuminated and visible, opposite half from the First Quarter');
INSERT INTO public.moon VALUES (8, 'Waning Crescent', 'Based on Phase', 3, 'A small sliver of the Moon is visible before it becomes a New Moon again');
INSERT INTO public.moon VALUES (9, 'Rocky Moons', 'Based on Composition', 3, 'Composed mainly of rock and metal');
INSERT INTO public.moon VALUES (10, 'Icy Moons', 'Based on Composition', 5, 'Contain significant amounts of ice along with rock');
INSERT INTO public.moon VALUES (11, 'Regular Moons', 'Based on Orbital Characteristics', 7, 'Orbit in the same direction as the planet’s rotation, often close to the planet');
INSERT INTO public.moon VALUES (12, 'Irregular Moons', 'Based on Orbital Characteristics', 7, 'Have eccentric or inclined orbits and can orbit in the opposite direction');
INSERT INTO public.moon VALUES (1, 'New Moon', 'Based on Phase', 3, 'The Moon is not visible from Earth as it is between the Earth and Sun');
INSERT INTO public.moon VALUES (13, 'Geologically Active Moons', 'Based on Geological Activity', 5, 'Show signs of geological activity such as volcanism or tectonics. Examples: Io, Europa, Enceladus');
INSERT INTO public.moon VALUES (14, 'Geologically Inactive Moons', 'Based on Geological Activity', 5, 'Lack significant geological activity');
INSERT INTO public.moon VALUES (15, 'Major Moons', 'Based on Size', 5, 'Large moons with significant mass');
INSERT INTO public.moon VALUES (16, 'Dwarf Planet Moons', 'Special Types', 9, 'Orbit dwarf planets');
INSERT INTO public.moon VALUES (17, 'Shepherd Moons', 'Special Types', 9, 'Small moons that orbit within or near a planet’s ring system and help maintain the rings');
INSERT INTO public.moon VALUES (18, 'Trojan Moons', 'Special Types', 5, 'Share an orbit with a larger moon but are located at stable Lagrangian points');
INSERT INTO public.moon VALUES (19, 'Harvest Moon', 'By Influence on Earth', 3, 'The Full Moon nearest to the autumnal equinox');
INSERT INTO public.moon VALUES (20, 'Hunter’s Moon', 'By Influence on Earth', 3, 'The Full Moon following the Harvest Moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, 4, true, 4);
INSERT INTO public.planet VALUES (2, 'Venus', false, false, 4, true, 4);
INSERT INTO public.planet VALUES (3, 'Earth', false, true, 4, true, 4);
INSERT INTO public.planet VALUES (4, 'Mars', false, false, 4, true, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, false, 4, true, 4);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, 3, true, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', true, false, 3, true, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', true, false, 3, true, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', false, false, 3, false, 2);
INSERT INTO public.planet VALUES (10, 'Eris', false, false, 3, false, 2);
INSERT INTO public.planet VALUES (11, 'Haumea', false, false, 3, false, 2);
INSERT INTO public.planet VALUES (12, 'Ceres', false, false, 3, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sirius B', 'White Dwarf Stars', 3, 'A dense, hot white dwarf companion to Sirius A', 1.018);
INSERT INTO public.star VALUES (4, 'Sun', 'Main Sequence Stars', 3, 'The Sun is a medium-sized, yellow star that provides the light and heat necessary for life on Earth', 1.000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Main Sequence Stars', 3, 'Alpha Centauri A is part of the Alpha Centauri star system, the closest star system to the Sun.', 1.100);
INSERT INTO public.star VALUES (6, 'Aldebaran', 'Red Giant Stars', 3, 'The brightest star in the constellation Taurus and is known for its orange-red color. It has expanded and cooled, becoming a red giant', 1.160);
INSERT INTO public.star VALUES (7, 'Antares', 'Red Supergiant Stars', 3, 'Antares is the brightest star in the constellation Scorpius and is known for its deep red color', 12.400);
INSERT INTO public.star VALUES (3, 'Sirius A', 'Main Sequence Stars', 3, 'Sirius A is the primary star of the Sirius star system, the brightest star visible from Earth', 2.020);


--
-- Name: energy_sources_energy_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.energy_sources_energy_source_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: energy_source energy_source_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.energy_source
    ADD CONSTRAINT energy_source_name_key UNIQUE (name);


--
-- Name: energy_source energy_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.energy_source
    ADD CONSTRAINT energy_sources_pkey PRIMARY KEY (energy_source_id);


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
-- Name: planet planet_energy_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_energy_source_id_fkey FOREIGN KEY (energy_source_id) REFERENCES public.energy_source(energy_source_id);


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

