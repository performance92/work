--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-1.pgdg120+1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-1.pgdg120+1)
\c guacamole
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

--
-- Name: guacamole_connection_group_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.guacamole_connection_group_type AS ENUM (
    'ORGANIZATIONAL',
    'BALANCING'
);


ALTER TYPE public.guacamole_connection_group_type OWNER TO postgres;

--
-- Name: guacamole_entity_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.guacamole_entity_type AS ENUM (
    'USER',
    'USER_GROUP'
);


ALTER TYPE public.guacamole_entity_type OWNER TO postgres;

--
-- Name: guacamole_object_permission_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.guacamole_object_permission_type AS ENUM (
    'READ',
    'UPDATE',
    'DELETE',
    'ADMINISTER'
);


ALTER TYPE public.guacamole_object_permission_type OWNER TO postgres;

--
-- Name: guacamole_proxy_encryption_method; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.guacamole_proxy_encryption_method AS ENUM (
    'NONE',
    'SSL'
);


ALTER TYPE public.guacamole_proxy_encryption_method OWNER TO postgres;

--
-- Name: guacamole_system_permission_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.guacamole_system_permission_type AS ENUM (
    'CREATE_CONNECTION',
    'CREATE_CONNECTION_GROUP',
    'CREATE_SHARING_PROFILE',
    'CREATE_USER',
    'CREATE_USER_GROUP',
    'ADMINISTER'
);


ALTER TYPE public.guacamole_system_permission_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: guacamole_connection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_connection (
    connection_id integer NOT NULL,
    connection_name character varying(128) NOT NULL,
    parent_id integer,
    protocol character varying(32) NOT NULL,
    max_connections integer,
    max_connections_per_user integer,
    connection_weight integer,
    failover_only boolean DEFAULT false NOT NULL,
    proxy_port integer,
    proxy_hostname character varying(512),
    proxy_encryption_method public.guacamole_proxy_encryption_method
);


ALTER TABLE public.guacamole_connection OWNER TO postgres;

