--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Ubuntu 13.18-1.pgdg22.04+1)
-- Dumped by pg_dump version 13.18 (Ubuntu 13.18-1.pgdg22.04+1)
\c karcin_soc
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
-- Name: kr_corporation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_corporation (
    corporation_id bigint NOT NULL,
    connection_type character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    domain_name character varying(255),
    ip_address_list character varying(255),
    location character varying(255),
    logo text,
    name character varying(255),
    working_hours character varying(255),
    version bigint,
    server_id bigint NOT NULL
);


ALTER TABLE public.kr_corporation OWNER TO postgres;

--
-- Name: kr_corporation_corporation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_corporation_corporation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_corporation_corporation_id_seq OWNER TO postgres;

--
-- Name: kr_corporation_corporation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_corporation_corporation_id_seq OWNED BY public.kr_corporation.corporation_id;


--
-- Name: kr_corporation_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_corporation_status (
    corporation_status_id bigint NOT NULL,
    corporation_id bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    last_online_date timestamp without time zone,
    is_online boolean,
    status character varying(255),
    version bigint
);


ALTER TABLE public.kr_corporation_status OWNER TO postgres;

--
-- Name: kr_corporation_status_corporation_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_corporation_status_corporation_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_corporation_status_corporation_status_id_seq OWNER TO postgres;

--
-- Name: kr_corporation_status_corporation_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_corporation_status_corporation_status_id_seq OWNED BY public.kr_corporation_status.corporation_status_id;


--
-- Name: kr_corporation_status_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_corporation_status_history (
    corporation_status_history_id bigint NOT NULL,
    corporation_id bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    offline_date timestamp without time zone,
    online_date timestamp without time zone,
    version bigint
);


ALTER TABLE public.kr_corporation_status_history OWNER TO postgres;

--
-- Name: kr_corporation_status_history_corporation_status_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_corporation_status_history_corporation_status_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_corporation_status_history_corporation_status_history_id_seq OWNER TO postgres;

--
-- Name: kr_corporation_status_history_corporation_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_corporation_status_history_corporation_status_history_id_seq OWNED BY public.kr_corporation_status_history.corporation_status_history_id;


--
-- Name: kr_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_server (
    server_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    host character varying(255),
    ip_address character varying(255),
    name character varying(255),
    uuid character varying(255),
    version bigint
);


ALTER TABLE public.kr_server OWNER TO postgres;

--
-- Name: kr_server_server_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_server_server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_server_server_id_seq OWNER TO postgres;

--
-- Name: kr_server_server_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_server_server_id_seq OWNED BY public.kr_server.server_id;


--
-- Name: openjpa_sequence_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.openjpa_sequence_table (
    id smallint NOT NULL,
    sequence_value bigint
);


ALTER TABLE public.openjpa_sequence_table OWNER TO postgres;

--
-- Name: template_parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template_parameters (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    parametercode character varying(255),
    parametername character varying(255),
    parametervalue character varying(255),
    version bigint
);


ALTER TABLE public.template_parameters OWNER TO postgres;

--
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id bigint NOT NULL,
    author character varying(255),
    isbn character varying(255),
    publisher character varying(255)
);


ALTER TABLE public.test OWNER TO postgres;

--
-- Name: kr_corporation corporation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_corporation ALTER COLUMN corporation_id SET DEFAULT nextval('public.kr_corporation_corporation_id_seq'::regclass);


--
-- Name: kr_corporation_status corporation_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_corporation_status ALTER COLUMN corporation_status_id SET DEFAULT nextval('public.kr_corporation_status_corporation_status_id_seq'::regclass);


--
-- Name: kr_corporation_status_history corporation_status_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_corporation_status_history ALTER COLUMN corporation_status_history_id SET DEFAULT nextval('public.kr_corporation_status_history_corporation_status_history_id_seq'::regclass);


--
-- Name: kr_server server_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_server ALTER COLUMN server_id SET DEFAULT nextval('public.kr_server_server_id_seq'::regclass);


--
-- Data for Name: kr_corporation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_corporation (corporation_id, connection_type, create_date, is_deleted, description, domain_name, ip_address_list, location, logo, name, working_hours, version, server_id) FROM stdin;
\.


--
-- Data for Name: kr_corporation_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_corporation_status (corporation_status_id, corporation_id, create_date, is_deleted, last_online_date, is_online, status, version) FROM stdin;
\.


--
-- Data for Name: kr_corporation_status_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_corporation_status_history (corporation_status_history_id, corporation_id, create_date, is_deleted, offline_date, online_date, version) FROM stdin;
\.


--
-- Data for Name: kr_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_server (server_id, create_date, is_deleted, host, ip_address, name, uuid, version) FROM stdin;
\.


--
-- Data for Name: openjpa_sequence_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.openjpa_sequence_table (id, sequence_value) FROM stdin;
\.


--
-- Data for Name: template_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_parameters (id, createdate, is_deleted, parametercode, parametername, parametervalue, version) FROM stdin;
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test (id, author, isbn, publisher) FROM stdin;
\.


--
-- Name: kr_corporation_corporation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_corporation_corporation_id_seq', 1, false);


--
-- Name: kr_corporation_status_corporation_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_corporation_status_corporation_status_id_seq', 1, false);


--
-- Name: kr_corporation_status_history_corporation_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_corporation_status_history_corporation_status_history_id_seq', 1, false);


--
-- Name: kr_server_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_server_server_id_seq', 1, false);


--
-- Name: openjpa_sequence_table openjpa_sequence_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.openjpa_sequence_table
    ADD CONSTRAINT openjpa_sequence_table_pkey PRIMARY KEY (id);


--
-- Name: template_parameters template_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameters
    ADD CONSTRAINT template_parameters_pkey PRIMARY KEY (id);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- Name: kr_corporation u_kr_crtn_corporation_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_corporation
    ADD CONSTRAINT u_kr_crtn_corporation_id PRIMARY KEY (corporation_id);


--
-- Name: kr_corporation_status_history u_kr_ctry_corporation_status_history_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_corporation_status_history
    ADD CONSTRAINT u_kr_ctry_corporation_status_history_id PRIMARY KEY (corporation_status_history_id);


--
-- Name: kr_corporation_status u_kr_ctts_corporation_status_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_corporation_status
    ADD CONSTRAINT u_kr_ctts_corporation_status_id PRIMARY KEY (corporation_status_id);


--
-- Name: kr_server u_kr_srvr_server_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_server
    ADD CONSTRAINT u_kr_srvr_server_id PRIMARY KEY (server_id);


--
-- Name: kr_corporation kr_corporation_server_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_corporation
    ADD CONSTRAINT kr_corporation_server_id_fkey FOREIGN KEY (server_id) REFERENCES public.kr_server(server_id) ON DELETE CASCADE DEFERRABLE;


--
-- PostgreSQL database dump complete
--


