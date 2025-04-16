--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)

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
-- Name: items; Type: TABLE; Schema: public; Owner: krawy
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name character varying(100),
    description text
);


ALTER TABLE public.items OWNER TO krawy;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: krawy
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO krawy;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: krawy
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: krawy
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    route_id integer,
    username character varying(100) NOT NULL,
    rating integer,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.reviews OWNER TO krawy;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: krawy
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO krawy;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: krawy
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: krawy
--

CREATE TABLE public.routes (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    location character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.routes OWNER TO krawy;

--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: krawy
--

CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.routes_id_seq OWNER TO krawy;

--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: krawy
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
-- Name: travel_routes; Type: TABLE; Schema: public; Owner: krawy
--

CREATE TABLE public.travel_routes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    location character varying(255) NOT NULL,
    duration character varying(100) NOT NULL,
    rating integer,
    CONSTRAINT travel_routes_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.travel_routes OWNER TO krawy;

--
-- Name: travel_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: krawy
--

CREATE SEQUENCE public.travel_routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.travel_routes_id_seq OWNER TO krawy;

--
-- Name: travel_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: krawy
--

ALTER SEQUENCE public.travel_routes_id_seq OWNED BY public.travel_routes.id;


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- Name: travel_routes id; Type: DEFAULT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.travel_routes ALTER COLUMN id SET DEFAULT nextval('public.travel_routes_id_seq'::regclass);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: krawy
--

COPY public.items (id, name, description) FROM stdin;
2	pruvet odin	hello
8	dsa	sad
7	sda	dsadadadasdas
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: krawy
--

COPY public.reviews (id, route_id, username, rating, created_at) FROM stdin;
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: krawy
--

COPY public.routes (id, title, description, location, created_at) FROM stdin;
1	Paris Adventure	3-day tour of Paris	France	2025-04-02 13:33:52.422477
\.


--
-- Data for Name: travel_routes; Type: TABLE DATA; Schema: public; Owner: krawy
--

COPY public.travel_routes (id, name, description, location, duration, rating) FROM stdin;
13	2	2	2	2	2
16	1	1	1	1	4
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: krawy
--

SELECT pg_catalog.setval('public.items_id_seq', 8, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: krawy
--

SELECT pg_catalog.setval('public.reviews_id_seq', 1, false);


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: krawy
--

SELECT pg_catalog.setval('public.routes_id_seq', 1, true);


--
-- Name: travel_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: krawy
--

SELECT pg_catalog.setval('public.travel_routes_id_seq', 16, true);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: travel_routes travel_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.travel_routes
    ADD CONSTRAINT travel_routes_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: krawy
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_route_id_fkey FOREIGN KEY (route_id) REFERENCES public.routes(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

