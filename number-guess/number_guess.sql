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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
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

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (4, 'user_1678358299697', 0, 0);
INSERT INTO public.users VALUES (5, 'user_1678358299696', 0, 0);
INSERT INTO public.users VALUES (6, 'user_1678358372765', 0, 0);
INSERT INTO public.users VALUES (7, 'user_1678358372764', 0, 0);
INSERT INTO public.users VALUES (8, 'user_1678358458471', 0, 0);
INSERT INTO public.users VALUES (9, 'user_1678358458470', 0, 0);
INSERT INTO public.users VALUES (10, 'user_1678358478534', 0, 0);
INSERT INTO public.users VALUES (11, 'user_1678358478533', 0, 0);
INSERT INTO public.users VALUES (12, 'user_1678358854200', 0, 0);
INSERT INTO public.users VALUES (13, 'user_1678358854199', 0, 0);
INSERT INTO public.users VALUES (14, 'Marco', 0, 0);
INSERT INTO public.users VALUES (15, 'user_1678359089469', 0, 0);
INSERT INTO public.users VALUES (16, 'user_1678359089468', 0, 0);
INSERT INTO public.users VALUES (17, 'user_1678359209318', 0, 0);
INSERT INTO public.users VALUES (18, 'user_1678359209317', 0, 0);
INSERT INTO public.users VALUES (19, 'user_1678360089946', 0, 0);
INSERT INTO public.users VALUES (20, 'user_1678360089945', 0, 0);
INSERT INTO public.users VALUES (21, 'user_1678360322883', 0, 0);
INSERT INTO public.users VALUES (22, 'user_1678360322882', 0, 0);
INSERT INTO public.users VALUES (23, 'user_1678360337566', 0, 0);
INSERT INTO public.users VALUES (24, 'user_1678360337565', 0, 0);
INSERT INTO public.users VALUES (25, 'user_1678360343600', 0, 0);
INSERT INTO public.users VALUES (26, 'user_1678360343599', 0, 0);
INSERT INTO public.users VALUES (27, 'user_1678360396015', 0, 0);
INSERT INTO public.users VALUES (28, 'user_1678360396014', 0, 0);
INSERT INTO public.users VALUES (29, 'user_1678360401319', 0, 0);
INSERT INTO public.users VALUES (30, 'user_1678360401318', 0, 0);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 30, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

