--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-1.pgdg120+1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-1.pgdg120+1)
\c karcin_admin
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
-- Name: kr_admin_general_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_admin_general_setting (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    property_name character varying(255),
    property_value character varying(255),
    version bigint
);


ALTER TABLE public.kr_admin_general_setting OWNER TO postgres;

--
-- Name: kr_agent_credential_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_credential_setting (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    definition character varying(255),
    is_deleted boolean,
    password character varying(255),
    platform character varying(255),
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_credential_setting OWNER TO postgres;

--
-- Name: kr_agent_installation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_installation (
    agent_installation_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    end_date timestamp without time zone,
    end_ip character varying(255),
    end_status boolean,
    modify_date timestamp without time zone,
    organization character varying(255),
    start_ip character varying(255),
    thread_id bigint,
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_installation OWNER TO postgres;

--
-- Name: kr_agent_installation_agent_installation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_installation_agent_installation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_installation_agent_installation_id_seq OWNER TO postgres;

--
-- Name: kr_agent_installation_agent_installation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_installation_agent_installation_id_seq OWNED BY public.kr_agent_installation.agent_installation_id;


--
-- Name: kr_agent_installation_cron; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_installation_cron (
    agent_installation_cron_id bigint NOT NULL,
    client_password character varying(255) NOT NULL,
    client_username character varying(255) NOT NULL,
    create_date timestamp without time zone,
    cron character varying(255) NOT NULL,
    is_deleted boolean,
    end_ip character varying(255) NOT NULL,
    modify_date timestamp without time zone,
    organization character varying(255),
    start_ip character varying(255) NOT NULL,
    status boolean,
    username character varying(255) NOT NULL,
    version bigint
);


ALTER TABLE public.kr_agent_installation_cron OWNER TO postgres;

--
-- Name: kr_agent_installation_cron_agent_installation_cron_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_installation_cron_agent_installation_cron_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_installation_cron_agent_installation_cron_id_seq OWNER TO postgres;

--
-- Name: kr_agent_installation_cron_agent_installation_cron_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_installation_cron_agent_installation_cron_id_seq OWNED BY public.kr_agent_installation_cron.agent_installation_cron_id;


--
-- Name: kr_agent_installation_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_installation_details (
    agent_installation_details_id bigint NOT NULL,
    agent_install_id bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    hostname character varying(255),
    ip_address character varying(255),
    organization character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_installation_details OWNER TO postgres;

--
-- Name: kr_agent_installation_details_agent_installation_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_installation_details_agent_installation_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_installation_details_agent_installation_details_id_seq OWNER TO postgres;

--
-- Name: kr_agent_installation_details_agent_installation_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_installation_details_agent_installation_details_id_seq OWNED BY public.kr_agent_installation_details.agent_installation_details_id;


--
-- Name: kr_agent_scan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_scan (
    agent_scan_id bigint NOT NULL,
    baseip character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_scan OWNER TO postgres;

--
-- Name: kr_agent_scan_agent_scan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_scan_agent_scan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_scan_agent_scan_id_seq OWNER TO postgres;

--
-- Name: kr_agent_scan_agent_scan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_scan_agent_scan_id_seq OWNED BY public.kr_agent_scan.agent_scan_id;


--
-- Name: kr_auth_group_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_auth_group_details (
    id bigint NOT NULL,
    applicationtype character varying(20),
    createdate timestamp without time zone,
    is_deleted boolean,
    username character varying(255),
    version bigint,
    auth_groups_id bigint
);


ALTER TABLE public.kr_auth_group_details OWNER TO postgres;

--
-- Name: kr_auth_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_auth_groups (
    id bigint NOT NULL,
    applicationtype character varying(20),
    authorizedgroup boolean,
    createdate timestamp without time zone,
    is_deleted boolean,
    groupname character varying(255),
    version bigint
);


ALTER TABLE public.kr_auth_groups OWNER TO postgres;

--
-- Name: kr_client_dn_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_client_dn_history (
    id bigint NOT NULL,
    agentid bigint,
    client character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    newdn character varying(255),
    olddn character varying(255),
    version bigint
);


ALTER TABLE public.kr_client_dn_history OWNER TO postgres;

--
-- Name: kr_client_threshold_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_client_threshold_values (
    id bigint NOT NULL,
    application character varying(255),
    cpu bigint,
    createdate timestamp without time zone,
    is_deleted boolean,
    disk bigint,
    ram bigint,
    version bigint
);


ALTER TABLE public.kr_client_threshold_values OWNER TO postgres;

--
-- Name: kr_configuration_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_configuration_management (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    property_name character varying(255),
    property_value character varying(255),
    version bigint
);


ALTER TABLE public.kr_configuration_management OWNER TO postgres;

--
-- Name: kr_email_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_email_setting (
    id bigint NOT NULL,
    address character varying(255),
    application character varying(20),
    applicationservice character varying(27),
    createdate timestamp without time zone,
    is_deleted boolean,
    phone character varying(255),
    smsstatus boolean,
    status boolean,
    version bigint,
    message_template bigint
);


ALTER TABLE public.kr_email_setting OWNER TO postgres;

--
-- Name: kr_email_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_email_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_email_setting_id_seq OWNER TO postgres;

--
-- Name: kr_email_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_email_setting_id_seq OWNED BY public.kr_email_setting.id;


--
-- Name: kr_exception_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_exception_history (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    mailstatus boolean,
    version bigint
);


ALTER TABLE public.kr_exception_history OWNER TO postgres;

--
-- Name: kr_exception_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_exception_setting (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    status boolean,
    version bigint
);


ALTER TABLE public.kr_exception_setting OWNER TO postgres;

--
-- Name: kr_general_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_general_setting (
    id bigint NOT NULL,
    accesskey character varying(255),
    application character varying(255),
    clientfolder character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    logo character varying(255),
    name character varying(255),
    secretkey character varying(255),
    serverfolder character varying(255),
    version bigint
);


ALTER TABLE public.kr_general_setting OWNER TO postgres;

--
-- Name: kr_ip_port_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_ip_port_setting (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    ip character varying(255),
    name character varying(255),
    port character varying(255),
    version bigint
);


ALTER TABLE public.kr_ip_port_setting OWNER TO postgres;

--
-- Name: kr_karaf_control_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_karaf_control_setting (
    id bigint NOT NULL,
    code character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    ipaddress character varying(255),
    name character varying(255),
    password character varying(255),
    status character varying(255),
    username character varying(255),
    value character varying(255),
    version bigint
);


ALTER TABLE public.kr_karaf_control_setting OWNER TO postgres;

--
-- Name: kr_karaf_hour_control; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_karaf_hour_control (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    message character varying(255),
    module_code character varying(255),
    module_name character varying(255),
    status character varying(255),
    version bigint
);


ALTER TABLE public.kr_karaf_hour_control OWNER TO postgres;

--
-- Name: kr_ldap_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_ldap_setting (
    id bigint NOT NULL,
    agentldapbasedn character varying(255),
    agentldapidattribute character varying(255),
    agentldapjidattribute character varying(255),
    agentldapobjectclasses character varying(255),
    allowselfsignedcert boolean,
    application character varying(20),
    createdate timestamp without time zone,
    is_deleted boolean,
    password character varying(255),
    port character varying(255),
    rootdn character varying(255),
    searchattributes character varying(255),
    server character varying(255),
    sslstatus boolean,
    tlsstatus boolean,
    userldapbasedn character varying(255),
    userldapidattribute character varying(255),
    userldapobjectclasses character varying(255),
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_ldap_setting OWNER TO postgres;

--
-- Name: kr_message_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_message_template (
    id bigint NOT NULL,
    application character varying(20),
    applicationservice character varying(27),
    create_date timestamp without time zone,
    is_deleted boolean,
    message text,
    messagetype character varying(20),
    template_name character varying(255),
    version bigint
);


ALTER TABLE public.kr_message_template OWNER TO postgres;

--
-- Name: kr_message_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_message_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_message_template_id_seq OWNER TO postgres;

--
-- Name: kr_message_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_message_template_id_seq OWNED BY public.kr_message_template.id;


--
-- Name: kr_message_template_logo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_message_template_logo (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    logo_name character varying(255),
    version bigint,
    message_template_id bigint
);


ALTER TABLE public.kr_message_template_logo OWNER TO postgres;

--
-- Name: kr_message_template_logo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_message_template_logo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_message_template_logo_id_seq OWNER TO postgres;

--
-- Name: kr_message_template_logo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_message_template_logo_id_seq OWNED BY public.kr_message_template_logo.id;


--
-- Name: kr_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_modules (
    id bigint NOT NULL,
    applicationtype character varying(20),
    category character varying(22),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    feature character varying(255),
    method character varying(255),
    operationname character varying(255),
    processor character varying(255),
    type character varying(255),
    version bigint,
    code character varying(255),
    modulename character varying(255),
    processorname character varying(255)
);


ALTER TABLE public.kr_modules OWNER TO postgres;

--
-- Name: kr_operation_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_operation_history (
    id bigint NOT NULL,
    application character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    transaction character varying(255),
    user0 character varying(255),
    version bigint
);


ALTER TABLE public.kr_operation_history OWNER TO postgres;

--
-- Name: kr_pam_ldap_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_pam_ldap_setting (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    hostname character varying(255),
    ipaddress character varying(255),
    operatingsystem character varying(255),
    password character varying(255),
    protocol character varying(255),
    rdpport bigint,
    sshport bigint,
    telnetport bigint,
    username character varying(255),
    vncport bigint,
    version bigint
);


ALTER TABLE public.kr_pam_ldap_setting OWNER TO postgres;

--
-- Name: kr_pre_deploy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_pre_deploy (
    id bigint NOT NULL,
    contents text,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    ip_list character varying(4000),
    script_name character varying(255),
    scripttype character varying(20),
    version bigint
);


ALTER TABLE public.kr_pre_deploy OWNER TO postgres;

--
-- Name: kr_pre_deploy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_pre_deploy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_pre_deploy_id_seq OWNER TO postgres;

--
-- Name: kr_pre_deploy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_pre_deploy_id_seq OWNED BY public.kr_pre_deploy.id;


--
-- Name: kr_pxe_boot_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_pxe_boot_setting (
    id bigint NOT NULL,
    connectiontype character varying(255),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    filepath character varying(255),
    host character varying(255),
    name character varying(255),
    password character varying(255),
    port integer,
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_pxe_boot_setting OWNER TO postgres;

--
-- Name: kr_service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_service (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint
);


ALTER TABLE public.kr_service OWNER TO postgres;

--
-- Name: kr_user_authorized_dn_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_authorized_dn_modules (
    id bigint NOT NULL,
    authactions smallint,
    createdate timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    version bigint,
    auth_groups_id bigint,
    modules_id bigint
);


ALTER TABLE public.kr_user_authorized_dn_modules OWNER TO postgres;

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
-- Name: kr_agent_installation agent_installation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation ALTER COLUMN agent_installation_id SET DEFAULT nextval('public.kr_agent_installation_agent_installation_id_seq'::regclass);


--
-- Name: kr_agent_installation_cron agent_installation_cron_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_cron ALTER COLUMN agent_installation_cron_id SET DEFAULT nextval('public.kr_agent_installation_cron_agent_installation_cron_id_seq'::regclass);


--
-- Name: kr_agent_installation_details agent_installation_details_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_details ALTER COLUMN agent_installation_details_id SET DEFAULT nextval('public.kr_agent_installation_details_agent_installation_details_id_seq'::regclass);


--
-- Name: kr_agent_scan agent_scan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_scan ALTER COLUMN agent_scan_id SET DEFAULT nextval('public.kr_agent_scan_agent_scan_id_seq'::regclass);


--
-- Name: kr_email_setting id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_email_setting ALTER COLUMN id SET DEFAULT nextval('public.kr_email_setting_id_seq'::regclass);


--
-- Name: kr_message_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_message_template ALTER COLUMN id SET DEFAULT nextval('public.kr_message_template_id_seq'::regclass);


--
-- Name: kr_message_template_logo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_message_template_logo ALTER COLUMN id SET DEFAULT nextval('public.kr_message_template_logo_id_seq'::regclass);


--
-- Name: kr_pre_deploy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pre_deploy ALTER COLUMN id SET DEFAULT nextval('public.kr_pre_deploy_id_seq'::regclass);


--
-- Data for Name: kr_admin_general_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_admin_general_setting (id, application, createdate, is_deleted, property_name, property_value, version) FROM stdin;
1	client	2024-12-11 11:28:29.155	f	general.dashboard.maptags	sunucu	2
110	client	2022-05-11 12:23:28.482	f	general.emailhost.sslstatus	true	1
111	client	2022-05-11 12:23:28.497	f	general.emailhost.port	587	1
112	client	2022-05-11 12:23:28.513	f	general.emailhost.application	client	1
118	client	2022-05-11 12:23:28.62	f	general.log.port	3333	1
104	client	2022-05-11 12:23:28.383	f	general.vulnerability.defaultipblock	\N	2
106	client	2022-05-11 12:23:28.419	f	general.vulnerability.application	\N	2
103	client	2022-05-11 12:23:28.366	f	general.vulnerability.notificationstatus	\N	2
1252	client	2023-09-13 16:07:00.045	f	general.usage.setting.rdp	any	1
1253	client	2023-09-13 16:07:14.876	f	general.usage.setting.show.macAddress	true	1
1255	client	2023-09-13 16:07:51.285	f	general.usage.setting.show.file.content	true	1
1258	client	2023-09-13 16:08:52.776	f	general.usage.setting.show.pingModal	true	1
1259	client	2023-09-13 16:11:07.695	f	general.usage.setting.session.time	1h	1
1260	client	2023-09-13 16:11:26.457	f	general.usage.setting.policy.followup	true	1
1262	client	2023-09-13 16:11:56.192	f	general.usage.setting.ssh.port	22	1
1264	client	2023-09-13 16:12:20.376	f	general.usage.setting.changeClientUserPass	true	1
1268	client	2023-09-13 16:13:37.168	f	general.usage.setting.show.map	false	1
1451	client	2023-10-04 17:37:03.526	f	general.usage.setting.show.networkData	enable	1
1352	client	2023-10-04 15:03:31.447	f	general.usage.setting.domainSubnetMatch.enable	disable	2
1266	client	2023-09-13 16:13:15.326	f	general.usage.setting.remoteRecord	true	3
1351	client	2023-10-04 15:03:14.162	f	general.usage.setting.recordList	false	3
1267	client	2023-09-13 16:13:25.344	f	general.usage.setting.fileIntegrityMonitoring	true	3
139094	client	2024-04-15 16:46:32.788	f	general.vulnerability.openvas.secretkey	Bearer t9342b1bb8307ft67h6930d611c32853	1
139086	client	2024-04-15 16:45:29.498	f	 general.vulnerability.openvas.username	admin	1
139088	client	2024-04-15 16:45:49.495	f	general.vulnerability.openvas.path	/run/gvmd/gvmd.sock	1
139089	client	2024-04-15 16:45:55.947	f	 general.vulnerability.openvas.portlistId	33d0cd82-57c6-11e1-8ed1-406186ea4fc5	1
139090	client	2024-04-15 16:46:03.657	f	general.vulnerability.openvas.configId	daba56c8-73ec-11df-a475-002264764cea	1
139091	client	2024-04-15 16:46:11.622	f	general.vulnerability.openvas.scannerId	08b69003-5fc2-4037-a479-93b440211c73	1
139093	client	2024-04-15 16:46:24.627	f	general.vulnerability.openvas.port	8050	1
3152	client	2024-04-29 16:20:49.084	f	general.autoprovision.schedule.minutes	30	1
3153	client	2024-04-29 16:21:17.721	f	general.usage.setting.browserhistory	true	1
3154	client	2024-04-29 16:21:38.016	f	general.usage.setting.enablewallpaper	true	1
3155	client	2024-04-29 16:24:31.905	f	general.usage.setting.screenrecord	true	1
101	client	2022-05-11 12:23:28.309	f	general.company.name	Çekino Bilgi Teknolojileri A.Ş.	3
2801	client	2024-04-27 18:50:02.522	f	general.usage.setting.pamTabs	true	4
115	client	2022-05-11 12:23:28.565	f	general.emailhost.fromname	Gardiyan	3
116	client	2022-05-11 12:23:28.584	f	general.emailhost.from	gardiyan.pam@cekino.com	2
114	client	2022-05-11 12:23:28.549	f	general.emailhost.host	smtp-mail.outlook.com	2
1652	client	2023-10-11 13:43:49.439	f	general.emailhost.relayStatus	false	3
33652	client	2024-09-16 10:07:58.779	f	general.usage.setting. hasEndpointSecurity	true	1
1651	client	2023-10-11 13:42:26.787	f	general.usage.setting.performanceInfo	true	2
113	client	2022-05-11 12:23:28.53	f	general.emailhost.password	Ojn/iSwl4Tb+aeX6Q73K1Q==	4
1263	client	2023-09-13 16:12:08.539	f	general.usage.setting.transferFile	true	3
19601	client	2024-07-22 16:35:49.552	f	general.usage.setting.processTracking	true	1
109	client	2022-05-11 12:23:28.467	f	general.vulnerability.serverfolder	14	2
108	client	2022-05-11 12:23:28.45	f	general.vulnerability.secretkey	1386dedd0a1ea579273aba3c028669c54862d2aac471f636a2b6100ca8218aea	14
105	client	2022-05-11 12:23:28.401	f	general.vulnerability.clientfolder	14	2
19602	client	2024-07-30 17:52:12.74	f	general.allowCustomizedNotifications	true	1
33651	client	2024-09-16 10:07:41.903	f	general.usage.setting.endPointSecurity	true	1
3151	pam	2024-04-29 16:20:04.146	f	general.usage.setting.session.time	1h	4
1261	client	2023-09-13 16:11:39.383	f	general.usage.setting.show.wakeUpButton	true	3
33653	client	2024-09-16 17:15:11.109	f	general.usage.setting.policy.lastTenPolicy	true	1
62501	client	2024-10-25 15:21:00.322	f	general.usage.setting.psWebServer	true	1
15451	client	2024-07-12 13:41:44.997	f	general.usage.setting.diskTracking	true	3
1256	client	2023-09-13 16:08:07.382	f	general.usage.setting.show.hiddenFiles	true	3
62502	client	2024-10-25 15:21:58.091	f	general.vulnerability.xcitum.host.device	https://api-gw.itsm-us1.comodo.com/api/v2/itsm/devices/	1
62503	client	2024-10-25 15:22:22.441	f	general.vulnerability.xcitum.host.scan	https://api-gw.itsm-us1.comodo.com/api/v2/itsm/security/manage/	1
62504	client	2024-10-25 15:22:41.632	f	general.vulnerability.xcitum.accesToken	CONESSO 23658ab8-1a36-4d66-9b93-b7b8a2b2501b	1
62505	client	2024-10-25 15:23:00.9	f	general.usage.setting.endPointSecurity.XCITIUM	true	1
62506	client	2024-10-25 15:45:09.802	f	general.usage.setting.usbTracking	true	1
62507	client	2024-10-25 15:45:37.089	f	general.usage.setting.vncexit	false	1
107	client	2022-05-11 12:23:28.434	f	general.vulnerability.accesskey	7d63fa44e1cd2802fff3935f817fde3025850762b5a85c10597e449414cbebd2	14
1251	client	2023-09-13 15:20:57.031	f	general.usage.setting.static.speedTest	localhost	2
117	client	2022-05-11 12:23:28.603	f	general.log.host	localhost	3
102	client	2022-05-11 12:23:28.346	f	general.company.logo	a4ebd831306048bdba123e1312b2555e.png	5
66753	pam	2024-11-01 10:34:09.435	f	general.usage.setting.commandRestriction	true	1
3054	client	2024-04-29 10:10:01.83	f	general.usage.setting.vulnerability.type	openVas	6
41601	client	2024-09-21 15:23:02.043	f	general.setting.remote.connection.host	172.16.21.117	3
139092	client	2024-04-15 16:46:18.309	f	general.vulnerability.openvas.host	172.16.21.117	4
66751	client	2024-10-30 13:46:25.372	f	general.setting.remote.connection.port.start	10001	3
66752	client	2024-10-30 13:46:49.957	f	general.setting.remote.connection.port.end	10010	2
92101	client	2024-11-26 10:55:39.648	f	general.usage.setting.workerManagerSettings	true	1
2152	client	2024-01-16 13:07:56.927	f	general.usage.setting.sharedconnectionpermission	true	15
100901	client	2024-12-05 16:50:22.3	t	general.usage.setting.remoteConnectionContent	tuna böyle istedi	3
100902	client	2024-12-11 17:21:47.318	f	general.usage.setting.isolate	false	2
100903	client	2024-12-12 08:53:27.991	f	general.usage.setting.packetLoss	true	1
100904	client	2024-12-12 14:55:03.378	f	general.usage.setting.wireless	true	1
139087	client	2024-04-15 16:45:42.607	f	general.vulnerability.openvas.pass	admin	2
\.


--
-- Data for Name: kr_agent_credential_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_credential_setting (id, createdate, definition, is_deleted, password, platform, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_installation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_installation (agent_installation_id, create_date, is_deleted, end_date, end_ip, end_status, modify_date, organization, start_ip, thread_id, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_installation_cron; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_installation_cron (agent_installation_cron_id, client_password, client_username, create_date, cron, is_deleted, end_ip, modify_date, organization, start_ip, status, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_installation_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_installation_details (agent_installation_details_id, agent_install_id, create_date, is_deleted, description, hostname, ip_address, organization, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_scan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_scan (agent_scan_id, baseip, create_date, is_deleted, name, version) FROM stdin;
\.


--
-- Data for Name: kr_auth_group_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_auth_group_details (id, applicationtype, createdate, is_deleted, username, version, auth_groups_id) FROM stdin;
101	client	2024-12-11 13:56:04.428	f	admin	1	51
102	pam	2024-12-11 14:02:26.343	f	admin	1	52
\.


--
-- Data for Name: kr_auth_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_auth_groups (id, applicationtype, authorizedgroup, createdate, is_deleted, groupname, version) FROM stdin;
51	client	\N	2024-12-11 13:56:00.668	f	Teknik Grup	1
52	pam	t	2024-12-11 14:02:22.248	f	Admin	1
\.


--
-- Data for Name: kr_client_dn_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_client_dn_history (id, agentid, client, createdate, is_deleted, newdn, olddn, version) FROM stdin;
\.


--
-- Data for Name: kr_client_threshold_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_client_threshold_values (id, application, cpu, createdate, is_deleted, disk, ram, version) FROM stdin;
\.


--
-- Data for Name: kr_configuration_management; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_configuration_management (id, application, createdate, is_deleted, property_name, property_value, version) FROM stdin;
\.


--
-- Data for Name: kr_email_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_email_setting (id, address, application, applicationservice, createdate, is_deleted, phone, smsstatus, status, version, message_template) FROM stdin;
\.


--
-- Data for Name: kr_exception_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_exception_history (id, application, createdate, is_deleted, description, mailstatus, version) FROM stdin;
\.


--
-- Data for Name: kr_exception_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_exception_setting (id, application, createdate, is_deleted, status, version) FROM stdin;
\.


--
-- Data for Name: kr_general_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_general_setting (id, accesskey, application, clientfolder, createdate, is_deleted, logo, name, secretkey, serverfolder, version) FROM stdin;
\.


--
-- Data for Name: kr_ip_port_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_ip_port_setting (id, createdate, is_deleted, ip, name, port, version) FROM stdin;
\.


--
-- Data for Name: kr_karaf_control_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_karaf_control_setting (id, code, createdate, is_deleted, ipaddress, name, password, status, username, value, version) FROM stdin;
\.


--
-- Data for Name: kr_karaf_hour_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_karaf_hour_control (id, createdate, is_deleted, message, module_code, module_name, status, version) FROM stdin;
\.


--
-- Data for Name: kr_ldap_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_ldap_setting (id, agentldapbasedn, agentldapidattribute, agentldapjidattribute, agentldapobjectclasses, allowselfsignedcert, application, createdate, is_deleted, password, port, rootdn, searchattributes, server, sslstatus, tlsstatus, userldapbasedn, userldapidattribute, userldapobjectclasses, username, version) FROM stdin;
\.


--
-- Data for Name: kr_message_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_message_template (id, application, applicationservice, create_date, is_deleted, message, messagetype, template_name, version) FROM stdin;
\.


--
-- Data for Name: kr_message_template_logo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_message_template_logo (id, create_date, is_deleted, logo_name, version, message_template_id) FROM stdin;
\.


--
-- Data for Name: kr_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_modules (id, applicationtype, category, createdate, is_deleted, description, feature, method, operationname, processor, type, version, code, modulename, processorname) FROM stdin;
1161	client	generalPowers	2021-09-10 17:12:02.514	f	Koleksiyonlar sayfasını görüntüleme yetkisi.	collectionDefinitions	informationById	Koleksiyon sayfası görüntülendi.	collectionDashboard	id	1	\N	\N	\N
1162	client	generalPowers	2021-09-10 17:12:11.896	f	Program Tanımları sayfasını görüntüleme yetkisi.	programDefinitions	add	Yeni program tanımı yapıldı.	programFile	all	1	\N	\N	\N
1165	client	clientMonitoring	2021-09-10 17:13:14.449	f	Log Kayıtları sekmesi altındaki ekran videolarını izleme yetkisi.	logRecordsWatchVideos	findByProperties	Log kayıtları görüntülendi.	agentRemoteConnection	id	1	\N	\N	\N
1167	client	clientManagement	2021-09-10 17:25:32.638	f	Uzak Bağlantı bileşenini yönetme yetkisi.	remoteConnection	add	Uzak bağlantı bileşeni kullandı.	agentRemoteConnection	id	1	\N	\N	\N
1170	client	clientManagement	2021-09-10 17:26:07.774	f	Betik Çalıştır bileşenini yönetme yetkisi.	scriptExecution	execute	Betik çalıştırıldı.	taskRequest	id	1	\N	\N	\N
1185	client	organizationSecurity	2021-09-10 17:45:04.179	f	Politika Çalıştır sekmesini yönetme yetkisi.	policyExecution	executedPoliciesByDn	Çalıştırılan politikalar görüntülendi.	organizationDashboard	dn	1	\N	\N	\N
1651	client	clientSecurity	2021-09-11 20:18:25.975	f	Güncellemeler sekmesini yönetme yetkisi.	updates	patchListByAgentId	Kurulan güncellemeler sayfası görüntülendi.	clientDashboard	id	1	\N	\N	\N
1184	client	organizationManagement	2021-09-10 17:44:53.469	f	Program Yükle sekmesini görüntüleme yetkisi.	installProgram	start	Program yükleme bileşeni kullanıldı.	agentProgramInstall	dn	1	\N	\N	\N
1183	client	organizationManagement	2021-09-10 17:44:41.203	f	Betik Çalıştır sekmesini yönetme yetkisi.	scriptExecution	executeScript	Organizasyonda betik çalıştırıldı.	organizationDashboard	dn	1	\N	\N	\N
1652	client	generalPowers	2021-09-11 20:18:25.975	f	Lisans Bilgileri sayfasını görüntüleme yetkisi.	licenseInformation	\N	\N	\N	\N	1	\N	\N	\N
1653	client	generalPowers	2021-09-11 20:18:25.975	f	İstemci Senkronizasyonu sayfasını görüntüleme yetkisi.	clientSync	\N	\N	\N	\N	1	\N	\N	\N
1654	client	generalPowers	2021-09-11 20:18:25.975	f	Kullanıcı Senkronizasyonu sayfasını görüntüleme yetkisi.	userSync	\N	\N	\N	\N	1	\N	\N	\N
2000	client	clientSecurity	2021-09-10 17:10:51.598	f	Politika tabini için görüntüleme ve senkronize etme yetkisi.	policyFollowUp	\N	\N	\N	\N	\N	\N	\N	\N
2001	client	clientManagement	2021-09-10 17:10:51.598	f	Uzak bağlantı yöntemleri için konfigürasyon yetkisi.	remoteConnectionConfig	\N	\N	\N	\N	1	\N	\N	\N
93701	client	clientMonitoring	2023-01-10 10:39:35.234	f	İstemci Disk Klasörlerini görüntüleme yetkisi.	clientFolders		\N		\N	1	\N	\N	\N
117401	client	generalPowers	2023-02-28 15:08:40.361	f	Sol menü <b>Klasör</b> düzenleme yetkisi.	folderTree		\N		\N	1	\N	\N	\N
117402	client	clientManagement	2023-03-01 10:54:52.722	f	Kritik seviye ayarları  için konfigürasyon yetkisi.	adjustCriticalLevelsConfig		\N		\N	1	\N	\N	\N
117403	client	clientManagement	2023-03-01 10:57:37.258	f	İstemci Kaldırabilme konfigürasyon yetkisi.	agentDeleteConfig		\N		\N	1	\N	\N	\N
117404	client	clientManagement	2023-03-01 10:59:15.042	f	Zafiyet taraması için konfigürasyon yetkisi.	vulnerabilitySettingsConfig		\N		\N	1	\N	\N	\N
117405	client	clientManagement	2023-03-01 11:04:10.339	f	Mail bildirimi periyodu için konfigürasyon yetkisi.	notificationMailSettingsConfig		\N		\N	1	\N	\N	\N
117406	client	clientManagement	2023-03-01 11:05:15.542	f	Hizmet takibi konfigürasyon yetkisi.	serviceTrackingConfig		\N		\N	2	\N	\N	\N
117408	client	clientManagement	2023-03-01 13:12:23.42	f	İstemciyi Merkezden Kapatma konfigürasyon yetkisi.	powerSaveConfig		\N		\N	1	\N	\N	\N
117409	client	clientManagement	2023-03-01 13:13:01.068	f	Port takibi konfigürasyon yetkisi.	portTrackingConfig		\N		\N	1	\N	\N	\N
117410	client	organizationManagement	2023-03-01 15:55:44.2	f	Kritik seviye ayarları  için konfigürasyon yetkisi.	adjustCriticalLevelsConfig		\N		\N	1	\N	\N	\N
117412	client	organizationManagement	2023-03-01 15:57:38.973	f	Zafiyet taraması için konfigürasyon yetkisi.	vulnerabilitySettingsConfig		\N		\N	1	\N	\N	\N
117413	client	organizationManagement	2023-03-01 15:57:54.344	f	Mail bildirimi periyodu için konfigürasyon yetkisi.	notificationMailSettingsConfig		\N		\N	1	\N	\N	\N
117414	client	organizationManagement	2023-03-01 15:58:22.746	f	Hizmet takibi konfigürasyon yetkisi.	serviceTrackingConfig		\N		\N	1	\N	\N	\N
117411	client	organizationManagement	2023-03-01 15:57:21.437	f	Uzak bağlantı yöntemleri için konfigürasyon yetkisi.	remoteConnectionConfig		\N		\N	2	\N	\N	\N
117415	client	organizationManagement	2023-03-01 16:15:49.862	f	Port takibi konfigürasyon yetkisi.	portTrackingConfig		\N		\N	1	\N	\N	\N
117416	client	organizationManagement	2023-03-01 16:16:34.192	f	İstemciyi Merkezden Kapatma konfigürasyon yetkisi.	powerSaveConfig		\N		\N	1	\N	\N	\N
151951	client	organizationManagement	2023-04-17 14:31:13.783	f	İstemciyi Periyodik Kaldırma Yetkisi	clientsRemoveConfig		\N		\N	1	\N	\N	\N
151952	client	organizationManagement	2023-04-18 15:01:32.15	f	Toplu Program Kaldırma Yetkisi	uninstalProgramList		\N		\N	1	\N	\N	\N
151953	client	organizationSecurity	2023-04-18 16:03:47.986	f	Politika tabini için görüntüleme ve senkronize etme yetkisi.	policyFollowUp		\N		\N	1	\N	\N	\N
188101	client	clientSecurity	2023-08-18 10:59:26.279	f	Ağ Bağlantı Bilgileri	networkInformation		\N		\N	1	\N	\N	\N
188102	client	clientManagement	2023-03-01 13:13:01.068	f	Port takibi konfigürasyon yetkisi.	portTrackingConfig	\N	\N	\N	\N	1	\N	\N	\N
188103	client	generalPowers	2023-03-01 13:13:01.068	f	Toplu Ekran Görüntüleme	collectViewScreen	\N	\N	\N	\N	1	\N	\N	\N
32501	client	generalPowers	2024-01-16 14:28:19.725	f	Ekran Kaydetme Yetkisi	selectedRecordComputer		\N		\N	2	\N	\N	\N
78778	client	generalPowers	2021-09-11 20:18:25.975	f	Dinamik Buton Tanımlama	dynamicButtonInformation	\N	\N	\N	\N	1	\N	\N	\N
78779	client	clientManagement	2021-09-10 17:28:17.963	f	Dinamik Button İşlemleri	buttonExecution	\N	\N	\N	id	1	\N	\N	\N
1163	client	generalPowers	2021-09-10 17:12:21.622	f	Görev Listesi Tanımları sayfasını görüntüleme yetkisi.	taskListDefinitions		\N		\N	1	\N	\N	\N
1164	client	clientMonitoring	2021-09-10 17:13:04.465	f	Kaynak Kullanımı görüntüleme yetkisi.	resourceUsage		\N		\N	1	\N	\N	\N
1168	client	clientManagement	2021-09-10 17:25:43.874	f	Güç Seçenekleri bileşenini yönetme yetkisi.	powerOptions		\N		\N	1	\N	\N	\N
1169	client	clientManagement	2021-09-10 17:25:56.847	f	Donanım Kısıtları bileşenini yönetme yetkisi.	hardwareConstraints		\N		\N	1	\N	\N	\N
1171	client	clientManagement	2021-09-10 17:26:19.141	f	Hizmetler sekmesini yönetme yetkisi.	services		\N		\N	1	\N	\N	\N
1172	client	clientManagement	2021-09-10 17:26:29.952	f	Aygıt Yöneticisi sekmesini yönetme yetkisi.	deviceManager		\N		\N	1	\N	\N	\N
1175	client	clientSecurity	2021-09-10 17:27:34.667	f	Antivirüs Durumu bileşenini yönetme yetkisi.	antivirusStatus		\N		\N	1	\N	\N	\N
1176	client	clientSecurity	2021-09-10 17:27:56.479	f	Zafiyet Taraması bileşenini yönetme yetkisi.	vulnerability		\N		\N	1	\N	\N	\N
1177	client	clientSecurity	2021-09-10 17:28:07.274	f	İşlem Listesi sekmesini görüntüleme yetkisi.	processList		\N		\N	1	\N	\N	\N
1180	client	clientSecurity	2021-09-10 17:28:41.299	f	Ağ Yapılandırması sekmesini yönetme yetkisi.	networkConfiguration		\N		\N	1	\N	\N	\N
1181	client	clientSecurity	2021-09-10 17:29:01.334	f	Güvenlik Duvarı sekmesini yönetme yetkisi.	firewall		\N		\N	1	\N	\N	\N
1154	client	generalPowers	2021-09-10 17:10:51.598	f	Sol menü <b>Organizasyon Ağacı</b> yetkisi.	organizationTree	summaryByAgentId	Cihaz bilgileri görüntülendi.	clientDashboard	id	1	\N	\N	\N
1157	client	generalPowers	2021-09-10 17:11:23.169	f	Kullanıcılar sayfasını görüntüleme yetkisi.	usersPage	findByProperties	Kullanıcı sayfası görüntülendi.	agentUser	id	1	\N	\N	\N
1155	client	generalPowers	2021-09-10 17:11:02.406	f	Sol menü <b>Koleksiyon</b> yetkisi.	collectionTree	getFilterResultById	Koleksiyonlar görüntülendi.	collectionDashboard	all	1	\N	\N	\N
1156	client	generalPowers	2021-09-10 17:11:12.254	f	Yama Yönetimi sayfasını görüntüleme yetkisi.	patchManagement	runCommand	Yama yönetimi sayfasında işlem yapıldı.	WSUSDashboard	all	1	\N	\N	\N
1158	client	generalPowers	2021-09-10 17:11:32.939	f	Worker Dosyaları sayfasını görüntüleme yetkisi.	workerFiles	findAll	Worker dosyaları tanımlama sayfası görüntülendi.	agentFile	all	1	\N	\N	\N
1159	client	generalPowers	2021-09-10 17:11:43.557	f	Betik Tanımları sayfasını görüntüleme yetkisi.	scriptDefinitions	add	Yeni betik tanımı oluşturuldu.	scriptFile	all	1	\N	\N	\N
1160	client	generalPowers	2021-09-10 17:11:52.814	f	Politika Tanımları sayfasını görüntüleme yetkisi.	policyDefinitions	add	Yeni betik tanımı oluşturuldu.	scriptFile	all	1	\N	\N	\N
1166	client	clientMonitoring	2021-09-10 17:13:24.066	f	Olay Günlüğü sekmesini görüntüleme yetkisi.	eventLog		\N		\N	1	\N	\N	\N
188106	pam	generalPowers	2023-10-03 08:30:00	f	Koleksiyon	collection	agentListTree	\N	mainDashboard	\N	1	\N	\N	\N
1655	client	clientManagement	2021-09-11 20:18:25.975	f	Paylaşımlı bağlantı yapılırken kullanıcıdan izin alma yetkisi.	unauthorizedShared	\N	\N	\N	\N	\N	\N	\N	\N
1173	client	clientManagement	2021-09-10 17:26:40.619	f	Mesaj Gönder sekmesini yönetme yetkisi.	sendMessage	send	Mesaj gönderildi.	agentMessage	id	1	\N	\N	\N
1174	client	clientManagement	2021-09-10 17:27:07.953	f	Programlar sekmesini yönetme yetkisi.	programs	findByProperties	Programlar görüntülendi.	agentSoftware	id	1	\N	\N	\N
1178	client	clientSecurity	2021-09-10 17:28:17.963	f	Betik Çalıştır sekmesini yönetme yetkisi.	scriptExecution	executeScript	Betik çalıştırıldı.	taskRequest	id	1	\N	\N	\N
1179	client	clientSecurity	2021-09-10 17:28:30.45	f	Politika Çalıştır sekmesini yönetme yetkisi.	policyExecution	execute	Politika çalıştırıldı.	policy	id	1	\N	\N	\N
1182	client	organizationManagement	2021-09-10 17:44:28.313	f	Mesaj Gönder sekmesini yönetme yetkisi.	sendMessage	send	Mesaj gönderildi.	agentMessage	dn	1	\N	\N	\N
117407	client	clientManagement	2023-03-01 11:06:28.488	f	Usb monitor ayarları için konfigürasyon yetkisi.	usbMonitorSettingsConfig		\N		\N	1	\N	\N	\N
188105	client	clientSecurity	2023-08-18 10:59:26.279	f	Kayıt zamanlayıcısı.	screenRecordConfig	\N	\N	\N	\N	\N	\N	\N	\N
1147	pam	otherPowers	2023-10-03 08:30:00	f	Şifre Geçmişi Görüntüleme	showCaseUserPasswordHistory	\N	\N	\N	\N	1	\N	\N	\N
1148	pam	generalPowers	2023-10-03 08:30:00	f	Şifre Periyodu	passwordPeriod	agentListTree	\N	mainDashboard	\N	1	\N	\N	\N
1117	pam	pamDisplayPanelViewing	2023-10-03 08:30:00	f	Varlıklar	assets	agentListTree	\N	mainDashboard	\N	1	\N	\N	\N
1123	pam	pamClientViewing	2023-10-03 08:30:00	f	Oturum Geçmişi	sessionHistory	last5ConnectedUser	\N	mainDashboard	\N	1	\N	\N	\N
1115	pam	generalPowers	2023-10-03 08:30:00	f	Dizin	index	agentListTree	\N	mainDashboard	\N	1	\N	\N	\N
1114	pam	generalPowers	2023-10-03 08:30:00	f	Varlıklar	assets	agentListTree	\N	mainDashboard	\N	1	\N	\N	\N
1119	pam	pamDisplayPanelViewing	2023-10-03 08:30:00	f	Kullanıcılar	users	\N	\N	\N	\N	1	\N	\N	\N
1121	pam	pamDisplayPanelViewing	2023-10-03 08:30:00	f	Son Bağlanan Kullanıcılar	lastConnectedUsers	\N	\N	\N	\N	1	\N	\N	\N
1126	pam	pamClientViewing	2023-10-03 08:30:00	f	Log Kayıtları - Yetkilendirme	authorizationLog	\N	\N	\N	\N	1	\N	\N	\N
1146	pam	userAuthorizations	2023-10-03 08:30:00	f	Oturum Kullanıcılarını Kasaya Ekleme/Kaldırma	sessionUsersAddingRemoving	\N	\N	\N	\N	1	\N	\N	\N
146	pam	otherPowers	2023-10-03 08:30:00	f	Kimlik Yönetim Kullanıcılarına Cihaz Erişimi	agentUserAuthorization	\N	\N	\N	\N	1	\N	\N	\N
1149	pam	userAuthorizations	2023-10-03 08:30:00	f	Kullanıcı Senkronize Etme	syncUser	\N	\N	\N	\N	1	\N	\N	\N
1150	pam	pamClientViewing	2023-10-03 08:30:00	f	Son Bağlantı	last5Connection	\N	\N	\N	\N	1	\N	\N	\N
1133	pam	remoteConnectionAuth	2023-10-03 08:30:00	f	Anlık Bağlantı İzleme	connectionMonitoring	\N	\N	\N	\N	1	\N	\N	\N
1124	pam	pamClientViewing	2023-10-03 08:30:00	f	Log Kayıtları - Uzaktan Bağlantı	remoteConnectionLog	\N	\N	\N	\N	1	\N	\N	\N
1125	pam	pamClientViewing	2023-10-03 08:30:00	f	Log Kayıtları - Aksiyon	actionLog	\N	\N	\N	\N	1	\N	\N	\N
1127	pam	pamClientViewing	2023-10-03 08:30:00	f	Uzak Bağlantı	remoteConnection	\N	\N	\N	\N	1	\N	\N	\N
1128	pam	pamClientViewing	2023-10-03 08:30:00	f	Kimlik Yönetimi Kullanıcıları	identityManagementUsers	\N	\N	\N	\N	1	\N	\N	\N
1129	pam	pamClientViewing	2023-10-03 08:30:00	f	Oturum Kullanıcıları	sessionUsers	\N	\N	\N	\N	1	\N	\N	\N
1130	pam	pamClientViewing	2023-10-03 08:30:00	f	Kasa Kullanıcıları	caseUsers	\N	\N	\N	\N	1	\N	\N	\N
1118	pam	pamDisplayPanelViewing	2023-10-03 08:30:00	f	Açık Bağlantı Sayısı	numberOfOpenConnections	\N	\N	\N	\N	1	\N	\N	\N
1120	pam	pamDisplayPanelViewing	2023-10-03 08:30:00	f	Yapılan İşlem Sayısı	numberOfTransactionsMade	\N	\N	\N	\N	1	\N	\N	\N
1122	pam	pamDisplayPanelViewing	2023-10-03 08:30:00	f	Son Bağlantılar	recentLinks	\N	\N	\N	\N	1	\N	\N	\N
1111	pam	pamClientViewing	2023-10-03 08:30:00	f	İstemci Detayları	clientDetails	\N	\N	\N	\N	1	\N	\N	\N
1112	pam	pamClientViewing	2023-10-03 08:30:00	f	İstemci Erişim Geçmişi	clientAccessHistory	\N	\N	\N	\N	1	\N	\N	\N
1134	pam	remoteConnectionAuth	2023-10-03 08:30:00	f	Anlık Bağlantı Durdurma	connectionPause	\N	\N	\N	\N	1	\N	\N	\N
1116	pam	generalPowers	2023-10-03 08:30:00	f	Klasör	folderDirectory	folderListTree	\N	mainDashboard	\N	1	\N	\N	\N
1136	pam	organizationTree	2023-10-03 08:30:00	f	İstemci Tanımlama	clientDefinition	\N	\N	\N	\N	1	\N	\N	\N
1137	pam	organizationTree	2023-10-03 08:30:00	f	Klasör Tanımlama	folderDefinition	\N	\N	\N	\N	1	\N	\N	\N
1138	pam	otherPowers	2023-10-03 08:30:00	f	Bağlantı Talep Yetkisi	connectionRequest	\N	\N	\N	\N	1	\N	\N	\N
1139	pam	otherPowers	2023-10-03 08:30:00	f	Şifre Periyodu	passwordPeriod	\N	\N	\N	\N	1	\N	\N	\N
1140	pam	otherPowers	2023-10-03 08:30:00	f	Dosya Transferi	fileTransfer	\N	\N	\N	\N	1	\N	\N	\N
1142	pam	userAuthorizations	2023-10-03 08:30:00	f	Kimlik Yönetimi Kullanıcılarını Ekleme/Yetkilendirme	authUserAddingAuthorization	\N	\N	\N	\N	1	\N	\N	\N
1143	pam	userAuthorizations	2023-10-03 08:30:00	f	Kasa Kullanıcılarını Cihaza Ekleme	addingCaseUsertoDevice	\N	\N	\N	\N	1	\N	\N	\N
1144	pam	userAuthorizations	2023-10-03 08:30:00	f	Kasa Kullanıcılarını Manuel Şifre Değiştirme	caseUsersChangePassword	\N	\N	\N	\N	1	\N	\N	\N
1145	pam	userAuthorizations	2023-10-03 08:30:00	f	Kasa Kullanıcı Tanımlama	caseUserDefinition	\N	\N	\N	\N	1	\N	\N	\N
1152	pam	pamDisplayPanelViewing	2023-10-03 08:30:00	f	Kullanıcı Raporu Görüntüleme	reportView	\N	\N	\N	\N	1	\N	\N	\N
1151	pam	userAuthorizations	2023-10-03 08:30:00	f	Koleksiyon Tanımlama	collectionDefinition	\N	\N	\N	\N	1	\N	\N	\N
7877091	client	clientManagement	2021-09-10 17:28:17.963	f	Paylaşımlı RDP Uzak Bağlantı	rdpRemoteConnection	\N	\N	\N	id	1	\N	\N	\N
7870791	client	clientManagement	2021-09-10 17:28:17.963	f	Paylaşımlı VNC Uzak Bağlantı	vncRemoteConnection	\N	\N	\N	id	1	\N	\N	\N
7807791	client	clientManagement	2021-09-10 17:28:17.963	f	Paylaşımlı SSH Uzak Bağlantı	sshRemoteConnection	\N	\N	\N	id	1	\N	\N	\N
7877910	client	clientManagement	2021-09-10 17:28:17.963	f	Paylaşımlı telnet Uzak Bağlantı	telnetRemoteConnection	\N	\N	\N	id	1	\N	\N	\N
\.


--
-- Data for Name: kr_operation_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_operation_history (id, application, createdate, is_deleted, description, transaction, user0, version) FROM stdin;
\.


--
-- Data for Name: kr_pam_ldap_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_pam_ldap_setting (id, createdate, is_deleted, dn, hostname, ipaddress, operatingsystem, password, protocol, rdpport, sshport, telnetport, username, vncport, version) FROM stdin;
\.


--
-- Data for Name: kr_pre_deploy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_pre_deploy (id, contents, create_date, is_deleted, description, ip_list, script_name, scripttype, version) FROM stdin;
\.


--
-- Data for Name: kr_pxe_boot_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_pxe_boot_setting (id, connectiontype, createdate, is_deleted, description, filepath, host, name, password, port, username, version) FROM stdin;
\.


--
-- Data for Name: kr_service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_service (id, createdate, is_deleted, name, version) FROM stdin;
\.


--
-- Data for Name: kr_user_authorized_dn_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_authorized_dn_modules (id, authactions, createdate, is_deleted, dn, version, auth_groups_id, modules_id) FROM stdin;
151	0	2024-12-11 13:59:29.624	f	=	1	51	1185
152	0	2024-12-11 13:59:29.652	f	=	1	51	151953
153	0	2024-12-11 13:59:29.671	f	=	1	51	1154
154	0	2024-12-11 13:59:29.693	f	=	1	51	1155
155	0	2024-12-11 13:59:29.721	f	=	1	51	1156
156	0	2024-12-11 13:59:29.742	f	=	1	51	1157
157	0	2024-12-11 13:59:29.766	f	=	1	51	1158
158	0	2024-12-11 13:59:29.787	f	=	1	51	1159
159	0	2024-12-11 13:59:29.814	f	=	1	51	1160
160	0	2024-12-11 13:59:29.834	f	=	1	51	1161
161	0	2024-12-11 13:59:29.852	f	=	1	51	1162
162	0	2024-12-11 13:59:29.872	f	=	1	51	1163
163	0	2024-12-11 13:59:29.893	f	=	1	51	1652
164	0	2024-12-11 13:59:29.912	f	=	1	51	1653
165	0	2024-12-11 13:59:29.929	f	=	1	51	1654
166	0	2024-12-11 13:59:29.95	f	=	1	51	32501
167	0	2024-12-11 13:59:29.973	f	=	1	51	78778
168	0	2024-12-11 13:59:29.991	f	=	1	51	117401
169	0	2024-12-11 13:59:30.011	f	=	1	51	188103
170	0	2024-12-11 13:59:30.03	f	=	1	51	1175
171	0	2024-12-11 13:59:30.051	f	=	1	51	1176
172	0	2024-12-11 13:59:30.071	f	=	1	51	1177
173	0	2024-12-11 13:59:30.098	f	=	1	51	1178
174	0	2024-12-11 13:59:30.121	f	=	1	51	1179
175	0	2024-12-11 13:59:30.139	f	=	1	51	1180
176	0	2024-12-11 13:59:30.163	f	=	1	51	1181
177	0	2024-12-11 13:59:30.183	f	=	1	51	1651
178	0	2024-12-11 13:59:30.222	f	=	1	51	2000
179	0	2024-12-11 13:59:30.246	f	=	1	51	188101
180	0	2024-12-11 13:59:30.272	f	=	1	51	188105
181	0	2024-12-11 13:59:30.296	f	=	1	51	1164
182	0	2024-12-11 13:59:30.324	f	=	1	51	1165
183	0	2024-12-11 13:59:30.353	f	=	1	51	1166
184	0	2024-12-11 13:59:30.387	f	=	1	51	93701
185	0	2024-12-11 13:59:30.409	f	=	1	51	1182
186	0	2024-12-11 13:59:30.436	f	=	1	51	1183
187	0	2024-12-11 13:59:30.457	f	=	1	51	1184
188	0	2024-12-11 13:59:30.478	f	=	1	51	117410
189	0	2024-12-11 13:59:30.499	f	=	1	51	117411
190	0	2024-12-11 13:59:30.524	f	=	1	51	117412
191	0	2024-12-11 13:59:30.553	f	=	1	51	117413
192	0	2024-12-11 13:59:30.578	f	=	1	51	117414
193	0	2024-12-11 13:59:30.605	f	=	1	51	117415
194	0	2024-12-11 13:59:30.623	f	=	1	51	117416
195	0	2024-12-11 13:59:30.642	f	=	1	51	151951
196	0	2024-12-11 13:59:30.664	f	=	1	51	151952
197	0	2024-12-11 13:59:30.687	f	=	1	51	1167
198	0	2024-12-11 13:59:30.71	f	=	1	51	1168
199	0	2024-12-11 13:59:30.73	f	=	1	51	1169
200	0	2024-12-11 13:59:30.761	f	=	1	51	1170
201	0	2024-12-11 13:59:30.784	f	=	1	51	1171
202	0	2024-12-11 13:59:30.814	f	=	1	51	1172
203	0	2024-12-11 13:59:30.837	f	=	1	51	1173
204	0	2024-12-11 13:59:30.86	f	=	1	51	1174
205	0	2024-12-11 13:59:30.885	f	=	1	51	1655
206	0	2024-12-11 13:59:30.914	f	=	1	51	2001
207	0	2024-12-11 13:59:30.942	f	=	1	51	78779
208	0	2024-12-11 13:59:30.962	f	=	1	51	117402
209	0	2024-12-11 13:59:30.982	f	=	1	51	117403
210	0	2024-12-11 13:59:31.005	f	=	1	51	117404
211	0	2024-12-11 13:59:31.028	f	=	1	51	117405
212	0	2024-12-11 13:59:31.047	f	=	1	51	117406
213	0	2024-12-11 13:59:31.07	f	=	1	51	117407
214	0	2024-12-11 13:59:31.094	f	=	1	51	117408
215	0	2024-12-11 13:59:31.115	f	=	1	51	117409
216	0	2024-12-11 13:59:31.136	f	=	1	51	188102
217	0	2024-12-11 13:59:31.162	f	=	1	51	7807791
218	0	2024-12-11 13:59:31.199	f	=	1	51	7870791
219	0	2024-12-11 13:59:31.225	f	=	1	51	7877091
220	0	2024-12-11 13:59:31.245	f	=	1	51	7877910
\.


--
-- Data for Name: openjpa_sequence_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.openjpa_sequence_table (id, sequence_value) FROM stdin;
0	251
\.


--
-- Data for Name: template_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_parameters (id, createdate, is_deleted, parametercode, parametername, parametervalue, version) FROM stdin;
\.


--
-- Name: kr_agent_installation_agent_installation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_installation_agent_installation_id_seq', 1, false);


--
-- Name: kr_agent_installation_cron_agent_installation_cron_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_installation_cron_agent_installation_cron_id_seq', 1, false);


--
-- Name: kr_agent_installation_details_agent_installation_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_installation_details_agent_installation_details_id_seq', 1, false);


--
-- Name: kr_agent_scan_agent_scan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_scan_agent_scan_id_seq', 1, false);


--
-- Name: kr_email_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_email_setting_id_seq', 1, false);


--
-- Name: kr_message_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_message_template_id_seq', 1, false);


--
-- Name: kr_message_template_logo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_message_template_logo_id_seq', 1, false);


--
-- Name: kr_pre_deploy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_pre_deploy_id_seq', 1, false);


--
-- Name: kr_admin_general_setting kr_admin_general_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_admin_general_setting
    ADD CONSTRAINT kr_admin_general_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_credential_setting kr_agent_credential_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_credential_setting
    ADD CONSTRAINT kr_agent_credential_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_scan kr_agent_scan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_scan
    ADD CONSTRAINT kr_agent_scan_pkey PRIMARY KEY (agent_scan_id);


--
-- Name: kr_auth_group_details kr_auth_group_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auth_group_details
    ADD CONSTRAINT kr_auth_group_details_pkey PRIMARY KEY (id);


--
-- Name: kr_auth_groups kr_auth_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auth_groups
    ADD CONSTRAINT kr_auth_groups_pkey PRIMARY KEY (id);


--
-- Name: kr_client_dn_history kr_client_dn_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_client_dn_history
    ADD CONSTRAINT kr_client_dn_history_pkey PRIMARY KEY (id);


--
-- Name: kr_client_threshold_values kr_client_threshold_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_client_threshold_values
    ADD CONSTRAINT kr_client_threshold_values_pkey PRIMARY KEY (id);


--
-- Name: kr_configuration_management kr_configuration_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_configuration_management
    ADD CONSTRAINT kr_configuration_management_pkey PRIMARY KEY (id);


--
-- Name: kr_email_setting kr_email_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_email_setting
    ADD CONSTRAINT kr_email_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_exception_history kr_exception_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_exception_history
    ADD CONSTRAINT kr_exception_history_pkey PRIMARY KEY (id);


--
-- Name: kr_exception_setting kr_exception_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_exception_setting
    ADD CONSTRAINT kr_exception_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_general_setting kr_general_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_general_setting
    ADD CONSTRAINT kr_general_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_ip_port_setting kr_ip_port_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ip_port_setting
    ADD CONSTRAINT kr_ip_port_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_karaf_control_setting kr_karaf_control_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_karaf_control_setting
    ADD CONSTRAINT kr_karaf_control_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_karaf_hour_control kr_karaf_hour_control_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_karaf_hour_control
    ADD CONSTRAINT kr_karaf_hour_control_pkey PRIMARY KEY (id);


--
-- Name: kr_ldap_setting kr_ldap_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_setting
    ADD CONSTRAINT kr_ldap_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_message_template_logo kr_message_template_logo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_message_template_logo
    ADD CONSTRAINT kr_message_template_logo_pkey PRIMARY KEY (id);


--
-- Name: kr_message_template kr_message_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_message_template
    ADD CONSTRAINT kr_message_template_pkey PRIMARY KEY (id);


--
-- Name: kr_modules kr_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_modules
    ADD CONSTRAINT kr_modules_pkey PRIMARY KEY (id);


--
-- Name: kr_operation_history kr_operation_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_operation_history
    ADD CONSTRAINT kr_operation_history_pkey PRIMARY KEY (id);


--
-- Name: kr_pam_ldap_setting kr_pam_ldap_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pam_ldap_setting
    ADD CONSTRAINT kr_pam_ldap_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_pre_deploy kr_pre_deploy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pre_deploy
    ADD CONSTRAINT kr_pre_deploy_pkey PRIMARY KEY (id);


--
-- Name: kr_pxe_boot_setting kr_pxe_boot_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pxe_boot_setting
    ADD CONSTRAINT kr_pxe_boot_setting_pkey PRIMARY KEY (id);


--
-- Name: kr_service kr_service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_service
    ADD CONSTRAINT kr_service_pkey PRIMARY KEY (id);


--
-- Name: kr_user_authorized_dn_modules kr_user_authorized_dn_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_authorized_dn_modules
    ADD CONSTRAINT kr_user_authorized_dn_modules_pkey PRIMARY KEY (id);


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
-- Name: kr_configuration_management u_kr_cmnt_property_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_configuration_management
    ADD CONSTRAINT u_kr_cmnt_property_name UNIQUE (property_name, application);


--
-- Name: kr_admin_general_setting u_kr_dtng_property_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_admin_general_setting
    ADD CONSTRAINT u_kr_dtng_property_name UNIQUE (property_name, application);


--
-- Name: kr_agent_installation_cron u_kr_gcrn_agent_installation_cron_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_cron
    ADD CONSTRAINT u_kr_gcrn_agent_installation_cron_id PRIMARY KEY (agent_installation_cron_id);


--
-- Name: kr_agent_installation u_kr_gltn_agent_installation_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation
    ADD CONSTRAINT u_kr_gltn_agent_installation_id PRIMARY KEY (agent_installation_id);


--
-- Name: kr_agent_installation_details u_kr_gtls_agent_installation_details_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_details
    ADD CONSTRAINT u_kr_gtls_agent_installation_details_id PRIMARY KEY (agent_installation_details_id);


--
-- Name: kr_general_setting u_kr_gtng_application; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_general_setting
    ADD CONSTRAINT u_kr_gtng_application UNIQUE (application);


--
-- Name: kr_exception_setting u_kr_xtng_application; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_exception_setting
    ADD CONSTRAINT u_kr_xtng_application UNIQUE (application);


--
-- Name: i_kr_m_lg_messagetemplate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_m_lg_messagetemplate ON public.kr_message_template_logo USING btree (message_template_id);


--
-- Name: i_kr_mtng_messagetemplate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_mtng_messagetemplate ON public.kr_email_setting USING btree (message_template);


--
-- Name: i_kr_sdls_authgroups; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sdls_authgroups ON public.kr_user_authorized_dn_modules USING btree (auth_groups_id);


--
-- Name: i_kr_sdls_modules; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_sdls_modules ON public.kr_user_authorized_dn_modules USING btree (modules_id);


--
-- Name: i_kr_ttls_authgroups; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_ttls_authgroups ON public.kr_auth_group_details USING btree (auth_groups_id);


--
-- PostgreSQL database dump complete
--

