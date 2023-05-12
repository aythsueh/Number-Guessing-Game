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
    best_game integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.number_guess OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.number_guess_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.number_guess_user_id_seq OWNER TO freecodecamp;

--
-- Name: number_guess_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.number_guess_user_id_seq OWNED BY public.number_guess.user_id;


--
-- Name: number_guess user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.number_guess ALTER COLUMN user_id SET DEFAULT nextval('public.number_guess_user_id_seq'::regclass);


--
-- Data for Name: number_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.number_guess VALUES ('user_1683882667424', 0, 0, 13);
INSERT INTO public.number_guess VALUES ('user_1683882667423', 0, 0, 14);
INSERT INTO public.number_guess VALUES ('user_1683882802351', 0, 0, 15);
INSERT INTO public.number_guess VALUES ('user_1683882802350', 0, 0, 16);
INSERT INTO public.number_guess VALUES ('Annie', 0, 3, 12);
INSERT INTO public.number_guess VALUES ('q', 0, 1, 17);
INSERT INTO public.number_guess VALUES ('user_1683884126890', 2, 29, 20);
INSERT INTO public.number_guess VALUES ('user_1683884126891', 3, 42, 19);
INSERT INTO public.number_guess VALUES ('user_1683884195350', 1, 393, 22);
INSERT INTO public.number_guess VALUES ('user_1683884195351', 1, 628, 21);
INSERT INTO public.number_guess VALUES ('annie', 3, 5, 18);
INSERT INTO public.number_guess VALUES ('user_1683885291944', 0, 0, 24);
INSERT INTO public.number_guess VALUES ('user_1683885291945', 2, 61, 23);
INSERT INTO public.number_guess VALUES ('user_1683885510744', 2, 107, 26);
INSERT INTO public.number_guess VALUES ('user_1683885510745', 2, 754, 25);


--
-- Name: number_guess_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.number_guess_user_id_seq', 26, true);


--
-- PostgreSQL database dump complete
--

