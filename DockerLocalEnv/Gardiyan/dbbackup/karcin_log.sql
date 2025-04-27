--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-1.pgdg120+1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-1.pgdg120+1)
\c karcin_log
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
-- Name: kr_queue_class_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_queue_class_configuration (
    id bigint NOT NULL,
    class_path character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    prefetch_count bigint,
    queue_name character varying(255),
    version bigint
);


ALTER TABLE public.kr_queue_class_configuration OWNER TO postgres;

--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_queue_class_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_queue_class_configuration_id_seq OWNER TO postgres;

--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_queue_class_configuration_id_seq OWNED BY public.kr_queue_class_configuration.id;


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
-- Name: kr_queue_class_configuration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_class_configuration ALTER COLUMN id SET DEFAULT nextval('public.kr_queue_class_configuration_id_seq'::regclass);


--
-- Data for Name: kr_queue_class_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_queue_class_configuration (id, class_path, create_date, is_deleted, prefetch_count, queue_name, version) FROM stdin;
1	com.karcin.log.queue.subscribers.interfaces.subscribers.ICriticalRecordSubscriber	2024-09-01 00:00:00	f	50	critical	1
2	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentFileIntegritySubscriber	2024-09-01 00:00:00	f	50	fileintegrity	1
3	com.karcin.log.queue.subscribers.interfaces.subscribers.IHardwareSubscriber	2024-09-01 00:00:00	f	50	hardware	1
4	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentVersionPatchSubscriber	2024-09-01 00:00:00	f	50	patch	1
5	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentPortAlarmSubscriber	2024-09-01 00:00:00	f	50	port	1
6	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentProcessLogSubscriber	2024-09-01 00:00:00	f	50	process_monitor	1
7	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentServiceAlarmSubscriber	2024-09-01 00:00:00	f	50	services	1
8	com.karcin.log.queue.subscribers.interfaces.subscribers.ISoftwareSubscriber	2024-09-01 00:00:00	f	50	software	1
9	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentSoftwareMetricSubscriber	2024-09-01 00:00:00	f	50	softwaremetric	1
10	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentUsbTrackingSubscriber	2024-09-01 00:00:00	f	50	usb-connect	1
11	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentUsbTrackingSubscriber	2024-09-01 00:00:00	f	50	usb-file	1
12	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentUserSubscriber	2024-09-01 00:00:00	f	50	users	1
13	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentVersionPatchSubscriber	2024-09-01 00:00:00	f	50	version	1
14	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentPatchSubscriber	2024-09-01 00:00:00	f	50	patch	1
15	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentUserLoginSubscriber	2024-09-01 00:00:00	f	50	userstatus	1
16	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentUpTimeInfoSubscriber	2024-09-01 00:00:00	f	50	uptimeinfo	1
17	com.karcin.log.queue.subscribers.interfaces.subscribers.IAgentLocationSubscriber	2024-09-01 00:00:00	f	50	location	1
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
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_queue_class_configuration_id_seq', 17, true);


--
-- Name: kr_queue_class_configuration kr_queue_class_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_class_configuration
    ADD CONSTRAINT kr_queue_class_configuration_pkey PRIMARY KEY (id);


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
-- PostgreSQL database dump complete
--