--
-- Name: guacamole_connection_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_connection_attribute (
    connection_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_connection_attribute OWNER TO postgres;

--
-- Name: guacamole_connection_connection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_connection_connection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_connection_connection_id_seq OWNER TO postgres;

--
-- Name: guacamole_connection_connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_connection_connection_id_seq OWNED BY public.guacamole_connection.connection_id;


--
-- Name: guacamole_connection_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_connection_group (
    connection_group_id integer NOT NULL,
    parent_id integer,
    connection_group_name character varying(128) NOT NULL,
    type public.guacamole_connection_group_type DEFAULT 'ORGANIZATIONAL'::public.guacamole_connection_group_type NOT NULL,
    max_connections integer,
    max_connections_per_user integer,
    enable_session_affinity boolean DEFAULT false NOT NULL
);


ALTER TABLE public.guacamole_connection_group OWNER TO postgres;

--
-- Name: guacamole_connection_group_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_connection_group_attribute (
    connection_group_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_connection_group_attribute OWNER TO postgres;

--
-- Name: guacamole_connection_group_connection_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_connection_group_connection_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_connection_group_connection_group_id_seq OWNER TO postgres;

--
-- Name: guacamole_connection_group_connection_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_connection_group_connection_group_id_seq OWNED BY public.guacamole_connection_group.connection_group_id;


--
-- Name: guacamole_connection_group_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_connection_group_permission (
    entity_id integer NOT NULL,
    connection_group_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_connection_group_permission OWNER TO postgres;

--
-- Name: guacamole_connection_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_connection_history (
    history_id integer NOT NULL,
    user_id integer,
    username character varying(128) NOT NULL,
    remote_host character varying(256) DEFAULT NULL::character varying,
    connection_id integer,
    connection_name character varying(128) NOT NULL,
    sharing_profile_id integer,
    sharing_profile_name character varying(128) DEFAULT NULL::character varying,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone
);


ALTER TABLE public.guacamole_connection_history OWNER TO postgres;

--
-- Name: guacamole_connection_history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_connection_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_connection_history_history_id_seq OWNER TO postgres;

--
-- Name: guacamole_connection_history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_connection_history_history_id_seq OWNED BY public.guacamole_connection_history.history_id;


--
-- Name: guacamole_connection_parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_connection_parameter (
    connection_id integer NOT NULL,
    parameter_name character varying(128) NOT NULL,
    parameter_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_connection_parameter OWNER TO postgres;

--
-- Name: guacamole_connection_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_connection_permission (
    entity_id integer NOT NULL,
    connection_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_connection_permission OWNER TO postgres;

--
-- Name: guacamole_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_entity (
    entity_id integer NOT NULL,
    name character varying(128) NOT NULL,
    type public.guacamole_entity_type NOT NULL
);


ALTER TABLE public.guacamole_entity OWNER TO postgres;

--
-- Name: guacamole_entity_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_entity_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_entity_entity_id_seq OWNER TO postgres;

--
-- Name: guacamole_entity_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_entity_entity_id_seq OWNED BY public.guacamole_entity.entity_id;


--
-- Name: guacamole_sharing_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_sharing_profile (
    sharing_profile_id integer NOT NULL,
    sharing_profile_name character varying(128) NOT NULL,
    primary_connection_id integer NOT NULL
);


ALTER TABLE public.guacamole_sharing_profile OWNER TO postgres;

--
-- Name: guacamole_sharing_profile_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_sharing_profile_attribute (
    sharing_profile_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_sharing_profile_attribute OWNER TO postgres;

--
-- Name: guacamole_sharing_profile_parameter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_sharing_profile_parameter (
    sharing_profile_id integer NOT NULL,
    parameter_name character varying(128) NOT NULL,
    parameter_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_sharing_profile_parameter OWNER TO postgres;

--
-- Name: guacamole_sharing_profile_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_sharing_profile_permission (
    entity_id integer NOT NULL,
    sharing_profile_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_sharing_profile_permission OWNER TO postgres;

--
-- Name: guacamole_sharing_profile_sharing_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_sharing_profile_sharing_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_sharing_profile_sharing_profile_id_seq OWNER TO postgres;

--
-- Name: guacamole_sharing_profile_sharing_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_sharing_profile_sharing_profile_id_seq OWNED BY public.guacamole_sharing_profile.sharing_profile_id;


--
-- Name: guacamole_system_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_system_permission (
    entity_id integer NOT NULL,
    permission public.guacamole_system_permission_type NOT NULL
);


ALTER TABLE public.guacamole_system_permission OWNER TO postgres;

--
-- Name: guacamole_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user (
    user_id integer NOT NULL,
    entity_id integer NOT NULL,
    password_hash bytea NOT NULL,
    password_salt bytea,
    password_date timestamp with time zone NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    expired boolean DEFAULT false NOT NULL,
    access_window_start time without time zone,
    access_window_end time without time zone,
    valid_from date,
    valid_until date,
    timezone character varying(64),
    full_name character varying(256),
    email_address character varying(256),
    organization character varying(256),
    organizational_role character varying(256)
);


ALTER TABLE public.guacamole_user OWNER TO postgres;

--
-- Name: guacamole_user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user_attribute (
    user_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_user_attribute OWNER TO postgres;

--
-- Name: guacamole_user_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user_group (
    user_group_id integer NOT NULL,
    entity_id integer NOT NULL,
    disabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.guacamole_user_group OWNER TO postgres;

--
-- Name: guacamole_user_group_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user_group_attribute (
    user_group_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_user_group_attribute OWNER TO postgres;

--
-- Name: guacamole_user_group_member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user_group_member (
    user_group_id integer NOT NULL,
    member_entity_id integer NOT NULL
);


ALTER TABLE public.guacamole_user_group_member OWNER TO postgres;

--
-- Name: guacamole_user_group_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user_group_permission (
    entity_id integer NOT NULL,
    affected_user_group_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_user_group_permission OWNER TO postgres;

--
-- Name: guacamole_user_group_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_user_group_user_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_user_group_user_group_id_seq OWNER TO postgres;

--
-- Name: guacamole_user_group_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_user_group_user_group_id_seq OWNED BY public.guacamole_user_group.user_group_id;


--
-- Name: guacamole_user_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user_history (
    history_id integer NOT NULL,
    user_id integer,
    username character varying(128) NOT NULL,
    remote_host character varying(256) DEFAULT NULL::character varying,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone
);


ALTER TABLE public.guacamole_user_history OWNER TO postgres;

--
-- Name: guacamole_user_history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_user_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_user_history_history_id_seq OWNER TO postgres;

--
-- Name: guacamole_user_history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_user_history_history_id_seq OWNED BY public.guacamole_user_history.history_id;


--
-- Name: guacamole_user_password_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user_password_history (
    password_history_id integer NOT NULL,
    user_id integer NOT NULL,
    password_hash bytea NOT NULL,
    password_salt bytea,
    password_date timestamp with time zone NOT NULL
);


ALTER TABLE public.guacamole_user_password_history OWNER TO postgres;

--
-- Name: guacamole_user_password_history_password_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_user_password_history_password_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_user_password_history_password_history_id_seq OWNER TO postgres;

--
-- Name: guacamole_user_password_history_password_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_user_password_history_password_history_id_seq OWNED BY public.guacamole_user_password_history.password_history_id;


--
-- Name: guacamole_user_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.guacamole_user_permission (
    entity_id integer NOT NULL,
    affected_user_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_user_permission OWNER TO postgres;

--
-- Name: guacamole_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.guacamole_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guacamole_user_user_id_seq OWNER TO postgres;

--
-- Name: guacamole_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.guacamole_user_user_id_seq OWNED BY public.guacamole_user.user_id;


--
-- Name: guacamole_connection connection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection ALTER COLUMN connection_id SET DEFAULT nextval('public.guacamole_connection_connection_id_seq'::regclass);


--
-- Name: guacamole_connection_group connection_group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group ALTER COLUMN connection_group_id SET DEFAULT nextval('public.guacamole_connection_group_connection_group_id_seq'::regclass);


--
-- Name: guacamole_connection_history history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_history ALTER COLUMN history_id SET DEFAULT nextval('public.guacamole_connection_history_history_id_seq'::regclass);


--
-- Name: guacamole_entity entity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_entity ALTER COLUMN entity_id SET DEFAULT nextval('public.guacamole_entity_entity_id_seq'::regclass);


--
-- Name: guacamole_sharing_profile sharing_profile_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile ALTER COLUMN sharing_profile_id SET DEFAULT nextval('public.guacamole_sharing_profile_sharing_profile_id_seq'::regclass);


--
-- Name: guacamole_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user ALTER COLUMN user_id SET DEFAULT nextval('public.guacamole_user_user_id_seq'::regclass);


--
-- Name: guacamole_user_group user_group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group ALTER COLUMN user_group_id SET DEFAULT nextval('public.guacamole_user_group_user_group_id_seq'::regclass);


--
-- Name: guacamole_user_history history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_history ALTER COLUMN history_id SET DEFAULT nextval('public.guacamole_user_history_history_id_seq'::regclass);


--
-- Name: guacamole_user_password_history password_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_password_history ALTER COLUMN password_history_id SET DEFAULT nextval('public.guacamole_user_password_history_password_history_id_seq'::regclass);


--
-- Data for Name: guacamole_connection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_connection (connection_id, connection_name, parent_id, protocol, max_connections, max_connections_per_user, connection_weight, failover_only, proxy_port, proxy_hostname, proxy_encryption_method) FROM stdin;
\.


--
-- Data for Name: guacamole_connection_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_connection_attribute (connection_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- Data for Name: guacamole_connection_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_connection_group (connection_group_id, parent_id, connection_group_name, type, max_connections, max_connections_per_user, enable_session_affinity) FROM stdin;
\.


--
-- Data for Name: guacamole_connection_group_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_connection_group_attribute (connection_group_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- Data for Name: guacamole_connection_group_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_connection_group_permission (entity_id, connection_group_id, permission) FROM stdin;
\.


--
-- Data for Name: guacamole_connection_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_connection_history (history_id, user_id, username, remote_host, connection_id, connection_name, sharing_profile_id, sharing_profile_name, start_date, end_date) FROM stdin;
1	1	guacadmin	10.100.10.76	\N	24 - VNC	\N	\N	2024-12-13 14:45:08.523+00	2024-12-13 14:45:19.997+00
2	1	guacadmin	172.18.0.10	\N	24 - VNC	\N	\N	2024-12-13 14:48:48.276+00	2024-12-13 14:48:58.66+00
4	1	guacadmin	172.19.0.10	\N	27 - VNC	\N	\N	2024-12-27 14:46:53.718+00	2024-12-27 14:46:58.171+00
3	1	guacadmin	172.19.0.10	\N	25 - VNC	\N	\N	2024-12-27 12:16:08.467+00	2024-12-27 12:16:11.991+00
\.


--
-- Data for Name: guacamole_connection_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_connection_parameter (connection_id, parameter_name, parameter_value) FROM stdin;
\.


--
-- Data for Name: guacamole_connection_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_connection_permission (entity_id, connection_id, permission) FROM stdin;
\.


--
-- Data for Name: guacamole_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_entity (entity_id, name, type) FROM stdin;
1	guacadmin	USER
\.


--
-- Data for Name: guacamole_sharing_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_sharing_profile (sharing_profile_id, sharing_profile_name, primary_connection_id) FROM stdin;
\.


--
-- Data for Name: guacamole_sharing_profile_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_sharing_profile_attribute (sharing_profile_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- Data for Name: guacamole_sharing_profile_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_sharing_profile_parameter (sharing_profile_id, parameter_name, parameter_value) FROM stdin;
\.


--
-- Data for Name: guacamole_sharing_profile_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_sharing_profile_permission (entity_id, sharing_profile_id, permission) FROM stdin;
\.


--
-- Data for Name: guacamole_system_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_system_permission (entity_id, permission) FROM stdin;
1	CREATE_CONNECTION
1	CREATE_CONNECTION_GROUP
1	CREATE_SHARING_PROFILE
1	CREATE_USER
1	CREATE_USER_GROUP
1	ADMINISTER
\.


--
-- Data for Name: guacamole_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user (user_id, entity_id, password_hash, password_salt, password_date, disabled, expired, access_window_start, access_window_end, valid_from, valid_until, timezone, full_name, email_address, organization, organizational_role) FROM stdin;
1	1	\\xca458a7d494e3be824f5e1e175a1556c0f8eef2c2d7df3633bec4a29c4411960	\\xfe24adc5e11e2b25288d1704abe67a79e342ecc26064ce69c5b3177795a82264	2023-11-03 14:29:55.844742+00	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: guacamole_user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user_attribute (user_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- Data for Name: guacamole_user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user_group (user_group_id, entity_id, disabled) FROM stdin;
\.


--
-- Data for Name: guacamole_user_group_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user_group_attribute (user_group_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- Data for Name: guacamole_user_group_member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user_group_member (user_group_id, member_entity_id) FROM stdin;
\.


--
-- Data for Name: guacamole_user_group_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user_group_permission (entity_id, affected_user_group_id, permission) FROM stdin;
\.


--
-- Data for Name: guacamole_user_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user_history (history_id, user_id, username, remote_host, start_date, end_date) FROM stdin;
1	1	guacadmin	127.0.0.1	2023-11-06 07:20:02.256+00	\N
2	1	guacadmin	10.100.10.62	2024-12-11 10:56:51.861+00	2024-12-11 11:57:55.763+00
3	1	guacadmin	172.16.20.163	2024-12-11 14:08:11.802+00	2024-12-11 15:08:55.762+00
5	1	guacadmin	172.18.0.10	2024-12-13 14:43:50.86+00	2024-12-13 15:43:55.763+00
6	1	guacadmin	172.18.0.10	2024-12-13 14:44:03.139+00	2024-12-13 15:44:55.762+00
7	1	guacadmin	172.18.0.10	2024-12-13 14:46:26.444+00	2024-12-13 15:46:55.762+00
8	1	guacadmin	172.18.0.10	2024-12-13 14:47:00.123+00	2024-12-13 15:47:55.762+00
9	1	guacadmin	172.18.0.10	2024-12-13 14:47:33.375+00	2024-12-13 15:47:55.765+00
4	1	guacadmin	10.100.10.76	2024-12-13 14:39:04.848+00	2024-12-13 15:48:55.762+00
10	1	guacadmin	172.18.0.10	2024-12-13 14:48:47.168+00	2024-12-13 15:48:55.766+00
11	1	guacadmin	172.19.0.10	2024-12-27 12:16:03.086+00	2024-12-27 13:16:42.254+00
13	1	guacadmin	172.19.0.10	2024-12-27 12:16:37.917+00	2024-12-27 13:16:42.26+00
12	1	guacadmin	172.19.0.10	2024-12-27 12:16:22.021+00	2024-12-27 13:16:42.264+00
14	1	guacadmin	172.19.0.10	2024-12-27 12:17:17.611+00	2024-12-27 13:17:42.253+00
15	1	guacadmin	172.19.0.10	2024-12-27 12:18:03.509+00	2024-12-27 13:18:42.253+00
16	1	guacadmin	172.19.0.10	2024-12-27 14:42:31.159+00	2024-12-27 15:42:42.253+00
18	1	guacadmin	172.19.0.10	2024-12-27 14:43:14.714+00	2024-12-27 15:43:42.253+00
17	1	guacadmin	172.19.0.10	2024-12-27 14:42:47.557+00	2024-12-27 15:43:42.256+00
19	1	guacadmin	172.19.0.10	2024-12-27 14:45:01.506+00	2024-12-27 15:45:42.253+00
20	1	guacadmin	172.19.0.10	2024-12-27 14:45:43.439+00	2024-12-27 15:46:42.253+00
21	1	guacadmin	172.19.0.10	2024-12-27 14:46:47.913+00	2024-12-27 15:47:42.253+00
22	1	guacadmin	10.100.10.50	2024-12-30 13:10:58.3+00	\N
\.


--
-- Data for Name: guacamole_user_password_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user_password_history (password_history_id, user_id, password_hash, password_salt, password_date) FROM stdin;
\.


--
-- Data for Name: guacamole_user_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.guacamole_user_permission (entity_id, affected_user_id, permission) FROM stdin;
1	1	READ
1	1	UPDATE
1	1	ADMINISTER
\.


--
-- Name: guacamole_connection_connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_connection_connection_id_seq', 5, true);


--
-- Name: guacamole_connection_group_connection_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_connection_group_connection_group_id_seq', 1, false);


--
-- Name: guacamole_connection_history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_connection_history_history_id_seq', 4, true);


--
-- Name: guacamole_entity_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_entity_entity_id_seq', 1, true);


--
-- Name: guacamole_sharing_profile_sharing_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_sharing_profile_sharing_profile_id_seq', 1, false);


--
-- Name: guacamole_user_group_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_user_group_user_group_id_seq', 1, false);


--
-- Name: guacamole_user_history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_user_history_history_id_seq', 22, true);


--
-- Name: guacamole_user_password_history_password_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_user_password_history_password_history_id_seq', 1, false);


--
-- Name: guacamole_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.guacamole_user_user_id_seq', 1, true);


--
-- Name: guacamole_connection_group connection_group_name_parent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group
    ADD CONSTRAINT connection_group_name_parent UNIQUE (connection_group_name, parent_id);


--
-- Name: guacamole_connection connection_name_parent; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection
    ADD CONSTRAINT connection_name_parent UNIQUE (connection_name, parent_id);


--
-- Name: guacamole_connection_attribute guacamole_connection_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_attribute
    ADD CONSTRAINT guacamole_connection_attribute_pkey PRIMARY KEY (connection_id, attribute_name);


--
-- Name: guacamole_connection_group_attribute guacamole_connection_group_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group_attribute
    ADD CONSTRAINT guacamole_connection_group_attribute_pkey PRIMARY KEY (connection_group_id, attribute_name);


--
-- Name: guacamole_connection_group_permission guacamole_connection_group_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group_permission
    ADD CONSTRAINT guacamole_connection_group_permission_pkey PRIMARY KEY (entity_id, connection_group_id, permission);


--
-- Name: guacamole_connection_group guacamole_connection_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group
    ADD CONSTRAINT guacamole_connection_group_pkey PRIMARY KEY (connection_group_id);


--
-- Name: guacamole_connection_history guacamole_connection_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_history
    ADD CONSTRAINT guacamole_connection_history_pkey PRIMARY KEY (history_id);


--
-- Name: guacamole_connection_parameter guacamole_connection_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_parameter
    ADD CONSTRAINT guacamole_connection_parameter_pkey PRIMARY KEY (connection_id, parameter_name);


--
-- Name: guacamole_connection_permission guacamole_connection_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_permission
    ADD CONSTRAINT guacamole_connection_permission_pkey PRIMARY KEY (entity_id, connection_id, permission);


--
-- Name: guacamole_connection guacamole_connection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection
    ADD CONSTRAINT guacamole_connection_pkey PRIMARY KEY (connection_id);


--
-- Name: guacamole_entity guacamole_entity_name_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_entity
    ADD CONSTRAINT guacamole_entity_name_scope UNIQUE (type, name);


--
-- Name: guacamole_entity guacamole_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_entity
    ADD CONSTRAINT guacamole_entity_pkey PRIMARY KEY (entity_id);


--
-- Name: guacamole_sharing_profile_attribute guacamole_sharing_profile_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile_attribute
    ADD CONSTRAINT guacamole_sharing_profile_attribute_pkey PRIMARY KEY (sharing_profile_id, attribute_name);


--
-- Name: guacamole_sharing_profile_parameter guacamole_sharing_profile_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile_parameter
    ADD CONSTRAINT guacamole_sharing_profile_parameter_pkey PRIMARY KEY (sharing_profile_id, parameter_name);


--
-- Name: guacamole_sharing_profile_permission guacamole_sharing_profile_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile_permission
    ADD CONSTRAINT guacamole_sharing_profile_permission_pkey PRIMARY KEY (entity_id, sharing_profile_id, permission);


--
-- Name: guacamole_sharing_profile guacamole_sharing_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile
    ADD CONSTRAINT guacamole_sharing_profile_pkey PRIMARY KEY (sharing_profile_id);


--
-- Name: guacamole_system_permission guacamole_system_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_system_permission
    ADD CONSTRAINT guacamole_system_permission_pkey PRIMARY KEY (entity_id, permission);


--
-- Name: guacamole_user_attribute guacamole_user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_attribute
    ADD CONSTRAINT guacamole_user_attribute_pkey PRIMARY KEY (user_id, attribute_name);


--
-- Name: guacamole_user_group_attribute guacamole_user_group_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group_attribute
    ADD CONSTRAINT guacamole_user_group_attribute_pkey PRIMARY KEY (user_group_id, attribute_name);


--
-- Name: guacamole_user_group_member guacamole_user_group_member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group_member
    ADD CONSTRAINT guacamole_user_group_member_pkey PRIMARY KEY (user_group_id, member_entity_id);


--
-- Name: guacamole_user_group_permission guacamole_user_group_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group_permission
    ADD CONSTRAINT guacamole_user_group_permission_pkey PRIMARY KEY (entity_id, affected_user_group_id, permission);


--
-- Name: guacamole_user_group guacamole_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group
    ADD CONSTRAINT guacamole_user_group_pkey PRIMARY KEY (user_group_id);


--
-- Name: guacamole_user_group guacamole_user_group_single_entity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group
    ADD CONSTRAINT guacamole_user_group_single_entity UNIQUE (entity_id);


--
-- Name: guacamole_user_history guacamole_user_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_history
    ADD CONSTRAINT guacamole_user_history_pkey PRIMARY KEY (history_id);


--
-- Name: guacamole_user_password_history guacamole_user_password_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_password_history
    ADD CONSTRAINT guacamole_user_password_history_pkey PRIMARY KEY (password_history_id);


--
-- Name: guacamole_user_permission guacamole_user_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_permission
    ADD CONSTRAINT guacamole_user_permission_pkey PRIMARY KEY (entity_id, affected_user_id, permission);


--
-- Name: guacamole_user guacamole_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user
    ADD CONSTRAINT guacamole_user_pkey PRIMARY KEY (user_id);


--
-- Name: guacamole_user guacamole_user_single_entity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user
    ADD CONSTRAINT guacamole_user_single_entity UNIQUE (entity_id);


--
-- Name: guacamole_sharing_profile sharing_profile_name_primary; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile
    ADD CONSTRAINT sharing_profile_name_primary UNIQUE (sharing_profile_name, primary_connection_id);


--
-- Name: guacamole_connection_attribute_connection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_attribute_connection_id ON public.guacamole_connection_attribute USING btree (connection_id);


--
-- Name: guacamole_connection_group_attribute_connection_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_group_attribute_connection_group_id ON public.guacamole_connection_group_attribute USING btree (connection_group_id);


--
-- Name: guacamole_connection_group_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_group_parent_id ON public.guacamole_connection_group USING btree (parent_id);


--
-- Name: guacamole_connection_group_permission_connection_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_group_permission_connection_group_id ON public.guacamole_connection_group_permission USING btree (connection_group_id);


--
-- Name: guacamole_connection_group_permission_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_group_permission_entity_id ON public.guacamole_connection_group_permission USING btree (entity_id);


--
-- Name: guacamole_connection_history_connection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_history_connection_id ON public.guacamole_connection_history USING btree (connection_id);


--
-- Name: guacamole_connection_history_connection_id_start_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_history_connection_id_start_date ON public.guacamole_connection_history USING btree (connection_id, start_date);


--
-- Name: guacamole_connection_history_end_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_history_end_date ON public.guacamole_connection_history USING btree (end_date);


--
-- Name: guacamole_connection_history_sharing_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_history_sharing_profile_id ON public.guacamole_connection_history USING btree (sharing_profile_id);


--
-- Name: guacamole_connection_history_start_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_history_start_date ON public.guacamole_connection_history USING btree (start_date);


--
-- Name: guacamole_connection_history_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_history_user_id ON public.guacamole_connection_history USING btree (user_id);


--
-- Name: guacamole_connection_parameter_connection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_parameter_connection_id ON public.guacamole_connection_parameter USING btree (connection_id);


--
-- Name: guacamole_connection_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_parent_id ON public.guacamole_connection USING btree (parent_id);


--
-- Name: guacamole_connection_permission_connection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_permission_connection_id ON public.guacamole_connection_permission USING btree (connection_id);


--
-- Name: guacamole_connection_permission_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_connection_permission_entity_id ON public.guacamole_connection_permission USING btree (entity_id);


--
-- Name: guacamole_sharing_profile_attribute_sharing_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_sharing_profile_attribute_sharing_profile_id ON public.guacamole_sharing_profile_attribute USING btree (sharing_profile_id);


--
-- Name: guacamole_sharing_profile_parameter_sharing_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_sharing_profile_parameter_sharing_profile_id ON public.guacamole_sharing_profile_parameter USING btree (sharing_profile_id);


--
-- Name: guacamole_sharing_profile_permission_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_sharing_profile_permission_entity_id ON public.guacamole_sharing_profile_permission USING btree (entity_id);


--
-- Name: guacamole_sharing_profile_permission_sharing_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_sharing_profile_permission_sharing_profile_id ON public.guacamole_sharing_profile_permission USING btree (sharing_profile_id);


--
-- Name: guacamole_sharing_profile_primary_connection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_sharing_profile_primary_connection_id ON public.guacamole_sharing_profile USING btree (primary_connection_id);


--
-- Name: guacamole_system_permission_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_system_permission_entity_id ON public.guacamole_system_permission USING btree (entity_id);


--
-- Name: guacamole_user_attribute_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_attribute_user_id ON public.guacamole_user_attribute USING btree (user_id);


--
-- Name: guacamole_user_group_attribute_user_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_group_attribute_user_group_id ON public.guacamole_user_group_attribute USING btree (user_group_id);


--
-- Name: guacamole_user_group_permission_affected_user_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_group_permission_affected_user_group_id ON public.guacamole_user_group_permission USING btree (affected_user_group_id);


--
-- Name: guacamole_user_group_permission_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_group_permission_entity_id ON public.guacamole_user_group_permission USING btree (entity_id);


--
-- Name: guacamole_user_history_end_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_history_end_date ON public.guacamole_user_history USING btree (end_date);


--
-- Name: guacamole_user_history_start_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_history_start_date ON public.guacamole_user_history USING btree (start_date);


--
-- Name: guacamole_user_history_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_history_user_id ON public.guacamole_user_history USING btree (user_id);


--
-- Name: guacamole_user_history_user_id_start_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_history_user_id_start_date ON public.guacamole_user_history USING btree (user_id, start_date);


--
-- Name: guacamole_user_password_history_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_password_history_user_id ON public.guacamole_user_password_history USING btree (user_id);


--
-- Name: guacamole_user_permission_affected_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_permission_affected_user_id ON public.guacamole_user_permission USING btree (affected_user_id);


--
-- Name: guacamole_user_permission_entity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX guacamole_user_permission_entity_id ON public.guacamole_user_permission USING btree (entity_id);


--
-- Name: guacamole_connection_attribute guacamole_connection_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_attribute
    ADD CONSTRAINT guacamole_connection_attribute_ibfk_1 FOREIGN KEY (connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE CASCADE;


--
-- Name: guacamole_connection_group_attribute guacamole_connection_group_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group_attribute
    ADD CONSTRAINT guacamole_connection_group_attribute_ibfk_1 FOREIGN KEY (connection_group_id) REFERENCES public.guacamole_connection_group(connection_group_id) ON DELETE CASCADE;


--
-- Name: guacamole_connection_group guacamole_connection_group_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group
    ADD CONSTRAINT guacamole_connection_group_ibfk_1 FOREIGN KEY (parent_id) REFERENCES public.guacamole_connection_group(connection_group_id) ON DELETE CASCADE;


--
-- Name: guacamole_connection_group_permission guacamole_connection_group_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group_permission
    ADD CONSTRAINT guacamole_connection_group_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_connection_group_permission guacamole_connection_group_permission_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_group_permission
    ADD CONSTRAINT guacamole_connection_group_permission_ibfk_1 FOREIGN KEY (connection_group_id) REFERENCES public.guacamole_connection_group(connection_group_id) ON DELETE CASCADE;


--
-- Name: guacamole_connection_history guacamole_connection_history_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_history
    ADD CONSTRAINT guacamole_connection_history_ibfk_1 FOREIGN KEY (user_id) REFERENCES public.guacamole_user(user_id) ON DELETE SET NULL;


--
-- Name: guacamole_connection_history guacamole_connection_history_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_history
    ADD CONSTRAINT guacamole_connection_history_ibfk_2 FOREIGN KEY (connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE SET NULL;


--
-- Name: guacamole_connection_history guacamole_connection_history_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_history
    ADD CONSTRAINT guacamole_connection_history_ibfk_3 FOREIGN KEY (sharing_profile_id) REFERENCES public.guacamole_sharing_profile(sharing_profile_id) ON DELETE SET NULL;


--
-- Name: guacamole_connection guacamole_connection_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection
    ADD CONSTRAINT guacamole_connection_ibfk_1 FOREIGN KEY (parent_id) REFERENCES public.guacamole_connection_group(connection_group_id) ON DELETE CASCADE;


--
-- Name: guacamole_connection_parameter guacamole_connection_parameter_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_parameter
    ADD CONSTRAINT guacamole_connection_parameter_ibfk_1 FOREIGN KEY (connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE CASCADE;


--
-- Name: guacamole_connection_permission guacamole_connection_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_permission
    ADD CONSTRAINT guacamole_connection_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_connection_permission guacamole_connection_permission_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_connection_permission
    ADD CONSTRAINT guacamole_connection_permission_ibfk_1 FOREIGN KEY (connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE CASCADE;


--
-- Name: guacamole_sharing_profile_attribute guacamole_sharing_profile_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile_attribute
    ADD CONSTRAINT guacamole_sharing_profile_attribute_ibfk_1 FOREIGN KEY (sharing_profile_id) REFERENCES public.guacamole_sharing_profile(sharing_profile_id) ON DELETE CASCADE;


--
-- Name: guacamole_sharing_profile guacamole_sharing_profile_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile
    ADD CONSTRAINT guacamole_sharing_profile_ibfk_1 FOREIGN KEY (primary_connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE CASCADE;


--
-- Name: guacamole_sharing_profile_parameter guacamole_sharing_profile_parameter_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile_parameter
    ADD CONSTRAINT guacamole_sharing_profile_parameter_ibfk_1 FOREIGN KEY (sharing_profile_id) REFERENCES public.guacamole_sharing_profile(sharing_profile_id) ON DELETE CASCADE;


--
-- Name: guacamole_sharing_profile_permission guacamole_sharing_profile_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile_permission
    ADD CONSTRAINT guacamole_sharing_profile_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_sharing_profile_permission guacamole_sharing_profile_permission_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_sharing_profile_permission
    ADD CONSTRAINT guacamole_sharing_profile_permission_ibfk_1 FOREIGN KEY (sharing_profile_id) REFERENCES public.guacamole_sharing_profile(sharing_profile_id) ON DELETE CASCADE;


--
-- Name: guacamole_system_permission guacamole_system_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_system_permission
    ADD CONSTRAINT guacamole_system_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_attribute guacamole_user_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_attribute
    ADD CONSTRAINT guacamole_user_attribute_ibfk_1 FOREIGN KEY (user_id) REFERENCES public.guacamole_user(user_id) ON DELETE CASCADE;


--
-- Name: guacamole_user guacamole_user_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user
    ADD CONSTRAINT guacamole_user_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_group_attribute guacamole_user_group_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group_attribute
    ADD CONSTRAINT guacamole_user_group_attribute_ibfk_1 FOREIGN KEY (user_group_id) REFERENCES public.guacamole_user_group(user_group_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_group guacamole_user_group_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group
    ADD CONSTRAINT guacamole_user_group_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_group_member guacamole_user_group_member_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group_member
    ADD CONSTRAINT guacamole_user_group_member_entity FOREIGN KEY (member_entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_group_member guacamole_user_group_member_parent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group_member
    ADD CONSTRAINT guacamole_user_group_member_parent FOREIGN KEY (user_group_id) REFERENCES public.guacamole_user_group(user_group_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_group_permission guacamole_user_group_permission_affected_user_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group_permission
    ADD CONSTRAINT guacamole_user_group_permission_affected_user_group FOREIGN KEY (affected_user_group_id) REFERENCES public.guacamole_user_group(user_group_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_group_permission guacamole_user_group_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_group_permission
    ADD CONSTRAINT guacamole_user_group_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_history guacamole_user_history_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_history
    ADD CONSTRAINT guacamole_user_history_ibfk_1 FOREIGN KEY (user_id) REFERENCES public.guacamole_user(user_id) ON DELETE SET NULL;


--
-- Name: guacamole_user_password_history guacamole_user_password_history_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_password_history
    ADD CONSTRAINT guacamole_user_password_history_ibfk_1 FOREIGN KEY (user_id) REFERENCES public.guacamole_user(user_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_permission guacamole_user_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_permission
    ADD CONSTRAINT guacamole_user_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- Name: guacamole_user_permission guacamole_user_permission_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.guacamole_user_permission
    ADD CONSTRAINT guacamole_user_permission_ibfk_1 FOREIGN KEY (affected_user_id) REFERENCES public.guacamole_user(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

