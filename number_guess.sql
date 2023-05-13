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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: number_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.number_guess (
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('user_1683900083747', 1, 678);
INSERT INTO public.number_guess VALUES ('user_1683900083748', 1, 415);
INSERT INTO public.number_guess VALUES ('user_1683903081961', 2, 411);
INSERT INTO public.number_guess VALUES ('user_1683903081962', 4, 370);
INSERT INTO public.number_guess VALUES ('cat', 1, 1);
INSERT INTO public.number_guess VALUES ('dog', 2, 2);
INSERT INTO public.number_guess VALUES ('user_1683903433616', 2, 451);
INSERT INTO public.number_guess VALUES ('user_1683903433617', 4, 102);
INSERT INTO public.number_guess VALUES ('user_1683941675326', 2, 623);
INSERT INTO public.number_guess VALUES ('user_1683942796849', 1, 125);
INSERT INTO public.number_guess VALUES ('user_1683941675327', 5, 140);
INSERT INTO public.number_guess VALUES ('annie', 3, 4);
INSERT INTO public.number_guess VALUES ('flower', 1, 5);
INSERT INTO public.number_guess VALUES ('user_1683942860069', 2, 631);
INSERT INTO public.number_guess VALUES ('user_1683942796850', 5, 475);
INSERT INTO public.number_guess VALUES ('user_1683942432481', 2, 279);
INSERT INTO public.number_guess VALUES ('user_1683942860070', 5, 224);
INSERT INTO public.number_guess VALUES ('user_1683942432482', 4, 112);
INSERT INTO public.number_guess VALUES ('user_1683942811687', 2, 541);
INSERT INTO public.number_guess VALUES ('user_1683942750233', 1, 135);
INSERT INTO public.number_guess VALUES ('user_1683942811688', 5, 107);
INSERT INTO public.number_guess VALUES ('user_1683942750234', 5, 144);
INSERT INTO public.number_guess VALUES ('user_1683942869643', 2, 83);
INSERT INTO public.number_guess VALUES ('user_1683942769955', 2, 418);
INSERT INTO public.number_guess VALUES ('user_1683942820169', 2, 448);
INSERT INTO public.number_guess VALUES ('user_1683942769956', 4, 505);
INSERT INTO public.number_guess VALUES ('user_1683942869644', 5, 168);
INSERT INTO public.number_guess VALUES ('user_1683942820170', 5, 238);
INSERT INTO public.number_guess VALUES ('user_1683942785767', 2, 503);
INSERT INTO public.number_guess VALUES ('user_1683942785768', 4, 239);
INSERT INTO public.number_guess VALUES ('user_1683942829973', 2, 304);
INSERT INTO public.number_guess VALUES ('user_1683942829974', 5, 253);
INSERT INTO public.number_guess VALUES ('user_1683942838831', 2, 456);
INSERT INTO public.number_guess VALUES ('user_1683942838832', 5, 101);
INSERT INTO public.number_guess VALUES ('user_1683942847729', 2, 206);
INSERT INTO public.number_guess VALUES ('user_1683942847730', 4, 269);


--
-- PostgreSQL database dump complete
--

