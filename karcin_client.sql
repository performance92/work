\c karcin_client

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
-- Name: openfire; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA openfire;


ALTER SCHEMA openfire OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ofextcomponentconf; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofextcomponentconf (
    subdomain character varying(255) NOT NULL,
    wildcard integer NOT NULL,
    secret character varying(255),
    permission character varying(10) NOT NULL
);


ALTER TABLE openfire.ofextcomponentconf OWNER TO postgres;

--
-- Name: ofgroup; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofgroup (
    groupname character varying(50) NOT NULL,
    description character varying(255)
);


ALTER TABLE openfire.ofgroup OWNER TO postgres;

--
-- Name: ofgroupprop; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofgroupprop (
    groupname character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE openfire.ofgroupprop OWNER TO postgres;

--
-- Name: ofgroupuser; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofgroupuser (
    groupname character varying(50) NOT NULL,
    username character varying(100) NOT NULL,
    administrator integer NOT NULL
);


ALTER TABLE openfire.ofgroupuser OWNER TO postgres;

--
-- Name: ofid; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofid (
    idtype integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE openfire.ofid OWNER TO postgres;

--
-- Name: ofmucaffiliation; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucaffiliation (
    roomid integer NOT NULL,
    jid character varying(1024) NOT NULL,
    affiliation integer NOT NULL
);


ALTER TABLE openfire.ofmucaffiliation OWNER TO postgres;

--
-- Name: ofmucconversationlog; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucconversationlog (
    roomid integer NOT NULL,
    messageid integer NOT NULL,
    sender character varying(1024) NOT NULL,
    nickname character varying(255),
    logtime character(15) NOT NULL,
    subject character varying(255),
    body text,
    stanza text
);


ALTER TABLE openfire.ofmucconversationlog OWNER TO postgres;

--
-- Name: ofmucmember; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucmember (
    roomid integer NOT NULL,
    jid character varying(1024) NOT NULL,
    nickname character varying(255),
    firstname character varying(100),
    lastname character varying(100),
    url character varying(100),
    email character varying(100),
    faqentry character varying(100)
);


ALTER TABLE openfire.ofmucmember OWNER TO postgres;

--
-- Name: ofmucroom; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucroom (
    serviceid integer NOT NULL,
    roomid integer NOT NULL,
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL,
    name character varying(50) NOT NULL,
    naturalname character varying(255) NOT NULL,
    description character varying(255),
    lockeddate character(15) NOT NULL,
    emptydate character(15),
    canchangesubject integer NOT NULL,
    maxusers integer NOT NULL,
    publicroom integer NOT NULL,
    moderated integer NOT NULL,
    membersonly integer NOT NULL,
    caninvite integer NOT NULL,
    roompassword character varying(50),
    candiscoverjid integer NOT NULL,
    logenabled integer NOT NULL,
    subject character varying(100),
    rolestobroadcast integer NOT NULL,
    usereservednick integer NOT NULL,
    canchangenick integer NOT NULL,
    canregister integer NOT NULL,
    allowpm integer,
    fmucenabled integer,
    fmucoutboundnode text,
    fmucoutboundmode integer,
    fmucinboundnodes text
);


ALTER TABLE openfire.ofmucroom OWNER TO postgres;

--
-- Name: ofmucroomprop; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucroomprop (
    roomid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE openfire.ofmucroomprop OWNER TO postgres;

--
-- Name: ofmucservice; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucservice (
    serviceid integer NOT NULL,
    subdomain character varying(255) NOT NULL,
    description character varying(255),
    ishidden integer NOT NULL
);


ALTER TABLE openfire.ofmucservice OWNER TO postgres;

--
-- Name: ofmucserviceprop; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofmucserviceprop (
    serviceid integer NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE openfire.ofmucserviceprop OWNER TO postgres;

--
-- Name: ofoffline; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofoffline (
    username character varying(64) NOT NULL,
    messageid integer NOT NULL,
    creationdate character(15) NOT NULL,
    messagesize integer NOT NULL,
    stanza text NOT NULL
);


ALTER TABLE openfire.ofoffline OWNER TO postgres;

--
-- Name: ofpresence; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpresence (
    username character varying(64) NOT NULL,
    offlinepresence text,
    offlinedate character varying(15) NOT NULL
);


ALTER TABLE openfire.ofpresence OWNER TO postgres;

--
-- Name: ofprivacylist; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofprivacylist (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    isdefault integer NOT NULL,
    list text NOT NULL
);


ALTER TABLE openfire.ofprivacylist OWNER TO postgres;

--
-- Name: ofproperty; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofproperty (
    name character varying(100) NOT NULL,
    propvalue character varying(4000) NOT NULL,
    encrypted integer,
    iv character(24)
);


ALTER TABLE openfire.ofproperty OWNER TO postgres;

--
-- Name: ofpubsubaffiliation; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubaffiliation (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    affiliation character varying(10) NOT NULL
);


ALTER TABLE openfire.ofpubsubaffiliation OWNER TO postgres;

--
-- Name: ofpubsubdefaultconf; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubdefaultconf (
    serviceid character varying(100) NOT NULL,
    leaf integer NOT NULL,
    deliverpayloads integer NOT NULL,
    maxpayloadsize integer NOT NULL,
    persistitems integer NOT NULL,
    maxitems integer NOT NULL,
    notifyconfigchanges integer NOT NULL,
    notifydelete integer NOT NULL,
    notifyretract integer NOT NULL,
    presencebased integer NOT NULL,
    senditemsubscribe integer NOT NULL,
    publishermodel character varying(15) NOT NULL,
    subscriptionenabled integer NOT NULL,
    accessmodel character varying(10) NOT NULL,
    language character varying(255),
    replypolicy character varying(15),
    associationpolicy character varying(15) NOT NULL,
    maxleafnodes integer NOT NULL
);


ALTER TABLE openfire.ofpubsubdefaultconf OWNER TO postgres;

--
-- Name: ofpubsubitem; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubitem (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    id character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    creationdate character(15) NOT NULL,
    payload text
);


ALTER TABLE openfire.ofpubsubitem OWNER TO postgres;

--
-- Name: ofpubsubnode; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubnode (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    leaf integer NOT NULL,
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL,
    parent character varying(100),
    deliverpayloads integer NOT NULL,
    maxpayloadsize integer,
    persistitems integer,
    maxitems integer,
    notifyconfigchanges integer NOT NULL,
    notifydelete integer NOT NULL,
    notifyretract integer NOT NULL,
    presencebased integer NOT NULL,
    senditemsubscribe integer NOT NULL,
    publishermodel character varying(15) NOT NULL,
    subscriptionenabled integer NOT NULL,
    configsubscription integer NOT NULL,
    accessmodel character varying(10) NOT NULL,
    payloadtype character varying(100),
    bodyxslt character varying(100),
    dataformxslt character varying(100),
    creator character varying(1024) NOT NULL,
    description character varying(255),
    language character varying(255),
    name character varying(50),
    replypolicy character varying(15),
    associationpolicy character varying(15),
    maxleafnodes integer
);


ALTER TABLE openfire.ofpubsubnode OWNER TO postgres;

--
-- Name: ofpubsubnodegroups; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubnodegroups (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    rostergroup character varying(100) NOT NULL
);


ALTER TABLE openfire.ofpubsubnodegroups OWNER TO postgres;

--
-- Name: ofpubsubnodejids; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubnodejids (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    associationtype character varying(20) NOT NULL
);


ALTER TABLE openfire.ofpubsubnodejids OWNER TO postgres;

--
-- Name: ofpubsubsubscription; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofpubsubsubscription (
    serviceid character varying(100) NOT NULL,
    nodeid character varying(100) NOT NULL,
    id character varying(100) NOT NULL,
    jid character varying(1024) NOT NULL,
    owner character varying(1024) NOT NULL,
    state character varying(15) NOT NULL,
    deliver integer NOT NULL,
    digest integer NOT NULL,
    digest_frequency integer NOT NULL,
    expire character(15),
    includebody integer NOT NULL,
    showvalues character varying(30) NOT NULL,
    subscriptiontype character varying(10) NOT NULL,
    subscriptiondepth integer NOT NULL,
    keyword character varying(200)
);


ALTER TABLE openfire.ofpubsubsubscription OWNER TO postgres;

--
-- Name: ofremoteserverconf; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofremoteserverconf (
    xmppdomain character varying(255) NOT NULL,
    remoteport integer,
    permission character varying(10) NOT NULL
);


ALTER TABLE openfire.ofremoteserverconf OWNER TO postgres;

--
-- Name: ofroster; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofroster (
    rosterid integer NOT NULL,
    username character varying(64) NOT NULL,
    jid character varying(1024) NOT NULL,
    sub integer NOT NULL,
    ask integer NOT NULL,
    recv integer NOT NULL,
    nick character varying(255),
    stanza text
);


ALTER TABLE openfire.ofroster OWNER TO postgres;

--
-- Name: ofrostergroups; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofrostergroups (
    rosterid integer NOT NULL,
    rank integer NOT NULL,
    groupname character varying(255) NOT NULL
);


ALTER TABLE openfire.ofrostergroups OWNER TO postgres;

--
-- Name: ofsaslauthorized; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofsaslauthorized (
    username character varying(64) NOT NULL,
    principal character varying(4000) NOT NULL
);


ALTER TABLE openfire.ofsaslauthorized OWNER TO postgres;

--
-- Name: ofsecurityauditlog; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofsecurityauditlog (
    msgid integer NOT NULL,
    username character varying(64) NOT NULL,
    entrystamp bigint NOT NULL,
    summary character varying(255) NOT NULL,
    node character varying(255) NOT NULL,
    details text
);


ALTER TABLE openfire.ofsecurityauditlog OWNER TO postgres;

--
-- Name: ofuser; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofuser (
    username character varying(64) NOT NULL,
    storedkey character varying(32),
    serverkey character varying(32),
    salt character varying(32),
    iterations integer,
    plainpassword character varying(32),
    encryptedpassword character varying(255),
    name character varying(100),
    email character varying(100),
    creationdate character(15) NOT NULL,
    modificationdate character(15) NOT NULL
);


ALTER TABLE openfire.ofuser OWNER TO postgres;

--
-- Name: ofuserflag; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofuserflag (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    starttime character(15),
    endtime character(15)
);


ALTER TABLE openfire.ofuserflag OWNER TO postgres;

--
-- Name: ofuserprop; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofuserprop (
    username character varying(64) NOT NULL,
    name character varying(100) NOT NULL,
    propvalue text NOT NULL
);


ALTER TABLE openfire.ofuserprop OWNER TO postgres;

--
-- Name: ofvcard; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofvcard (
    username character varying(64) NOT NULL,
    vcard text NOT NULL
);


ALTER TABLE openfire.ofvcard OWNER TO postgres;

--
-- Name: ofversion; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.ofversion (
    name character varying(50) NOT NULL,
    version integer NOT NULL
);


ALTER TABLE openfire.ofversion OWNER TO postgres;

--
-- Name: userstatus; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.userstatus (
    username character varying(64) NOT NULL,
    resource character varying(64) NOT NULL,
    online integer NOT NULL,
    presence character(15),
    lastipaddress character(45) NOT NULL,
    lastlogindate character(15) NOT NULL,
    lastlogoffdate character(15)
);


ALTER TABLE openfire.userstatus OWNER TO postgres;

--
-- Name: userstatushistory; Type: TABLE; Schema: openfire; Owner: postgres
--

CREATE TABLE openfire.userstatushistory (
    historyid bigint NOT NULL,
    username character varying(64) NOT NULL,
    resource character varying(64) NOT NULL,
    lastipaddress character(45) NOT NULL,
    lastlogindate character(15) NOT NULL,
    lastlogoffdate character(15) NOT NULL
);


ALTER TABLE openfire.userstatushistory OWNER TO postgres;

--
-- Name: kr_agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent (
    agent_id bigint NOT NULL,
    agent_version character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    domain_name character varying(255),
    hostname character varying(255),
    jid character varying(255),
    license_status boolean,
    modify_date timestamp without time zone,
    operating_system character varying(255),
    service_version character varying(255),
    version bigint,
    domain_status boolean,
    tags text,
    trusted_status integer,
    system_id character varying(255),
    agent_build character varying(255),
    guid character varying(255),
    domain_trusted boolean,
    ip_address character varying(255)
);


ALTER TABLE public.kr_agent OWNER TO postgres;

--
-- Name: kr_agent_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_agent_id_seq OWNER TO postgres;

--
-- Name: kr_agent_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_agent_id_seq OWNED BY public.kr_agent.agent_id;


--
-- Name: kr_agent_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_collection (
    agent_collection_id bigint NOT NULL,
    collection_type character varying(20) NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(1000),
    filters character varying(10000),
    modify_date timestamp without time zone,
    name character varying(255),
    version bigint,
    parent_id bigint,
    excel_file_name character varying(255),
    owner character varying(255)
);


ALTER TABLE public.kr_agent_collection OWNER TO postgres;

--
-- Name: kr_agent_collection_agent_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_collection_agent_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_collection_agent_collection_id_seq OWNER TO postgres;

--
-- Name: kr_agent_collection_agent_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_collection_agent_collection_id_seq OWNED BY public.kr_agent_collection.agent_collection_id;


--
-- Name: kr_agent_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_configuration (
    agent_configuration_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    settings character varying(255),
    type character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_configuration OWNER TO postgres;

--
-- Name: kr_agent_configuration_agent_configuration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_configuration_agent_configuration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_configuration_agent_configuration_id_seq OWNER TO postgres;

--
-- Name: kr_agent_configuration_agent_configuration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_configuration_agent_configuration_id_seq OWNED BY public.kr_agent_configuration.agent_configuration_id;


--
-- Name: kr_agent_critical_process; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_critical_process (
    agent_critical_process_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    cmd_line character varying(10000),
    cpu_percent double precision,
    create_date timestamp without time zone NOT NULL,
    created double precision,
    mem_percent double precision,
    mem_rss bigint,
    mem_vms bigint,
    name character varying(10000),
    pid bigint,
    status character varying(255),
    user0 character varying(255),
    agent_critical_record_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_critical_process OWNER TO postgres;

--
-- Name: kr_agent_critical_process_agent_critical_process_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_critical_process_agent_critical_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_critical_process_agent_critical_process_id_seq OWNER TO postgres;

--
-- Name: kr_agent_critical_process_agent_critical_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_critical_process_agent_critical_process_id_seq OWNED BY public.kr_agent_critical_process.agent_critical_process_id;


--
-- Name: kr_agent_critical_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_critical_record (
    agent_critical_record_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    cpu double precision,
    create_date timestamp without time zone,
    critic_type character varying(255),
    is_deleted boolean,
    disk double precision,
    ram double precision,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_critical_record OWNER TO postgres;

--
-- Name: kr_agent_critical_record_agent_critical_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_critical_record_agent_critical_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_critical_record_agent_critical_record_id_seq OWNER TO postgres;

--
-- Name: kr_agent_critical_record_agent_critical_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_critical_record_agent_critical_record_id_seq OWNED BY public.kr_agent_critical_record.agent_critical_record_id;


--
-- Name: kr_agent_disk_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_disk_usage (
    agent_disk_usage_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    disk_name character varying(255),
    free_disk bigint,
    rate bigint,
    total_disk bigint,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_disk_usage OWNER TO postgres;

--
-- Name: kr_agent_disk_usage_agent_disk_usage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_disk_usage_agent_disk_usage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_disk_usage_agent_disk_usage_id_seq OWNER TO postgres;

--
-- Name: kr_agent_disk_usage_agent_disk_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_disk_usage_agent_disk_usage_id_seq OWNED BY public.kr_agent_disk_usage.agent_disk_usage_id;


--
-- Name: kr_agent_event_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_event_log (
    agent_event_log_id bigint NOT NULL,
    begin_date timestamp without time zone,
    create_date timestamp without time zone,
    is_deleted boolean,
    end_date timestamp without time zone,
    id_list text,
    user0 character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_event_log OWNER TO postgres;

--
-- Name: kr_agent_event_log_agent_event_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_event_log_agent_event_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_event_log_agent_event_log_id_seq OWNER TO postgres;

--
-- Name: kr_agent_event_log_agent_event_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_event_log_agent_event_log_id_seq OWNED BY public.kr_agent_event_log.agent_event_log_id;


--
-- Name: kr_agent_event_log_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_event_log_detail (
    agent_event_log_detail_id bigint NOT NULL,
    instance_id bigint,
    category character varying(255),
    category_number integer,
    container character varying(255),
    data character varying(255),
    entry_type integer,
    event_id integer,
    index bigint,
    machine_name character varying(255),
    message text,
    replacement_strings text,
    site character varying(255),
    source character varying(255),
    time_generated character varying(255),
    time_written character varying(255),
    username character varying(255),
    agent_event_log_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_event_log_detail OWNER TO postgres;

--
-- Name: kr_agent_event_log_detail_agent_event_log_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_event_log_detail_agent_event_log_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_event_log_detail_agent_event_log_detail_id_seq OWNER TO postgres;

--
-- Name: kr_agent_event_log_detail_agent_event_log_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_event_log_detail_agent_event_log_detail_id_seq OWNED BY public.kr_agent_event_log_detail.agent_event_log_detail_id;


--
-- Name: kr_agent_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_file (
    agent_file_id bigint NOT NULL,
    agent_file_path character varying(255),
    agent_version character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    description text,
    modify_date timestamp without time zone,
    version bigint
);


ALTER TABLE public.kr_agent_file OWNER TO postgres;

--
-- Name: kr_agent_file_agent_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_file_agent_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_file_agent_file_id_seq OWNER TO postgres;

--
-- Name: kr_agent_file_agent_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_file_agent_file_id_seq OWNED BY public.kr_agent_file.agent_file_id;


--
-- Name: kr_agent_file_integrity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_file_integrity (
    agent_file_integrity_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    event character varying(255),
    event_date timestamp without time zone,
    folder_type integer,
    user0 character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_file_integrity OWNER TO postgres;

--
-- Name: kr_agent_file_integrity_agent_file_integrity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_file_integrity_agent_file_integrity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_file_integrity_agent_file_integrity_id_seq OWNER TO postgres;

--
-- Name: kr_agent_file_integrity_agent_file_integrity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_file_integrity_agent_file_integrity_id_seq OWNED BY public.kr_agent_file_integrity.agent_file_integrity_id;


--
-- Name: kr_agent_file_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_file_tracking (
    agent_file_tracking bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    path character varying(255),
    path_type character varying(20),
    process_date timestamp without time zone,
    process_type character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_file_tracking OWNER TO postgres;

--
-- Name: kr_agent_file_tracking_agent_file_tracking_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_file_tracking_agent_file_tracking_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_file_tracking_agent_file_tracking_seq OWNER TO postgres;

--
-- Name: kr_agent_file_tracking_agent_file_tracking_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_file_tracking_agent_file_tracking_seq OWNED BY public.kr_agent_file_tracking.agent_file_tracking;


--
-- Name: kr_agent_folder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_folder (
    agent_folder_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    details character varying(255),
    folder_type character varying(255),
    name character varying(255),
    parent_id_tree character varying(255),
    version bigint,
    parent_id bigint
);


ALTER TABLE public.kr_agent_folder OWNER TO postgres;

--
-- Name: kr_agent_folder_agent_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_folder_agent_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_folder_agent_folder_id_seq OWNER TO postgres;

--
-- Name: kr_agent_folder_agent_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_folder_agent_folder_id_seq OWNED BY public.kr_agent_folder.agent_folder_id;


--
-- Name: kr_agent_hardware; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_hardware (
    agent_hardware_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    create_date timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    property_name character varying(255),
    property_value text,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_hardware OWNER TO postgres;

--
-- Name: kr_agent_hardware_agent_hardware_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_hardware_agent_hardware_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_hardware_agent_hardware_id_seq OWNER TO postgres;

--
-- Name: kr_agent_hardware_agent_hardware_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_hardware_agent_hardware_id_seq OWNED BY public.kr_agent_hardware.agent_hardware_id;


--
-- Name: kr_agent_hardware_constraints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_hardware_constraints (
    agent_hardware_constraints_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    label character varying(255),
    linux_disable_script_label character varying(255),
    linux_enable_script_label character varying(255),
    macos_disable_script_label character varying(255),
    macos_enable_script_label character varying(255),
    modify_date timestamp without time zone,
    refreshscriptkey character varying(255),
    windows_disable_script_label character varying(255),
    windows_enable_script_label character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_hardware_constraints OWNER TO postgres;

--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_hardware_constraints_agent_hardware_constraints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_hardware_constraints_agent_hardware_constraints_id_seq OWNER TO postgres;

--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_hardware_constraints_agent_hardware_constraints_id_seq OWNED BY public.kr_agent_hardware_constraints.agent_hardware_constraints_id;


--
-- Name: kr_agent_hardware_constraints_last_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_hardware_constraints_last_status (
    agent_hardware_constraints_last_status_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    status boolean,
    version bigint,
    agent_id bigint NOT NULL,
    agent_hardware_constraints_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_hardware_constraints_last_status OWNER TO postgres;

--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_la_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_hardware_constraints_agent_hardware_constraints_la_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_hardware_constraints_agent_hardware_constraints_la_seq OWNER TO postgres;

--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_la_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_hardware_constraints_agent_hardware_constraints_la_seq OWNED BY public.kr_agent_hardware_constraints_last_status.agent_hardware_constraints_last_status_id;


--
-- Name: kr_agent_hardware_constraints_task_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_hardware_constraints_task_result (
    agent_hardware_constraints_task_result_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    modify_date timestamp without time zone,
    operating_system character varying(255),
    owner_uid character varying(255),
    response_data bytea,
    response_message character varying(255),
    version bigint,
    agent_hardware_constraints_task_id bigint NOT NULL,
    agent_id bigint NOT NULL,
    agent_hardware_constraints_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_hardware_constraints_task_result OWNER TO postgres;

--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_t_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_hardware_constraints_agent_hardware_constraints_t_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_hardware_constraints_agent_hardware_constraints_t_seq1 OWNER TO postgres;

--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_t_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_hardware_constraints_agent_hardware_constraints_t_seq1 OWNED BY public.kr_agent_hardware_constraints_task_result.agent_hardware_constraints_task_result_id;


--
-- Name: kr_agent_hardware_constraints_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_hardware_constraints_task (
    agent_hardware_constraints_task_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    dn_type_detail character varying(1000),
    modify_date timestamp without time zone,
    owner_uid character varying(255),
    process_type character varying(20),
    total bigint,
    type character varying(20),
    uid_list text,
    version bigint,
    agent_hardware_constraints_id bigint
);


ALTER TABLE public.kr_agent_hardware_constraints_task OWNER TO postgres;

--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_ta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_hardware_constraints_agent_hardware_constraints_ta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_hardware_constraints_agent_hardware_constraints_ta_seq OWNER TO postgres;

--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_ta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_hardware_constraints_agent_hardware_constraints_ta_seq OWNED BY public.kr_agent_hardware_constraints_task.agent_hardware_constraints_task_id;


--
-- Name: kr_agent_hardware_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_hardware_history (
    agent_hardware_history_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    create_date timestamp without time zone,
    old_property_value text,
    agent_hardware_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_hardware_history OWNER TO postgres;

--
-- Name: kr_agent_hardware_history_agent_hardware_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_hardware_history_agent_hardware_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_hardware_history_agent_hardware_history_id_seq OWNER TO postgres;

--
-- Name: kr_agent_hardware_history_agent_hardware_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_hardware_history_agent_hardware_history_id_seq OWNED BY public.kr_agent_hardware_history.agent_hardware_history_id;


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
-- Name: kr_agent_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_message (
    agent_message_id bigint NOT NULL,
    contents bytea,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    key character varying(255),
    total_count integer NOT NULL,
    type character varying(20),
    type_detail character varying(255),
    user0 character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_message OWNER TO postgres;

--
-- Name: kr_agent_message_agent_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_message_agent_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_message_agent_message_id_seq OWNER TO postgres;

--
-- Name: kr_agent_message_agent_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_message_agent_message_id_seq OWNED BY public.kr_agent_message.agent_message_id;


--
-- Name: kr_agent_message_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_message_detail (
    agent_message_detail_id bigint NOT NULL,
    agent_id bigint,
    create_date timestamp without time zone NOT NULL,
    status boolean,
    agent_message_id bigint NOT NULL,
    is_deleted boolean,
    version bigint
);


ALTER TABLE public.kr_agent_message_detail OWNER TO postgres;

--
-- Name: kr_agent_message_detail_agent_message_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_message_detail_agent_message_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_message_detail_agent_message_detail_id_seq OWNER TO postgres;

--
-- Name: kr_agent_message_detail_agent_message_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_message_detail_agent_message_detail_id_seq OWNED BY public.kr_agent_message_detail.agent_message_detail_id;


--
-- Name: kr_agent_operating_system; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_operating_system (
    agent_operating_system_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    console_version character varying(255),
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    os_arch character varying(255),
    os_build_number character varying(255),
    os_installed_date timestamp without time zone,
    os_name character varying(255),
    os_version character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_operating_system OWNER TO postgres;

--
-- Name: kr_agent_operating_system_agent_operating_system_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_operating_system_agent_operating_system_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_operating_system_agent_operating_system_id_seq OWNER TO postgres;

--
-- Name: kr_agent_operating_system_agent_operating_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_operating_system_agent_operating_system_id_seq OWNED BY public.kr_agent_operating_system.agent_operating_system_id;


--
-- Name: kr_agent_operation_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_operation_history (
    agent_operation_history_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    description text,
    status character varying(255),
    type character varying(255),
    username character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_operation_history OWNER TO postgres;

--
-- Name: kr_agent_operation_history_agent_operation_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_operation_history_agent_operation_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_operation_history_agent_operation_history_id_seq OWNER TO postgres;

--
-- Name: kr_agent_operation_history_agent_operation_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_operation_history_agent_operation_history_id_seq OWNED BY public.kr_agent_operation_history.agent_operation_history_id;


--
-- Name: kr_agent_patch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_patch (
    agent_patch_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    description character varying(255),
    hotfix_name character varying(255),
    installed_on timestamp without time zone,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_patch OWNER TO postgres;

--
-- Name: kr_agent_patch_agent_patch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_patch_agent_patch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_patch_agent_patch_id_seq OWNER TO postgres;

--
-- Name: kr_agent_patch_agent_patch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_patch_agent_patch_id_seq OWNED BY public.kr_agent_patch.agent_patch_id;


--
-- Name: kr_agent_policy_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_policy_tracking (
    agent_policy_tracking_id bigint NOT NULL,
    agent_policy_tracking_type character varying(20),
    completed boolean,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    status boolean,
    username character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_policy_tracking OWNER TO postgres;

--
-- Name: kr_agent_policy_tracking_agent_policy_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_policy_tracking_agent_policy_tracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_policy_tracking_agent_policy_tracking_id_seq OWNER TO postgres;

--
-- Name: kr_agent_policy_tracking_agent_policy_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_policy_tracking_agent_policy_tracking_id_seq OWNED BY public.kr_agent_policy_tracking.agent_policy_tracking_id;


--
-- Name: kr_agent_policy_tracking_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_policy_tracking_detail (
    agent_policy_tracking_detail_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    extension_status text,
    name character varying(255),
    policy_status boolean,
    status boolean,
    version bigint,
    agent_policy_tracking_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_policy_tracking_detail OWNER TO postgres;

--
-- Name: kr_agent_policy_tracking_deta_agent_policy_tracking_detail__seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_policy_tracking_deta_agent_policy_tracking_detail__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_policy_tracking_deta_agent_policy_tracking_detail__seq OWNER TO postgres;

--
-- Name: kr_agent_policy_tracking_deta_agent_policy_tracking_detail__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_policy_tracking_deta_agent_policy_tracking_detail__seq OWNED BY public.kr_agent_policy_tracking_detail.agent_policy_tracking_detail_id;


--
-- Name: kr_agent_port_alarm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_port_alarm (
    agent_port_alarm_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    ip character varying(255),
    name character varying(255),
    pid integer,
    port integer,
    status boolean,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_port_alarm OWNER TO postgres;

--
-- Name: kr_agent_port_alarm_agent_port_alarm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_port_alarm_agent_port_alarm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_port_alarm_agent_port_alarm_id_seq OWNER TO postgres;

--
-- Name: kr_agent_port_alarm_agent_port_alarm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_port_alarm_agent_port_alarm_id_seq OWNED BY public.kr_agent_port_alarm.agent_port_alarm_id;


--
-- Name: kr_agent_process_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_process_log (
    agent_process_log_id bigint NOT NULL,
    agent_id bigint,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    file_name character varying(255),
    file_path character varying(255),
    process_name character varying(255),
    process_time bigint,
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_process_log OWNER TO postgres;

--
-- Name: kr_agent_process_log_agent_process_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_process_log_agent_process_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_process_log_agent_process_log_id_seq OWNER TO postgres;

--
-- Name: kr_agent_process_log_agent_process_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_process_log_agent_process_log_id_seq OWNED BY public.kr_agent_process_log.agent_process_log_id;


--
-- Name: kr_agent_program_install; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_install (
    agent_program_install_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    program_name character varying(255),
    program_version character varying(255),
    total_count integer,
    type character varying(20),
    type_detail character varying(255),
    user0 character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_program_install OWNER TO postgres;

--
-- Name: kr_agent_program_install_agent_program_install_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_install_agent_program_install_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_install_agent_program_install_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_install_agent_program_install_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_install_agent_program_install_id_seq OWNED BY public.kr_agent_program_install.agent_program_install_id;


--
-- Name: kr_agent_program_install_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_install_detail (
    agent_program_install_detail_id bigint NOT NULL,
    agentid bigint,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    version bigint,
    agent_program_install_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_program_install_detail OWNER TO postgres;

--
-- Name: kr_agent_program_install_deta_agent_program_install_detail__seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_install_deta_agent_program_install_detail__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_install_deta_agent_program_install_detail__seq OWNER TO postgres;

--
-- Name: kr_agent_program_install_deta_agent_program_install_detail__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_install_deta_agent_program_install_detail__seq OWNED BY public.kr_agent_program_install_detail.agent_program_install_detail_id;


--
-- Name: kr_agent_program_install_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_install_result (
    agent_program_install_result_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    message text,
    state character varying(255),
    status boolean,
    version bigint,
    agent_program_install_detail_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_program_install_result OWNER TO postgres;

--
-- Name: kr_agent_program_install_resu_agent_program_install_result__seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_install_resu_agent_program_install_result__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_install_resu_agent_program_install_result__seq OWNER TO postgres;

--
-- Name: kr_agent_program_install_resu_agent_program_install_result__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_install_resu_agent_program_install_result__seq OWNED BY public.kr_agent_program_install_result.agent_program_install_result_id;


--
-- Name: kr_agent_program_restriction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_restriction (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    os character varying(20),
    restriction character varying(20) NOT NULL,
    version bigint
);


ALTER TABLE public.kr_agent_program_restriction OWNER TO postgres;

--
-- Name: kr_agent_program_restriction_definitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_restriction_definitions (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    name character varying(255),
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_program_restriction_definitions OWNER TO postgres;

--
-- Name: kr_agent_program_restriction_definitions_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_restriction_definitions_detail (
    id bigint NOT NULL,
    agent_id bigint,
    agent_program_restriction_definitions_id bigint,
    agent_program_restriction_detail_id bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    list character varying(255),
    operating_system character varying(255),
    program_name character varying(255),
    program_version character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_program_restriction_definitions_detail OWNER TO postgres;

--
-- Name: kr_agent_program_restriction_definitions_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_restriction_definitions_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_restriction_definitions_detail_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_restriction_definitions_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_restriction_definitions_detail_id_seq OWNED BY public.kr_agent_program_restriction_definitions_detail.id;


--
-- Name: kr_agent_program_restriction_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_restriction_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_restriction_definitions_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_restriction_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_restriction_definitions_id_seq OWNED BY public.kr_agent_program_restriction_definitions.id;


--
-- Name: kr_agent_program_restriction_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_restriction_detail (
    id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    operating_system character varying(255),
    program_name character varying(255),
    program_version character varying(255),
    version bigint,
    agent_program_restriction_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_program_restriction_detail OWNER TO postgres;

--
-- Name: kr_agent_program_restriction_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_restriction_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_restriction_detail_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_restriction_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_restriction_detail_id_seq OWNED BY public.kr_agent_program_restriction_detail.id;


--
-- Name: kr_agent_program_restriction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_restriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_restriction_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_restriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_restriction_id_seq OWNED BY public.kr_agent_program_restriction.id;


--
-- Name: kr_agent_program_uninstall; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_uninstall (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    program_name character varying(255),
    program_version character varying(255),
    total_count integer,
    type character varying(255),
    type_detail character varying(255),
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_program_uninstall OWNER TO postgres;

--
-- Name: kr_agent_program_uninstall_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_uninstall_detail (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    version bigint,
    agent_id bigint NOT NULL,
    agent_program_uninstall_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_program_uninstall_detail OWNER TO postgres;

--
-- Name: kr_agent_program_uninstall_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_uninstall_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_uninstall_detail_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_uninstall_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_uninstall_detail_id_seq OWNED BY public.kr_agent_program_uninstall_detail.id;


--
-- Name: kr_agent_program_uninstall_detail_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_uninstall_detail_results (
    id bigint NOT NULL,
    agentid character varying(255),
    agent_program_uninstall_detail_ids bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    message text,
    state character varying(255),
    status boolean,
    version bigint,
    agent_program_uninstall_detail_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_program_uninstall_detail_results OWNER TO postgres;

--
-- Name: kr_agent_program_uninstall_detail_results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_uninstall_detail_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_uninstall_detail_results_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_uninstall_detail_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_uninstall_detail_results_id_seq OWNED BY public.kr_agent_program_uninstall_detail_results.id;


--
-- Name: kr_agent_program_uninstall_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_uninstall_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_uninstall_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_uninstall_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_uninstall_id_seq OWNED BY public.kr_agent_program_uninstall.id;


--
-- Name: kr_agent_program_use_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_program_use_status (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    programname character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_program_use_status OWNER TO postgres;

--
-- Name: kr_agent_program_use_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_program_use_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_program_use_status_id_seq OWNER TO postgres;

--
-- Name: kr_agent_program_use_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_program_use_status_id_seq OWNED BY public.kr_agent_program_use_status.id;


--
-- Name: kr_agent_quarantine_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_quarantine_history (
    quarantine_history_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    ipaddress character varying(255),
    status boolean,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_quarantine_history OWNER TO postgres;

--
-- Name: kr_agent_quarantine_history_quarantine_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_quarantine_history_quarantine_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_quarantine_history_quarantine_history_id_seq OWNER TO postgres;

--
-- Name: kr_agent_quarantine_history_quarantine_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_quarantine_history_quarantine_history_id_seq OWNED BY public.kr_agent_quarantine_history.quarantine_history_id;


--
-- Name: kr_agent_remote_connection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_remote_connection (
    agent_remote_connection_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    end_date timestamp without time zone,
    record_name character varying(255),
    session_status character varying(255),
    status character varying(255),
    remote_connection_type character varying(20),
    username character varying(255),
    version bigint,
    agent_id bigint,
    guacamole_id character varying(255),
    key character varying(255),
    token character varying(255),
    ip_address character varying(255)
);


ALTER TABLE public.kr_agent_remote_connection OWNER TO postgres;

--
-- Name: kr_agent_remote_connection_agent_remote_connection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_remote_connection_agent_remote_connection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_remote_connection_agent_remote_connection_id_seq OWNER TO postgres;

--
-- Name: kr_agent_remote_connection_agent_remote_connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_remote_connection_agent_remote_connection_id_seq OWNED BY public.kr_agent_remote_connection.agent_remote_connection_id;


--
-- Name: kr_agent_remote_connection_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_remote_connection_setting (
    agent_remote_connection_setting_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    remote_connection_type character varying(20) NOT NULL,
    setting character varying(255),
    version bigint
);


ALTER TABLE public.kr_agent_remote_connection_setting OWNER TO postgres;

--
-- Name: kr_agent_remote_connection_se_agent_remote_connection_setti_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_remote_connection_se_agent_remote_connection_setti_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_remote_connection_se_agent_remote_connection_setti_seq OWNER TO postgres;

--
-- Name: kr_agent_remote_connection_se_agent_remote_connection_setti_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_remote_connection_se_agent_remote_connection_setti_seq OWNED BY public.kr_agent_remote_connection_setting.agent_remote_connection_setting_id;


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
-- Name: kr_agent_service_alarm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_service_alarm (
    agent_service_alarm_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    name character varying(255),
    new_state character varying(255),
    old_state character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_service_alarm OWNER TO postgres;

--
-- Name: kr_agent_service_alarm_agent_service_alarm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_service_alarm_agent_service_alarm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_service_alarm_agent_service_alarm_id_seq OWNER TO postgres;

--
-- Name: kr_agent_service_alarm_agent_service_alarm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_service_alarm_agent_service_alarm_id_seq OWNED BY public.kr_agent_service_alarm.agent_service_alarm_id;


--
-- Name: kr_agent_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_session (
    agent_session_id bigint NOT NULL,
    login_date timestamp without time zone,
    logoff_date timestamp without time zone,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_session OWNER TO postgres;

--
-- Name: kr_agent_session_agent_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_session_agent_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_session_agent_session_id_seq OWNER TO postgres;

--
-- Name: kr_agent_session_agent_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_session_agent_session_id_seq OWNED BY public.kr_agent_session.agent_session_id;


--
-- Name: kr_agent_software; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_software (
    agent_software_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    app_id character varying(255),
    block_status boolean,
    block_user character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    install_date timestamp without time zone,
    modify_date timestamp without time zone,
    name text,
    program_version text,
    publisher character varying(255),
    status boolean,
    uninstall_date timestamp without time zone,
    uninstall_string text,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_software OWNER TO postgres;

--
-- Name: kr_agent_software_agent_software_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_software_agent_software_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_software_agent_software_id_seq OWNER TO postgres;

--
-- Name: kr_agent_software_agent_software_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_software_agent_software_id_seq OWNED BY public.kr_agent_software.agent_software_id;


--
-- Name: kr_agent_software_metric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_software_metric (
    agent_software_metric_id bigint NOT NULL,
    create_date timestamp without time zone,
    date timestamp without time zone,
    is_deleted boolean,
    duration bigint,
    name character varying(255),
    user0 character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_software_metric OWNER TO postgres;

--
-- Name: kr_agent_software_metric_agent_software_metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_software_metric_agent_software_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_software_metric_agent_software_metric_id_seq OWNER TO postgres;

--
-- Name: kr_agent_software_metric_agent_software_metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_software_metric_agent_software_metric_id_seq OWNED BY public.kr_agent_software_metric.agent_software_metric_id;


--
-- Name: kr_agent_usb_block; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_usb_block (
    agent_usb_block_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    event character varying(255),
    event_date timestamp without time zone,
    serial_number character varying(255),
    user0 character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_usb_block OWNER TO postgres;

--
-- Name: kr_agent_usb_block_agent_usb_block_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_usb_block_agent_usb_block_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_usb_block_agent_usb_block_id_seq OWNER TO postgres;

--
-- Name: kr_agent_usb_block_agent_usb_block_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_usb_block_agent_usb_block_id_seq OWNED BY public.kr_agent_usb_block.agent_usb_block_id;


--
-- Name: kr_agent_usb_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_usb_file (
    agent_usb_file_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    dest character varying(255),
    directory character varying(255),
    letter character varying(255),
    modify_date bigint,
    serial_number character varying(255),
    session_id bigint,
    src character varying(10000),
    type character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_usb_file OWNER TO postgres;

--
-- Name: kr_agent_usb_file_agent_usb_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_usb_file_agent_usb_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_usb_file_agent_usb_file_id_seq OWNER TO postgres;

--
-- Name: kr_agent_usb_file_agent_usb_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_usb_file_agent_usb_file_id_seq OWNED BY public.kr_agent_usb_file.agent_usb_file_id;


--
-- Name: kr_agent_usb_tracking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_usb_tracking (
    agent_usb_tracking_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    partion text,
    serial_number character varying(255),
    session_id bigint,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_usb_tracking OWNER TO postgres;

--
-- Name: kr_agent_usb_tracking_agent_usb_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_usb_tracking_agent_usb_tracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_usb_tracking_agent_usb_tracking_id_seq OWNER TO postgres;

--
-- Name: kr_agent_usb_tracking_agent_usb_tracking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_usb_tracking_agent_usb_tracking_id_seq OWNED BY public.kr_agent_usb_tracking.agent_usb_tracking_id;


--
-- Name: kr_agent_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_user (
    agent_software_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    create_date timestamp without time zone,
    is_deleted boolean,
    display_name character varying(255),
    folder character varying(255),
    name character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_user OWNER TO postgres;

--
-- Name: kr_agent_user_agent_software_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_user_agent_software_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_user_agent_software_id_seq OWNER TO postgres;

--
-- Name: kr_agent_user_agent_software_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_user_agent_software_id_seq OWNED BY public.kr_agent_user.agent_software_id;


--
-- Name: kr_agent_user_login_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_user_login_log (
    agent_user_login_log_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    host character varying(255),
    login_date timestamp without time zone,
    login_type character varying(20),
    session_event character varying(20),
    username character varying(255) NOT NULL,
    version bigint,
    agent_id bigint
);


ALTER TABLE public.kr_agent_user_login_log OWNER TO postgres;

--
-- Name: kr_agent_user_login_log_agent_user_login_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_user_login_log_agent_user_login_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_user_login_log_agent_user_login_log_id_seq OWNER TO postgres;

--
-- Name: kr_agent_user_login_log_agent_user_login_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_user_login_log_agent_user_login_log_id_seq OWNED BY public.kr_agent_user_login_log.agent_user_login_log_id;


--
-- Name: kr_agent_user_session_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_user_session_history (
    agent_user_session_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    session_event character varying(20) NOT NULL,
    username character varying(255) NOT NULL,
    version bigint,
    agent_id bigint
);


ALTER TABLE public.kr_agent_user_session_history OWNER TO postgres;

--
-- Name: kr_agent_user_session_history_agent_user_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_user_session_history_agent_user_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_user_session_history_agent_user_session_id_seq OWNER TO postgres;

--
-- Name: kr_agent_user_session_history_agent_user_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_user_session_history_agent_user_session_id_seq OWNED BY public.kr_agent_user_session_history.agent_user_session_id;


--
-- Name: kr_agent_vulnerability; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_vulnerability (
    agent_vulnerability_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    end_date timestamp without time zone,
    ip_address character varying(255),
    scan_id character varying(255),
    scan_uuid character varying(255),
    start_date timestamp without time zone,
    status character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_vulnerability OWNER TO postgres;

--
-- Name: kr_agent_vulnerability_agent_vulnerability_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_vulnerability_agent_vulnerability_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_vulnerability_agent_vulnerability_id_seq OWNER TO postgres;

--
-- Name: kr_agent_vulnerability_agent_vulnerability_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_vulnerability_agent_vulnerability_id_seq OWNED BY public.kr_agent_vulnerability.agent_vulnerability_id;


--
-- Name: kr_agent_vulnerability_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_vulnerability_detail (
    agent_vulnerability_detail_id bigint NOT NULL,
    count integer,
    plugin_family character varying(255),
    plugin_id bigint,
    plugin_name character varying(255),
    severity character varying(255),
    agent_vulnerability_id bigint NOT NULL,
    description character varying(4000),
    tags text
);


ALTER TABLE public.kr_agent_vulnerability_detail OWNER TO postgres;

--
-- Name: kr_agent_vulnerability_detail_agent_vulnerability_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_vulnerability_detail_agent_vulnerability_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_vulnerability_detail_agent_vulnerability_detail_id_seq OWNER TO postgres;

--
-- Name: kr_agent_vulnerability_detail_agent_vulnerability_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_vulnerability_detail_agent_vulnerability_detail_id_seq OWNED BY public.kr_agent_vulnerability_detail.agent_vulnerability_detail_id;


--
-- Name: kr_agent_vulnerability_host; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_vulnerability_host (
    agent_vulnerability_host_id bigint NOT NULL,
    critical integer,
    high integer,
    info integer,
    low integer,
    medium integer,
    score integer,
    agent_vulnerability_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_vulnerability_host OWNER TO postgres;

--
-- Name: kr_agent_vulnerability_host_agent_vulnerability_host_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_vulnerability_host_agent_vulnerability_host_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_vulnerability_host_agent_vulnerability_host_id_seq OWNER TO postgres;

--
-- Name: kr_agent_vulnerability_host_agent_vulnerability_host_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_vulnerability_host_agent_vulnerability_host_id_seq OWNED BY public.kr_agent_vulnerability_host.agent_vulnerability_host_id;


--
-- Name: kr_agent_vulnerability_network_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_vulnerability_network_information (
    agent_vulnerability_network_information_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    device text,
    port text,
    status boolean,
    value text,
    vlan text,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_vulnerability_network_information OWNER TO postgres;

--
-- Name: kr_agent_vulnerability_networ_agent_vulnerability_network_i_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_vulnerability_networ_agent_vulnerability_network_i_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_vulnerability_networ_agent_vulnerability_network_i_seq OWNER TO postgres;

--
-- Name: kr_agent_vulnerability_networ_agent_vulnerability_network_i_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_vulnerability_networ_agent_vulnerability_network_i_seq OWNED BY public.kr_agent_vulnerability_network_information.agent_vulnerability_network_information_id;


--
-- Name: kr_auto_agent_delete_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_auto_agent_delete_history (
    auto_agent_delete_history_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    lastlogoffdate timestamp without time zone,
    modify_date timestamp without time zone,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_auto_agent_delete_history OWNER TO postgres;

--
-- Name: kr_auto_agent_delete_history_auto_agent_delete_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_auto_agent_delete_history_auto_agent_delete_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_auto_agent_delete_history_auto_agent_delete_history_id_seq OWNER TO postgres;

--
-- Name: kr_auto_agent_delete_history_auto_agent_delete_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_auto_agent_delete_history_auto_agent_delete_history_id_seq OWNED BY public.kr_auto_agent_delete_history.auto_agent_delete_history_id;


--
-- Name: kr_auto_provision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_auto_provision (
    auto_provision_id bigint NOT NULL,
    args text,
    auto_provision_type character varying(20),
    create_date timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    operating_system_type character varying(20),
    priority bigint,
    property_name character varying(255),
    property_value character varying(255),
    is_status boolean,
    version bigint,
    program_file_id bigint,
    script_file_id bigint,
    owner character varying(255)
);


ALTER TABLE public.kr_auto_provision OWNER TO postgres;

--
-- Name: kr_auto_provision_auto_provision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_auto_provision_auto_provision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_auto_provision_auto_provision_id_seq OWNER TO postgres;

--
-- Name: kr_auto_provision_auto_provision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_auto_provision_auto_provision_id_seq OWNED BY public.kr_auto_provision.auto_provision_id;


--
-- Name: kr_auto_provision_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_auto_provision_detail (
    auto_provision_detail_id bigint NOT NULL,
    agentid bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    status boolean,
    version bigint,
    agent_program_install_detail_id bigint,
    auto_provision_id bigint,
    command_execution_id bigint
);


ALTER TABLE public.kr_auto_provision_detail OWNER TO postgres;

--
-- Name: kr_auto_provision_detail_auto_provision_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_auto_provision_detail_auto_provision_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_auto_provision_detail_auto_provision_detail_id_seq OWNER TO postgres;

--
-- Name: kr_auto_provision_detail_auto_provision_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_auto_provision_detail_auto_provision_detail_id_seq OWNED BY public.kr_auto_provision_detail.auto_provision_detail_id;


--
-- Name: kr_city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_city (
    city_id bigint NOT NULL,
    city_koordinat character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint,
    country_id bigint
);


ALTER TABLE public.kr_city OWNER TO postgres;

--
-- Name: kr_city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_city_city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_city_city_id_seq OWNER TO postgres;

--
-- Name: kr_city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_city_city_id_seq OWNED BY public.kr_city.city_id;


--
-- Name: kr_command; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_command (
    command_id bigint NOT NULL,
    activation_date timestamp without time zone,
    command_owner_uid character varying(255),
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    dn_list text,
    dn_type integer,
    dn_type_detail character varying(1000),
    expiration_date timestamp without time zone,
    mail_threading_active boolean,
    sent_mail boolean,
    total integer,
    uid_list text,
    version bigint,
    task_id bigint,
    script_user character varying(255)
);


ALTER TABLE public.kr_command OWNER TO postgres;

--
-- Name: kr_command_command_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_command_command_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_command_command_id_seq OWNER TO postgres;

--
-- Name: kr_command_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_command_command_id_seq OWNED BY public.kr_command.command_id;


--
-- Name: kr_command_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_command_execution (
    command_execution_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    dn character varying(255),
    dn_type integer,
    online boolean,
    uid character varying(255),
    command_id bigint NOT NULL
);


ALTER TABLE public.kr_command_execution OWNER TO postgres;

--
-- Name: kr_command_execution_command_execution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_command_execution_command_execution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_command_execution_command_execution_id_seq OWNER TO postgres;

--
-- Name: kr_command_execution_command_execution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_command_execution_command_execution_id_seq OWNED BY public.kr_command_execution.command_execution_id;


--
-- Name: kr_command_execution_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_command_execution_result (
    command_execution_result_id bigint NOT NULL,
    content_type integer,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    mail_content character varying(255),
    mail_subject character varying(1000),
    response_code integer NOT NULL,
    response_data bytea,
    response_message text,
    version bigint,
    command_execution_id bigint NOT NULL,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_command_execution_result OWNER TO postgres;

--
-- Name: kr_command_execution_result_command_execution_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_command_execution_result_command_execution_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_command_execution_result_command_execution_result_id_seq OWNER TO postgres;

--
-- Name: kr_command_execution_result_command_execution_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_command_execution_result_command_execution_result_id_seq OWNED BY public.kr_command_execution_result.command_execution_result_id;


--
-- Name: kr_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_country (
    country_id bigint NOT NULL,
    country_koordinat character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    version bigint
);


ALTER TABLE public.kr_country OWNER TO postgres;

--
-- Name: kr_country_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_country_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_country_country_id_seq OWNER TO postgres;

--
-- Name: kr_country_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_country_country_id_seq OWNED BY public.kr_country.country_id;


--
-- Name: kr_domain_subnet_match; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_domain_subnet_match (
    domain_subnet_match_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    dn character varying(255),
    subnet character varying(255),
    version bigint
);


ALTER TABLE public.kr_domain_subnet_match OWNER TO postgres;

--
-- Name: kr_domain_subnet_match_domain_subnet_match_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_domain_subnet_match_domain_subnet_match_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_domain_subnet_match_domain_subnet_match_id_seq OWNER TO postgres;

--
-- Name: kr_domain_subnet_match_domain_subnet_match_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_domain_subnet_match_domain_subnet_match_id_seq OWNED BY public.kr_domain_subnet_match.domain_subnet_match_id;


--
-- Name: kr_email_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_email_job (
    email_job_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    email_body text,
    email_type character varying(20),
    modify_date timestamp without time zone,
    property_name character varying(255),
    property_value text,
    send_date timestamp without time zone,
    version bigint,
    agent_id bigint
);


ALTER TABLE public.kr_email_job OWNER TO postgres;

--
-- Name: kr_email_job_email_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_email_job_email_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_email_job_email_job_id_seq OWNER TO postgres;

--
-- Name: kr_email_job_email_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_email_job_email_job_id_seq OWNED BY public.kr_email_job.email_job_id;


--
-- Name: kr_file_transfer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_file_transfer (
    file_transfer_id bigint NOT NULL,
    agent_path character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    dn_detail character varying(255),
    dn_type character varying(20),
    file_path character varying(255),
    file_size double precision,
    file_transfer_type character varying(20),
    file_name character varying(255),
    modify_date timestamp without time zone,
    operator character varying(255),
    original_file_name character varying(255),
    status character varying(20),
    task_name character varying(255),
    version bigint,
    task_id bigint
);


ALTER TABLE public.kr_file_transfer OWNER TO postgres;

--
-- Name: kr_file_transfer_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_file_transfer_detail (
    file_transfer_detail_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    message character varying(255),
    resend_count bigint,
    resend_date timestamp without time zone,
    status character varying(20),
    version bigint,
    file_transfer_id bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_file_transfer_detail OWNER TO postgres;

--
-- Name: kr_file_transfer_detail_file_transfer_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_file_transfer_detail_file_transfer_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_file_transfer_detail_file_transfer_detail_id_seq OWNER TO postgres;

--
-- Name: kr_file_transfer_detail_file_transfer_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_file_transfer_detail_file_transfer_detail_id_seq OWNED BY public.kr_file_transfer_detail.file_transfer_detail_id;


--
-- Name: kr_file_transfer_file_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_file_transfer_file_transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_file_transfer_file_transfer_id_seq OWNER TO postgres;

--
-- Name: kr_file_transfer_file_transfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_file_transfer_file_transfer_id_seq OWNED BY public.kr_file_transfer.file_transfer_id;


--
-- Name: kr_file_transfer_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_file_transfer_schedule (
    file_transfer_schedule_id bigint NOT NULL,
    create_date timestamp without time zone,
    cron character varying(255),
    is_deleted boolean,
    end_date timestamp without time zone,
    period character varying(255),
    period_type character varying(20),
    file_transfer_schedule_type character varying(20),
    start_date timestamp without time zone,
    status boolean,
    version bigint,
    file_transfer_id bigint
);


ALTER TABLE public.kr_file_transfer_schedule OWNER TO postgres;

--
-- Name: kr_file_transfer_schedule_file_transfer_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_file_transfer_schedule_file_transfer_schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_file_transfer_schedule_file_transfer_schedule_id_seq OWNER TO postgres;

--
-- Name: kr_file_transfer_schedule_file_transfer_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_file_transfer_schedule_file_transfer_schedule_id_seq OWNED BY public.kr_file_transfer_schedule.file_transfer_schedule_id;


--
-- Name: kr_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_inventory (
    inventory_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    inventory_status character varying(20),
    modify_date timestamp without time zone,
    name character varying(255),
    serial_no character varying(255),
    version bigint,
    agent_id bigint,
    last_inventory_activity_id bigint
);


ALTER TABLE public.kr_inventory OWNER TO postgres;

--
-- Name: kr_inventory_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_inventory_activity (
    inventory_activity_id bigint NOT NULL,
    activitydate timestamp without time zone,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    finishdate timestamp without time zone,
    inventory_status character varying(20),
    modify_date timestamp without time zone,
    version bigint,
    inventory_id bigint,
    person_id bigint
);


ALTER TABLE public.kr_inventory_activity OWNER TO postgres;

--
-- Name: kr_inventory_activity_inventory_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_inventory_activity_inventory_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_inventory_activity_inventory_activity_id_seq OWNER TO postgres;

--
-- Name: kr_inventory_activity_inventory_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_inventory_activity_inventory_activity_id_seq OWNED BY public.kr_inventory_activity.inventory_activity_id;


--
-- Name: kr_inventory_inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_inventory_inventory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_inventory_inventory_id_seq OWNER TO postgres;

--
-- Name: kr_inventory_inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_inventory_inventory_id_seq OWNED BY public.kr_inventory.inventory_id;


--
-- Name: kr_ldap_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_ldap_user (
    ldap_user_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    dn character varying(255) NOT NULL,
    domain_name character varying(255),
    name character varying(255) NOT NULL,
    version bigint
);


ALTER TABLE public.kr_ldap_user OWNER TO postgres;

--
-- Name: kr_ldap_user_ldap_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_ldap_user_ldap_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_ldap_user_ldap_user_id_seq OWNER TO postgres;

--
-- Name: kr_ldap_user_ldap_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_ldap_user_ldap_user_id_seq OWNED BY public.kr_ldap_user.ldap_user_id;


--
-- Name: kr_ldap_user_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_ldap_user_policy (
    ldap_user_policy_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    version bigint,
    ldapuser bigint NOT NULL,
    policy_id bigint NOT NULL
);


ALTER TABLE public.kr_ldap_user_policy OWNER TO postgres;

--
-- Name: kr_ldap_user_policy_ldap_user_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_ldap_user_policy_ldap_user_policy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_ldap_user_policy_ldap_user_policy_id_seq OWNER TO postgres;

--
-- Name: kr_ldap_user_policy_ldap_user_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_ldap_user_policy_ldap_user_policy_id_seq OWNED BY public.kr_ldap_user_policy.ldap_user_policy_id;


--
-- Name: kr_ldap_user_property; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_ldap_user_property (
    ldap_user_property_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    property_name character varying(255) NOT NULL,
    property_value text NOT NULL,
    ldap_user_id bigint NOT NULL
);


ALTER TABLE public.kr_ldap_user_property OWNER TO postgres;

--
-- Name: kr_ldap_user_property_ldap_user_property_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_ldap_user_property_ldap_user_property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_ldap_user_property_ldap_user_property_id_seq OWNER TO postgres;

--
-- Name: kr_ldap_user_property_ldap_user_property_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_ldap_user_property_ldap_user_property_id_seq OWNED BY public.kr_ldap_user_property.ldap_user_property_id;


--
-- Name: kr_person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_person (
    person_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    email character varying(255),
    full_name character varying(255),
    identification_number character varying(255),
    modify_date timestamp without time zone,
    phone character varying(255),
    version bigint,
    ldap_user_id bigint
);


ALTER TABLE public.kr_person OWNER TO postgres;

--
-- Name: kr_person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_person_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_person_person_id_seq OWNER TO postgres;

--
-- Name: kr_person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_person_person_id_seq OWNED BY public.kr_person.person_id;


--
-- Name: kr_process_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_process_history (
    process_history bigint NOT NULL,
    agent_id bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    process_type character varying(255),
    version bigint
);


ALTER TABLE public.kr_process_history OWNER TO postgres;

--
-- Name: kr_process_history_process_history_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_process_history_process_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_process_history_process_history_seq OWNER TO postgres;

--
-- Name: kr_process_history_process_history_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_process_history_process_history_seq OWNED BY public.kr_process_history.process_history;


--
-- Name: kr_program_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_program_file (
    program_file_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    linux_parameter character varying(3000),
    linux_path character varying(255),
    linux_version character varying(255),
    mac_parameter character varying(3000),
    mac_path character varying(255),
    mac_version character varying(255),
    modify_date timestamp without time zone,
    name character varying(255),
    windows_parameter character varying(3000),
    windows_path character varying(255),
    windows_version character varying(255),
    version bigint
);


ALTER TABLE public.kr_program_file OWNER TO postgres;

--
-- Name: kr_program_file_program_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_program_file_program_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_program_file_program_file_id_seq OWNER TO postgres;

--
-- Name: kr_program_file_program_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_program_file_program_file_id_seq OWNED BY public.kr_program_file.program_file_id;


--
-- Name: kr_program_license; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_program_license (
    agent_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    expiration_date timestamp without time zone,
    modify_date timestamp without time zone,
    program_name character varying(255),
    program_version character varying(255),
    version bigint
);


ALTER TABLE public.kr_program_license OWNER TO postgres;

--
-- Name: kr_program_license_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_program_license_agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_program_license_agent_id_seq OWNER TO postgres;

--
-- Name: kr_program_license_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_program_license_agent_id_seq OWNED BY public.kr_program_license.agent_id;


--
-- Name: kr_queue_class_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_queue_class_configuration (
    id bigint NOT NULL,
    class_path character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    queue_name character varying(255),
    version bigint,
    prefetch_count bigint
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
-- Name: kr_queue_error_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_queue_error_log (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    error character varying(255),
    message text,
    queue_name character varying(255),
    version bigint
);


ALTER TABLE public.kr_queue_error_log OWNER TO postgres;

--
-- Name: kr_queue_error_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_queue_error_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_queue_error_log_id_seq OWNER TO postgres;

--
-- Name: kr_queue_error_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_queue_error_log_id_seq OWNED BY public.kr_queue_error_log.id;


--
-- Name: kr_rdp_recorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_rdp_recorder (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    expiration_date bigint,
    expiration_date_type character varying(20),
    operator character varying(255),
    path character varying(255),
    recycle_period bigint,
    recycle_period_type character varying(20),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_rdp_recorder OWNER TO postgres;

--
-- Name: kr_rdp_recorder_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_rdp_recorder_history (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    expiration_date bigint,
    expiration_date_type character varying(20),
    operator character varying(255),
    path character varying(255),
    recycle_period bigint,
    recycle_period_type character varying(20),
    status character varying(255),
    version bigint,
    agent_id bigint NOT NULL,
    rdp_recorder_id bigint NOT NULL
);


ALTER TABLE public.kr_rdp_recorder_history OWNER TO postgres;

--
-- Name: kr_rdp_recorder_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_rdp_recorder_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_rdp_recorder_history_id_seq OWNER TO postgres;

--
-- Name: kr_rdp_recorder_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_rdp_recorder_history_id_seq OWNED BY public.kr_rdp_recorder_history.id;


--
-- Name: kr_rdp_recorder_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_rdp_recorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_rdp_recorder_id_seq OWNER TO postgres;

--
-- Name: kr_rdp_recorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_rdp_recorder_id_seq OWNED BY public.kr_rdp_recorder.id;


--
-- Name: kr_rdp_recorder_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_rdp_recorder_list (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    duration integer,
    file_create_date timestamp without time zone,
    file_size character varying(255),
    name character varying(255),
    path character varying(255),
    recycle_period bigint,
    recycle_period_type character varying(20),
    status boolean,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_rdp_recorder_list OWNER TO postgres;

--
-- Name: kr_rdp_recorder_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_rdp_recorder_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_rdp_recorder_list_id_seq OWNER TO postgres;

--
-- Name: kr_rdp_recorder_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_rdp_recorder_list_id_seq OWNED BY public.kr_rdp_recorder_list.id;


--
-- Name: kr_recording_timer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_recording_timer (
    recording_timer_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    end_date timestamp without time zone,
    modify_date timestamp without time zone,
    operator character varying(255),
    start_date timestamp without time zone,
    status boolean,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_recording_timer OWNER TO postgres;

--
-- Name: kr_recording_timer_recording_timer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_recording_timer_recording_timer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_recording_timer_recording_timer_id_seq OWNER TO postgres;

--
-- Name: kr_recording_timer_recording_timer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_recording_timer_recording_timer_id_seq OWNED BY public.kr_recording_timer.recording_timer_id;


--
-- Name: kr_script_button_definition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_script_button_definition (
    script_button_definition_id bigint NOT NULL,
    is_active boolean,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    name character varying(255),
    platform character varying(255),
    version bigint,
    script_id bigint NOT NULL
);


ALTER TABLE public.kr_script_button_definition OWNER TO postgres;

--
-- Name: kr_script_button_definition_script_button_definition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_script_button_definition_script_button_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_script_button_definition_script_button_definition_id_seq OWNER TO postgres;

--
-- Name: kr_script_button_definition_script_button_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_script_button_definition_script_button_definition_id_seq OWNED BY public.kr_script_button_definition.script_button_definition_id;


--
-- Name: kr_script_file; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_script_file (
    script_file_id bigint NOT NULL,
    contents text NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    general_type character varying(20) NOT NULL,
    label character varying(255) NOT NULL,
    normal_script_parameters character varying(255),
    script_type character varying(20) NOT NULL,
    version bigint
);


ALTER TABLE public.kr_script_file OWNER TO postgres;

--
-- Name: kr_script_file_script_file_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_script_file_script_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_script_file_script_file_id_seq OWNER TO postgres;

--
-- Name: kr_script_file_script_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_script_file_script_file_id_seq OWNED BY public.kr_script_file.script_file_id;


--
-- Name: kr_script_task_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_script_task_detail (
    script_task_detail_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    script_button_definition_id bigint,
    script_id bigint,
    task_id bigint,
    version bigint
);


ALTER TABLE public.kr_script_task_detail OWNER TO postgres;

--
-- Name: kr_script_task_detail_script_task_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_script_task_detail_script_task_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_script_task_detail_script_task_detail_id_seq OWNER TO postgres;

--
-- Name: kr_script_task_detail_script_task_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_script_task_detail_script_task_detail_id_seq OWNED BY public.kr_script_task_detail.script_task_detail_id;


--
-- Name: kr_system_exception; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_system_exception (
    system_exception_id bigint NOT NULL,
    class_name character varying(255),
    create_date timestamp without time zone,
    description text,
    method_name character varying(255)
);


ALTER TABLE public.kr_system_exception OWNER TO postgres;

--
-- Name: kr_system_exception_system_exception_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_system_exception_system_exception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_system_exception_system_exception_id_seq OWNER TO postgres;

--
-- Name: kr_system_exception_system_exception_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_system_exception_system_exception_id_seq OWNED BY public.kr_system_exception.system_exception_id;


--
-- Name: kr_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_task (
    task_id bigint NOT NULL,
    command_cls_id character varying(255),
    create_date timestamp without time zone NOT NULL,
    cron_expression character varying(255),
    is_deleted boolean,
    details character varying(255),
    general_type character varying(255),
    is_mail_send boolean,
    modify_date timestamp without time zone,
    parameter_map bytea,
    version bigint
);


ALTER TABLE public.kr_task OWNER TO postgres;

--
-- Name: kr_task_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_task_sequence (
    task_sequence_id bigint NOT NULL,
    command_content text,
    create_date timestamp without time zone,
    definition_owner character varying(255),
    is_deleted boolean,
    description character varying(255),
    name character varying(255),
    operating_system character varying(255),
    version bigint
);


ALTER TABLE public.kr_task_sequence OWNER TO postgres;

--
-- Name: kr_task_sequence_command; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_task_sequence_command (
    task_sequence_command_id bigint NOT NULL,
    command_content text,
    command_owner character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    dn_list text,
    dn_type character varying(20),
    dn_type_detail character varying(1000),
    task_name character varying(255),
    total integer,
    uid_list text,
    version bigint,
    task_sequence_id bigint
);


ALTER TABLE public.kr_task_sequence_command OWNER TO postgres;

--
-- Name: kr_task_sequence_command_task_sequence_command_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_task_sequence_command_task_sequence_command_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_task_sequence_command_task_sequence_command_id_seq OWNER TO postgres;

--
-- Name: kr_task_sequence_command_task_sequence_command_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_task_sequence_command_task_sequence_command_id_seq OWNED BY public.kr_task_sequence_command.task_sequence_command_id;


--
-- Name: kr_task_sequence_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_task_sequence_detail (
    task_sequence_detail_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    dn character varying(255),
    hostname character varying(255),
    modify_date timestamp without time zone,
    reach_status boolean,
    version bigint,
    task_sequence_command_id bigint NOT NULL,
    agent_id bigint NOT NULL,
    uid character varying(255)
);


ALTER TABLE public.kr_task_sequence_detail OWNER TO postgres;

--
-- Name: kr_task_sequence_detail_task_sequence_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_task_sequence_detail_task_sequence_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_task_sequence_detail_task_sequence_detail_id_seq OWNER TO postgres;

--
-- Name: kr_task_sequence_detail_task_sequence_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_task_sequence_detail_task_sequence_detail_id_seq OWNED BY public.kr_task_sequence_detail.task_sequence_detail_id;


--
-- Name: kr_task_sequence_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_task_sequence_result (
    task_sequence_result_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    place character varying(255),
    reach_status_from_agent boolean,
    required boolean,
    response_data text,
    response_status boolean,
    task_sequence_type character varying(20),
    uid character varying(255),
    version bigint,
    task_sequence_detail_id bigint NOT NULL,
    agent_id bigint
);


ALTER TABLE public.kr_task_sequence_result OWNER TO postgres;

--
-- Name: kr_task_sequence_result_task_sequence_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_task_sequence_result_task_sequence_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_task_sequence_result_task_sequence_result_id_seq OWNER TO postgres;

--
-- Name: kr_task_sequence_result_task_sequence_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_task_sequence_result_task_sequence_result_id_seq OWNED BY public.kr_task_sequence_result.task_sequence_result_id;


--
-- Name: kr_task_sequence_task_sequence_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_task_sequence_task_sequence_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_task_sequence_task_sequence_id_seq OWNER TO postgres;

--
-- Name: kr_task_sequence_task_sequence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_task_sequence_task_sequence_id_seq OWNED BY public.kr_task_sequence.task_sequence_id;


--
-- Name: kr_task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_task_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_task_task_id_seq OWNER TO postgres;

--
-- Name: kr_task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_task_task_id_seq OWNED BY public.kr_task.task_id;


--
-- Name: kr_usb_definition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_usb_definition (
    usb_definition_id bigint NOT NULL,
    box_serial_number character varying(255),
    brand character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    model character varying(255),
    operator character varying(255),
    serial_number character varying(255),
    version bigint
);


ALTER TABLE public.kr_usb_definition OWNER TO postgres;

--
-- Name: kr_usb_definition_usb_definition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_usb_definition_usb_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_usb_definition_usb_definition_id_seq OWNER TO postgres;

--
-- Name: kr_usb_definition_usb_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_usb_definition_usb_definition_id_seq OWNED BY public.kr_usb_definition.usb_definition_id;


--
-- Name: kr_watchdog_playbook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_watchdog_playbook (
    watchdog_playbook_id bigint NOT NULL,
    content text,
    create_date timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    task_count integer,
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_watchdog_playbook OWNER TO postgres;

--
-- Name: kr_watchdog_playbook_execution_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_watchdog_playbook_execution_detail (
    watchdog_playbook_execution_detail_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    version bigint,
    agent_id bigint NOT NULL,
    watchdog_playbook_execution_id bigint NOT NULL
);


ALTER TABLE public.kr_watchdog_playbook_execution_detail OWNER TO postgres;

--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_d_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_d_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_d_seq OWNER TO postgres;

--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_d_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_d_seq OWNED BY public.kr_watchdog_playbook_execution_detail.watchdog_playbook_execution_detail_id;


--
-- Name: kr_watchdog_playbook_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_watchdog_playbook_execution (
    watchdog_playbook_execution_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    execution_content text,
    username character varying(255),
    version bigint,
    agent_collection_id bigint,
    watchdog_playbook_id bigint NOT NULL
);


ALTER TABLE public.kr_watchdog_playbook_execution OWNER TO postgres;

--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_i_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_i_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_i_seq OWNER TO postgres;

--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_i_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_i_seq OWNED BY public.kr_watchdog_playbook_execution.watchdog_playbook_execution_id;


--
-- Name: kr_watchdog_playbook_execution_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_watchdog_playbook_execution_result (
    watchdog_playbook_execution_result_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    name character varying(255),
    result bytea,
    status boolean,
    version bigint,
    watchdog_playbook_execution_detail_id bigint NOT NULL
);


ALTER TABLE public.kr_watchdog_playbook_execution_result OWNER TO postgres;

--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_r_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_r_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_r_seq OWNER TO postgres;

--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_r_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_watchdog_playbook_executio_watchdog_playbook_execution_r_seq OWNED BY public.kr_watchdog_playbook_execution_result.watchdog_playbook_execution_result_id;


--
-- Name: kr_watchdog_playbook_watchdog_playbook_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_watchdog_playbook_watchdog_playbook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_watchdog_playbook_watchdog_playbook_id_seq OWNER TO postgres;

--
-- Name: kr_watchdog_playbook_watchdog_playbook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_watchdog_playbook_watchdog_playbook_id_seq OWNED BY public.kr_watchdog_playbook.watchdog_playbook_id;


--
-- Name: kr_watchdog_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_watchdog_task (
    watchdog_task_id bigint NOT NULL,
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    task text,
    version bigint
);


ALTER TABLE public.kr_watchdog_task OWNER TO postgres;

--
-- Name: kr_watchdog_task_watchdog_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_watchdog_task_watchdog_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_watchdog_task_watchdog_task_id_seq OWNER TO postgres;

--
-- Name: kr_watchdog_task_watchdog_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_watchdog_task_watchdog_task_id_seq OWNED BY public.kr_watchdog_task.watchdog_task_id;


--
-- Name: template_parameters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.template_parameters (
    template_parameters_id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    parametercode character varying(255),
    parametername character varying(255),
    parametervalue character varying(255),
    version bigint
);


ALTER TABLE public.template_parameters OWNER TO postgres;

--
-- Name: template_parameters_template_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.template_parameters_template_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.template_parameters_template_parameters_id_seq OWNER TO postgres;

--
-- Name: template_parameters_template_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.template_parameters_template_parameters_id_seq OWNED BY public.template_parameters.template_parameters_id;


--
-- Name: kr_agent agent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent ALTER COLUMN agent_id SET DEFAULT nextval('public.kr_agent_agent_id_seq'::regclass);


--
-- Name: kr_agent_collection agent_collection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_collection ALTER COLUMN agent_collection_id SET DEFAULT nextval('public.kr_agent_collection_agent_collection_id_seq'::regclass);


--
-- Name: kr_agent_configuration agent_configuration_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_configuration ALTER COLUMN agent_configuration_id SET DEFAULT nextval('public.kr_agent_configuration_agent_configuration_id_seq'::regclass);


--
-- Name: kr_agent_critical_process agent_critical_process_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_critical_process ALTER COLUMN agent_critical_process_id SET DEFAULT nextval('public.kr_agent_critical_process_agent_critical_process_id_seq'::regclass);


--
-- Name: kr_agent_critical_record agent_critical_record_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_critical_record ALTER COLUMN agent_critical_record_id SET DEFAULT nextval('public.kr_agent_critical_record_agent_critical_record_id_seq'::regclass);


--
-- Name: kr_agent_disk_usage agent_disk_usage_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_disk_usage ALTER COLUMN agent_disk_usage_id SET DEFAULT nextval('public.kr_agent_disk_usage_agent_disk_usage_id_seq'::regclass);


--
-- Name: kr_agent_event_log agent_event_log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_event_log ALTER COLUMN agent_event_log_id SET DEFAULT nextval('public.kr_agent_event_log_agent_event_log_id_seq'::regclass);


--
-- Name: kr_agent_event_log_detail agent_event_log_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_event_log_detail ALTER COLUMN agent_event_log_detail_id SET DEFAULT nextval('public.kr_agent_event_log_detail_agent_event_log_detail_id_seq'::regclass);


--
-- Name: kr_agent_file agent_file_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_file ALTER COLUMN agent_file_id SET DEFAULT nextval('public.kr_agent_file_agent_file_id_seq'::regclass);


--
-- Name: kr_agent_file_integrity agent_file_integrity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_file_integrity ALTER COLUMN agent_file_integrity_id SET DEFAULT nextval('public.kr_agent_file_integrity_agent_file_integrity_id_seq'::regclass);


--
-- Name: kr_agent_file_tracking agent_file_tracking; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_file_tracking ALTER COLUMN agent_file_tracking SET DEFAULT nextval('public.kr_agent_file_tracking_agent_file_tracking_seq'::regclass);


--
-- Name: kr_agent_folder agent_folder_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_folder ALTER COLUMN agent_folder_id SET DEFAULT nextval('public.kr_agent_folder_agent_folder_id_seq'::regclass);


--
-- Name: kr_agent_hardware agent_hardware_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware ALTER COLUMN agent_hardware_id SET DEFAULT nextval('public.kr_agent_hardware_agent_hardware_id_seq'::regclass);


--
-- Name: kr_agent_hardware_constraints agent_hardware_constraints_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints ALTER COLUMN agent_hardware_constraints_id SET DEFAULT nextval('public.kr_agent_hardware_constraints_agent_hardware_constraints_id_seq'::regclass);


--
-- Name: kr_agent_hardware_constraints_last_status agent_hardware_constraints_last_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints_last_status ALTER COLUMN agent_hardware_constraints_last_status_id SET DEFAULT nextval('public.kr_agent_hardware_constraints_agent_hardware_constraints_la_seq'::regclass);


--
-- Name: kr_agent_hardware_constraints_task agent_hardware_constraints_task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints_task ALTER COLUMN agent_hardware_constraints_task_id SET DEFAULT nextval('public.kr_agent_hardware_constraints_agent_hardware_constraints_ta_seq'::regclass);


--
-- Name: kr_agent_hardware_constraints_task_result agent_hardware_constraints_task_result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints_task_result ALTER COLUMN agent_hardware_constraints_task_result_id SET DEFAULT nextval('public.kr_agent_hardware_constraints_agent_hardware_constraints_t_seq1'::regclass);


--
-- Name: kr_agent_hardware_history agent_hardware_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_history ALTER COLUMN agent_hardware_history_id SET DEFAULT nextval('public.kr_agent_hardware_history_agent_hardware_history_id_seq'::regclass);


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
-- Name: kr_agent_message agent_message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_message ALTER COLUMN agent_message_id SET DEFAULT nextval('public.kr_agent_message_agent_message_id_seq'::regclass);


--
-- Name: kr_agent_message_detail agent_message_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_message_detail ALTER COLUMN agent_message_detail_id SET DEFAULT nextval('public.kr_agent_message_detail_agent_message_detail_id_seq'::regclass);


--
-- Name: kr_agent_operating_system agent_operating_system_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_operating_system ALTER COLUMN agent_operating_system_id SET DEFAULT nextval('public.kr_agent_operating_system_agent_operating_system_id_seq'::regclass);


--
-- Name: kr_agent_operation_history agent_operation_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_operation_history ALTER COLUMN agent_operation_history_id SET DEFAULT nextval('public.kr_agent_operation_history_agent_operation_history_id_seq'::regclass);


--
-- Name: kr_agent_patch agent_patch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_patch ALTER COLUMN agent_patch_id SET DEFAULT nextval('public.kr_agent_patch_agent_patch_id_seq'::regclass);


--
-- Name: kr_agent_policy_tracking agent_policy_tracking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_policy_tracking ALTER COLUMN agent_policy_tracking_id SET DEFAULT nextval('public.kr_agent_policy_tracking_agent_policy_tracking_id_seq'::regclass);


--
-- Name: kr_agent_policy_tracking_detail agent_policy_tracking_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_policy_tracking_detail ALTER COLUMN agent_policy_tracking_detail_id SET DEFAULT nextval('public.kr_agent_policy_tracking_deta_agent_policy_tracking_detail__seq'::regclass);


--
-- Name: kr_agent_port_alarm agent_port_alarm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_port_alarm ALTER COLUMN agent_port_alarm_id SET DEFAULT nextval('public.kr_agent_port_alarm_agent_port_alarm_id_seq'::regclass);


--
-- Name: kr_agent_process_log agent_process_log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_process_log ALTER COLUMN agent_process_log_id SET DEFAULT nextval('public.kr_agent_process_log_agent_process_log_id_seq'::regclass);


--
-- Name: kr_agent_program_install agent_program_install_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install ALTER COLUMN agent_program_install_id SET DEFAULT nextval('public.kr_agent_program_install_agent_program_install_id_seq'::regclass);


--
-- Name: kr_agent_program_install_detail agent_program_install_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_detail ALTER COLUMN agent_program_install_detail_id SET DEFAULT nextval('public.kr_agent_program_install_deta_agent_program_install_detail__seq'::regclass);


--
-- Name: kr_agent_program_install_result agent_program_install_result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_result ALTER COLUMN agent_program_install_result_id SET DEFAULT nextval('public.kr_agent_program_install_resu_agent_program_install_result__seq'::regclass);


--
-- Name: kr_agent_program_restriction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_program_restriction_id_seq'::regclass);


--
-- Name: kr_agent_program_restriction_definitions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction_definitions ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_program_restriction_definitions_id_seq'::regclass);


--
-- Name: kr_agent_program_restriction_definitions_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction_definitions_detail ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_program_restriction_definitions_detail_id_seq'::regclass);


--
-- Name: kr_agent_program_restriction_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction_detail ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_program_restriction_detail_id_seq'::regclass);


--
-- Name: kr_agent_program_uninstall id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_program_uninstall_id_seq'::regclass);


--
-- Name: kr_agent_program_uninstall_detail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall_detail ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_program_uninstall_detail_id_seq'::regclass);


--
-- Name: kr_agent_program_uninstall_detail_results id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall_detail_results ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_program_uninstall_detail_results_id_seq'::regclass);


--
-- Name: kr_agent_program_use_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_use_status ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_program_use_status_id_seq'::regclass);


--
-- Name: kr_agent_quarantine_history quarantine_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_quarantine_history ALTER COLUMN quarantine_history_id SET DEFAULT nextval('public.kr_agent_quarantine_history_quarantine_history_id_seq'::regclass);


--
-- Name: kr_agent_remote_connection agent_remote_connection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_remote_connection ALTER COLUMN agent_remote_connection_id SET DEFAULT nextval('public.kr_agent_remote_connection_agent_remote_connection_id_seq'::regclass);


--
-- Name: kr_agent_remote_connection_setting agent_remote_connection_setting_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_remote_connection_setting ALTER COLUMN agent_remote_connection_setting_id SET DEFAULT nextval('public.kr_agent_remote_connection_se_agent_remote_connection_setti_seq'::regclass);


--
-- Name: kr_agent_scan agent_scan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_scan ALTER COLUMN agent_scan_id SET DEFAULT nextval('public.kr_agent_scan_agent_scan_id_seq'::regclass);


--
-- Name: kr_agent_service_alarm agent_service_alarm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_service_alarm ALTER COLUMN agent_service_alarm_id SET DEFAULT nextval('public.kr_agent_service_alarm_agent_service_alarm_id_seq'::regclass);


--
-- Name: kr_agent_session agent_session_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_session ALTER COLUMN agent_session_id SET DEFAULT nextval('public.kr_agent_session_agent_session_id_seq'::regclass);


--
-- Name: kr_agent_software agent_software_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_software ALTER COLUMN agent_software_id SET DEFAULT nextval('public.kr_agent_software_agent_software_id_seq'::regclass);


--
-- Name: kr_agent_software_metric agent_software_metric_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_software_metric ALTER COLUMN agent_software_metric_id SET DEFAULT nextval('public.kr_agent_software_metric_agent_software_metric_id_seq'::regclass);


--
-- Name: kr_agent_usb_block agent_usb_block_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_block ALTER COLUMN agent_usb_block_id SET DEFAULT nextval('public.kr_agent_usb_block_agent_usb_block_id_seq'::regclass);


--
-- Name: kr_agent_usb_file agent_usb_file_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_file ALTER COLUMN agent_usb_file_id SET DEFAULT nextval('public.kr_agent_usb_file_agent_usb_file_id_seq'::regclass);


--
-- Name: kr_agent_usb_tracking agent_usb_tracking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_tracking ALTER COLUMN agent_usb_tracking_id SET DEFAULT nextval('public.kr_agent_usb_tracking_agent_usb_tracking_id_seq'::regclass);


--
-- Name: kr_agent_user agent_software_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user ALTER COLUMN agent_software_id SET DEFAULT nextval('public.kr_agent_user_agent_software_id_seq'::regclass);


--
-- Name: kr_agent_user_login_log agent_user_login_log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_login_log ALTER COLUMN agent_user_login_log_id SET DEFAULT nextval('public.kr_agent_user_login_log_agent_user_login_log_id_seq'::regclass);


--
-- Name: kr_agent_user_session_history agent_user_session_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_session_history ALTER COLUMN agent_user_session_id SET DEFAULT nextval('public.kr_agent_user_session_history_agent_user_session_id_seq'::regclass);


--
-- Name: kr_agent_vulnerability agent_vulnerability_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability ALTER COLUMN agent_vulnerability_id SET DEFAULT nextval('public.kr_agent_vulnerability_agent_vulnerability_id_seq'::regclass);


--
-- Name: kr_agent_vulnerability_detail agent_vulnerability_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability_detail ALTER COLUMN agent_vulnerability_detail_id SET DEFAULT nextval('public.kr_agent_vulnerability_detail_agent_vulnerability_detail_id_seq'::regclass);


--
-- Name: kr_agent_vulnerability_host agent_vulnerability_host_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability_host ALTER COLUMN agent_vulnerability_host_id SET DEFAULT nextval('public.kr_agent_vulnerability_host_agent_vulnerability_host_id_seq'::regclass);


--
-- Name: kr_agent_vulnerability_network_information agent_vulnerability_network_information_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability_network_information ALTER COLUMN agent_vulnerability_network_information_id SET DEFAULT nextval('public.kr_agent_vulnerability_networ_agent_vulnerability_network_i_seq'::regclass);


--
-- Name: kr_auto_agent_delete_history auto_agent_delete_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_agent_delete_history ALTER COLUMN auto_agent_delete_history_id SET DEFAULT nextval('public.kr_auto_agent_delete_history_auto_agent_delete_history_id_seq'::regclass);


--
-- Name: kr_auto_provision auto_provision_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision ALTER COLUMN auto_provision_id SET DEFAULT nextval('public.kr_auto_provision_auto_provision_id_seq'::regclass);


--
-- Name: kr_auto_provision_detail auto_provision_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision_detail ALTER COLUMN auto_provision_detail_id SET DEFAULT nextval('public.kr_auto_provision_detail_auto_provision_detail_id_seq'::regclass);


--
-- Name: kr_city city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_city ALTER COLUMN city_id SET DEFAULT nextval('public.kr_city_city_id_seq'::regclass);


--
-- Name: kr_command command_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command ALTER COLUMN command_id SET DEFAULT nextval('public.kr_command_command_id_seq'::regclass);


--
-- Name: kr_command_execution command_execution_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command_execution ALTER COLUMN command_execution_id SET DEFAULT nextval('public.kr_command_execution_command_execution_id_seq'::regclass);


--
-- Name: kr_command_execution_result command_execution_result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command_execution_result ALTER COLUMN command_execution_result_id SET DEFAULT nextval('public.kr_command_execution_result_command_execution_result_id_seq'::regclass);


--
-- Name: kr_country country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_country ALTER COLUMN country_id SET DEFAULT nextval('public.kr_country_country_id_seq'::regclass);


--
-- Name: kr_domain_subnet_match domain_subnet_match_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_domain_subnet_match ALTER COLUMN domain_subnet_match_id SET DEFAULT nextval('public.kr_domain_subnet_match_domain_subnet_match_id_seq'::regclass);


--
-- Name: kr_email_job email_job_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_email_job ALTER COLUMN email_job_id SET DEFAULT nextval('public.kr_email_job_email_job_id_seq'::regclass);


--
-- Name: kr_file_transfer file_transfer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer ALTER COLUMN file_transfer_id SET DEFAULT nextval('public.kr_file_transfer_file_transfer_id_seq'::regclass);


--
-- Name: kr_file_transfer_detail file_transfer_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_detail ALTER COLUMN file_transfer_detail_id SET DEFAULT nextval('public.kr_file_transfer_detail_file_transfer_detail_id_seq'::regclass);


--
-- Name: kr_file_transfer_schedule file_transfer_schedule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_schedule ALTER COLUMN file_transfer_schedule_id SET DEFAULT nextval('public.kr_file_transfer_schedule_file_transfer_schedule_id_seq'::regclass);


--
-- Name: kr_inventory inventory_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_inventory ALTER COLUMN inventory_id SET DEFAULT nextval('public.kr_inventory_inventory_id_seq'::regclass);


--
-- Name: kr_inventory_activity inventory_activity_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_inventory_activity ALTER COLUMN inventory_activity_id SET DEFAULT nextval('public.kr_inventory_activity_inventory_activity_id_seq'::regclass);


--
-- Name: kr_ldap_user ldap_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user ALTER COLUMN ldap_user_id SET DEFAULT nextval('public.kr_ldap_user_ldap_user_id_seq'::regclass);


--
-- Name: kr_ldap_user_policy ldap_user_policy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user_policy ALTER COLUMN ldap_user_policy_id SET DEFAULT nextval('public.kr_ldap_user_policy_ldap_user_policy_id_seq'::regclass);


--
-- Name: kr_ldap_user_property ldap_user_property_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user_property ALTER COLUMN ldap_user_property_id SET DEFAULT nextval('public.kr_ldap_user_property_ldap_user_property_id_seq'::regclass);


--
-- Name: kr_person person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_person ALTER COLUMN person_id SET DEFAULT nextval('public.kr_person_person_id_seq'::regclass);


--
-- Name: kr_process_history process_history; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_process_history ALTER COLUMN process_history SET DEFAULT nextval('public.kr_process_history_process_history_seq'::regclass);


--
-- Name: kr_program_file program_file_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_program_file ALTER COLUMN program_file_id SET DEFAULT nextval('public.kr_program_file_program_file_id_seq'::regclass);


--
-- Name: kr_program_license agent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_program_license ALTER COLUMN agent_id SET DEFAULT nextval('public.kr_program_license_agent_id_seq'::regclass);


--
-- Name: kr_queue_class_configuration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_class_configuration ALTER COLUMN id SET DEFAULT nextval('public.kr_queue_class_configuration_id_seq'::regclass);


--
-- Name: kr_queue_error_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_error_log ALTER COLUMN id SET DEFAULT nextval('public.kr_queue_error_log_id_seq'::regclass);


--
-- Name: kr_rdp_recorder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder ALTER COLUMN id SET DEFAULT nextval('public.kr_rdp_recorder_id_seq'::regclass);


--
-- Name: kr_rdp_recorder_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder_history ALTER COLUMN id SET DEFAULT nextval('public.kr_rdp_recorder_history_id_seq'::regclass);


--
-- Name: kr_rdp_recorder_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder_list ALTER COLUMN id SET DEFAULT nextval('public.kr_rdp_recorder_list_id_seq'::regclass);


--
-- Name: kr_recording_timer recording_timer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_recording_timer ALTER COLUMN recording_timer_id SET DEFAULT nextval('public.kr_recording_timer_recording_timer_id_seq'::regclass);


--
-- Name: kr_script_button_definition script_button_definition_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_script_button_definition ALTER COLUMN script_button_definition_id SET DEFAULT nextval('public.kr_script_button_definition_script_button_definition_id_seq'::regclass);


--
-- Name: kr_script_file script_file_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_script_file ALTER COLUMN script_file_id SET DEFAULT nextval('public.kr_script_file_script_file_id_seq'::regclass);


--
-- Name: kr_script_task_detail script_task_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_script_task_detail ALTER COLUMN script_task_detail_id SET DEFAULT nextval('public.kr_script_task_detail_script_task_detail_id_seq'::regclass);


--
-- Name: kr_system_exception system_exception_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_system_exception ALTER COLUMN system_exception_id SET DEFAULT nextval('public.kr_system_exception_system_exception_id_seq'::regclass);


--
-- Name: kr_task task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task ALTER COLUMN task_id SET DEFAULT nextval('public.kr_task_task_id_seq'::regclass);


--
-- Name: kr_task_sequence task_sequence_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence ALTER COLUMN task_sequence_id SET DEFAULT nextval('public.kr_task_sequence_task_sequence_id_seq'::regclass);


--
-- Name: kr_task_sequence_command task_sequence_command_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_command ALTER COLUMN task_sequence_command_id SET DEFAULT nextval('public.kr_task_sequence_command_task_sequence_command_id_seq'::regclass);


--
-- Name: kr_task_sequence_detail task_sequence_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_detail ALTER COLUMN task_sequence_detail_id SET DEFAULT nextval('public.kr_task_sequence_detail_task_sequence_detail_id_seq'::regclass);


--
-- Name: kr_task_sequence_result task_sequence_result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_result ALTER COLUMN task_sequence_result_id SET DEFAULT nextval('public.kr_task_sequence_result_task_sequence_result_id_seq'::regclass);


--
-- Name: kr_usb_definition usb_definition_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_usb_definition ALTER COLUMN usb_definition_id SET DEFAULT nextval('public.kr_usb_definition_usb_definition_id_seq'::regclass);


--
-- Name: kr_watchdog_playbook watchdog_playbook_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook ALTER COLUMN watchdog_playbook_id SET DEFAULT nextval('public.kr_watchdog_playbook_watchdog_playbook_id_seq'::regclass);


--
-- Name: kr_watchdog_playbook_execution watchdog_playbook_execution_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution ALTER COLUMN watchdog_playbook_execution_id SET DEFAULT nextval('public.kr_watchdog_playbook_executio_watchdog_playbook_execution_i_seq'::regclass);


--
-- Name: kr_watchdog_playbook_execution_detail watchdog_playbook_execution_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution_detail ALTER COLUMN watchdog_playbook_execution_detail_id SET DEFAULT nextval('public.kr_watchdog_playbook_executio_watchdog_playbook_execution_d_seq'::regclass);


--
-- Name: kr_watchdog_playbook_execution_result watchdog_playbook_execution_result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution_result ALTER COLUMN watchdog_playbook_execution_result_id SET DEFAULT nextval('public.kr_watchdog_playbook_executio_watchdog_playbook_execution_r_seq'::regclass);


--
-- Name: kr_watchdog_task watchdog_task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_task ALTER COLUMN watchdog_task_id SET DEFAULT nextval('public.kr_watchdog_task_watchdog_task_id_seq'::regclass);


--
-- Name: template_parameters template_parameters_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameters ALTER COLUMN template_parameters_id SET DEFAULT nextval('public.template_parameters_template_parameters_id_seq'::regclass);


--
-- Data for Name: ofextcomponentconf; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofextcomponentconf (subdomain, wildcard, secret, permission) FROM stdin;
\.


--
-- Data for Name: ofgroup; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofgroup (groupname, description) FROM stdin;
\.


--
-- Data for Name: ofgroupprop; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofgroupprop (groupname, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofgroupuser; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofgroupuser (groupname, username, administrator) FROM stdin;
\.


--
-- Data for Name: ofid; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofid (idtype, id) FROM stdin;
23	1
26	2
27	1
18	36
510	85
19	456
25	50
\.


--
-- Data for Name: ofmucaffiliation; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucaffiliation (roomid, jid, affiliation) FROM stdin;
\.


--
-- Data for Name: ofmucconversationlog; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucconversationlog (roomid, messageid, sender, nickname, logtime, subject, body, stanza) FROM stdin;
\.


--
-- Data for Name: ofmucmember; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucmember (roomid, jid, nickname, firstname, lastname, url, email, faqentry) FROM stdin;
\.


--
-- Data for Name: ofmucroom; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucroom (serviceid, roomid, creationdate, modificationdate, name, naturalname, description, lockeddate, emptydate, canchangesubject, maxusers, publicroom, moderated, membersonly, caninvite, roompassword, candiscoverjid, logenabled, subject, rolestobroadcast, usereservednick, canchangenick, canregister, allowpm, fmucenabled, fmucoutboundnode, fmucoutboundmode, fmucinboundnodes) FROM stdin;
\.


--
-- Data for Name: ofmucroomprop; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucroomprop (roomid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofmucservice; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucservice (serviceid, subdomain, description, ishidden) FROM stdin;
1	conference	\N	0
\.


--
-- Data for Name: ofmucserviceprop; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofmucserviceprop (serviceid, name, propvalue) FROM stdin;
\.


--
-- Data for Name: ofoffline; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofoffline (username, messageid, creationdate, messagesize, stanza) FROM stdin;
admin	206	001695574800965	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.7.5</body></message>
admin	207	001695574801471	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	211	001696419028346	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.7.5</body></message>
admin	212	001696419028562	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	236	001697020668479	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.7.5</body></message>
admin	237	001697020668765	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	238	001697020668826	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.2.3</body></message>
admin	241	001698041816064	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.7.5</body></message>
admin	243	001698041816382	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.2.3</body></message>
admin	242	001698041816382	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	251	001699256219164	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.7.5</body></message>
admin	252	001699256219507	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	253	001699256219532	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.2.3</body></message>
admin	256	001699804595675	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.7.5</body></message>
admin	257	001699804596070	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	258	001699804596093	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.2.3</body></message>
admin	261	001705392046022	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.0</body></message>
admin	262	001705392046331	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	263	001705392046408	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	266	001710932259188	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.1</body></message>
admin	267	001710932259442	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	268	001710932259444	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
3	279	001710936549392	1132	<message to="3@im.kurum.gov.tr" id="5y3hH-1835" from="gardiyan_sunucu@im.kurum.gov.tr/Smack"><body>{"type":"EXECUTE_TASK","task":"{\\"id\\":25,\\"commandClsId\\":\\"EXECUTE_SCRIPT\\",\\"deleted\\":false,\\"parameterMap\\":{\\"SCRIPT_LABEL\\":\\"uninstallAgent\\",\\"SCRIPT_GENERAL_TYPE\\":\\"SYSTEM\\",\\"SCRIPT_FILE_ID\\":625,\\"SCRIPT_CONTENTS\\":\\"$u_app = Get-WmiObject -Class Win32_Product | Where-Object{ $_.Name -match \\\\\\"gardiyan\\\\\\" }\\\\r\\\\n$u_app.Uninstall()\\\\r\\\\n\\\\r\\\\nRemove-Item -Path \\\\\\"C:\\\\\\\\ProgramData\\\\\\\\Gardiyan_v2\\\\\\" -Recurse -Force\\",\\"SCRIPT_TYPE\\":\\"WINDOWS\\"},\\"cronExpression\\":null,\\"createDate\\":1710936549302,\\"modifyDate\\":null,\\"details\\":\\"uninstallAgent\\",\\"version\\":1,\\"generalType\\":\\"SYSTEM\\",\\"plugin\\":{\\"policyPlugin\\":false,\\"modifyDate\\":1710936549386,\\"description\\":\\"Karçin Gardiyan Plugin\\",\\"active\\":true,\\"version\\":\\"1.0\\",\\"xBased\\":false,\\"machineOriented\\":true,\\"deleted\\":false,\\"usesFileTransfer\\":false,\\"name\\":\\"script\\",\\"id\\":1,\\"taskPlugin\\":true,\\"userOriented\\":false,\\"createDate\\":1710936549386},\\"mailSend\\":false}","timestamp":"20-03-2024 15:09","fileServerConf":null}</body></message>
admin	271	001714218014919	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.1</body></message>
admin	272	001714218015205	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	273	001714218015234	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	276	001714396140515	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.1</body></message>
admin	277	001714396140837	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	278	001714396140865	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	291	001715166676742	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.1</body></message>
admin	292	001715166676943	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	293	001715166676998	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	296	001716029331793	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.1</body></message>
admin	297	001716029331989	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	298	001716029332030	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	301	001722600281020	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.3</body></message>
admin	302	001722600281256	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	303	001722600281278	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	304	001722773081856	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.3</body></message>
admin	305	001722773082088	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	306	001722773082091	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	311	001722945882592	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.3</body></message>
admin	312	001722945882896	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	392	001723118683766	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.3</body></message>
admin	396	001723118683984	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.3</body></message>
admin	393	001723118684328	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	397	001723118684448	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	401	001723291485556	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.3</body></message>
admin	402	001723464286128	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.8.3</body></message>
admin	406	001730457361933	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.9.0</body></message>
admin	407	001730457362442	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	416	001730706355121	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.9.1</body></message>
admin	417	001730706357292	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	418	001730706357307	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	446	001732172021884	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.9.2</body></message>
admin	447	001732172022244	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	448	001732172022277	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
admin	451	001733382833277	133	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Openfire 4.9.2</body></message>
admin	452	001733382834134	131	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: Search 1.7.4</body></message>
admin	453	001733382834232	143	<message from="im.kurum.gov.tr" to="admin@im.kurum.gov.tr"><body>A server or plugin update was found: User Status Plugin 1.3.0</body></message>
\.


--
-- Data for Name: ofpresence; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpresence (username, offlinepresence, offlinedate) FROM stdin;
2	\N	001652454116512
3	\N	001710936546113
4	\N	001710940655862
1	\N	001722954067332
10	\N	001723012230882
15	\N	001723469622078
\.


--
-- Data for Name: ofprivacylist; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofprivacylist (username, name, isdefault, list) FROM stdin;
\.


--
-- Data for Name: ofproperty; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofproperty (name, propvalue, encrypted, iv) FROM stdin;
cache.MUCService'conference'Rooms.maxLifetime	-1	0	\N
cache.MUCService'conference'Rooms.size	-1	0	\N
passwordKey	jO9bafVQCg5ht5X	0	\N
xmpp.client.idle	7000	0	\N
xmpp.client.idle.ping	true	0	\N
register.inband	true	0	\N
register.password	true	0	\N
xmpp.auth.anonymous	true	0	\N
sasl.mechs.00001	ANONYMOUS	0	\N
sasl.mechs.00002	PLAIN	0	\N
stream.management.active	false	0	\N
cache.MUCService'conference'RoomStatistics.maxLifetime	-1	0	\N
cache.MUCService'conference'RoomStatistics.size	-1	0	\N
update.lastCheck	1733382834139	0	\N
\.


--
-- Data for Name: ofpubsubaffiliation; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubaffiliation (serviceid, nodeid, jid, affiliation) FROM stdin;
pubsub		im.kurum.gov.tr	owner
gardiyan_sunucu@im.kurum.gov.tr	gardiyan_sunucu@im.kurum.gov.tr	gardiyan_sunucu@im.kurum.gov.tr	owner
\.


--
-- Data for Name: ofpubsubdefaultconf; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubdefaultconf (serviceid, leaf, deliverpayloads, maxpayloadsize, persistitems, maxitems, notifyconfigchanges, notifydelete, notifyretract, presencebased, senditemsubscribe, publishermodel, subscriptionenabled, accessmodel, language, replypolicy, associationpolicy, maxleafnodes) FROM stdin;
pubsub	1	1	10485760	0	1	1	1	1	0	1	publishers	1	open	English	\N	all	-1
pubsub	0	0	0	0	0	1	1	1	0	0	publishers	1	open	English	\N	all	-1
gardiyan_sunucu@im.kurum.gov.tr	1	1	10485760	1	1	1	1	1	0	1	publishers	1	presence	English	\N	all	-1
gardiyan_sunucu@im.kurum.gov.tr	0	0	0	0	0	1	1	1	0	0	publishers	1	presence	English	\N	all	-1
\.


--
-- Data for Name: ofpubsubitem; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubitem (serviceid, nodeid, id, jid, creationdate, payload) FROM stdin;
\.


--
-- Data for Name: ofpubsubnode; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubnode (serviceid, nodeid, leaf, creationdate, modificationdate, parent, deliverpayloads, maxpayloadsize, persistitems, maxitems, notifyconfigchanges, notifydelete, notifyretract, presencebased, senditemsubscribe, publishermodel, subscriptionenabled, configsubscription, accessmodel, payloadtype, bodyxslt, dataformxslt, creator, description, language, name, replypolicy, associationpolicy, maxleafnodes) FROM stdin;
pubsub		0	001652252877917	001652252877917	\N	0	0	0	0	1	1	1	0	0	publishers	1	0	open				im.kurum.gov.tr		English		\N	all	-1
gardiyan_sunucu@im.kurum.gov.tr	gardiyan_sunucu@im.kurum.gov.tr	0	001652257545292	001652257545292	\N	0	0	0	0	1	1	1	0	0	publishers	1	0	presence				gardiyan_sunucu@im.kurum.gov.tr		English		\N	all	-1
\.


--
-- Data for Name: ofpubsubnodegroups; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubnodegroups (serviceid, nodeid, rostergroup) FROM stdin;
\.


--
-- Data for Name: ofpubsubnodejids; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubnodejids (serviceid, nodeid, jid, associationtype) FROM stdin;
\.


--
-- Data for Name: ofpubsubsubscription; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofpubsubsubscription (serviceid, nodeid, id, jid, owner, state, deliver, digest, digest_frequency, expire, includebody, showvalues, subscriptiontype, subscriptiondepth, keyword) FROM stdin;
\.


--
-- Data for Name: ofremoteserverconf; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofremoteserverconf (xmppdomain, remoteport, permission) FROM stdin;
\.


--
-- Data for Name: ofroster; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofroster (rosterid, username, jid, sub, ask, recv, nick, stanza) FROM stdin;
1	test1	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
6	1-s	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
7	1	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
8	2-s	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
9	2	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
11	3	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
12	4	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
16	10	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
21	1	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
26	15	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
31	0	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
32	20	gardiyan_sunucu@im.kurum.gov.tr	3	-1	-1	\N	\N
\.


--
-- Data for Name: ofrostergroups; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofrostergroups (rosterid, rank, groupname) FROM stdin;
\.


--
-- Data for Name: ofsaslauthorized; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofsaslauthorized (username, principal) FROM stdin;
\.


--
-- Data for Name: ofsecurityauditlog; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofsecurityauditlog (msgid, username, entrystamp, summary, node, details) FROM stdin;
1	admin	1652253722702	Failed admin console login attempt	im.kurum.gov.tr	A failed login attempt to the admin console was made from address 172.16.21.1. 
2	admin	1652253725328	Failed admin console login attempt	im.kurum.gov.tr	A failed login attempt to the admin console was made from address 172.16.21.1. 
3	admin	1652253728171	Failed admin console login attempt	im.kurum.gov.tr	A failed login attempt to the admin console was made from address 172.16.21.1. 
4	admin	1652253756794	Failed admin console login attempt	im.kurum.gov.tr	A failed login attempt to the admin console was made from address 172.16.21.1. 
5	admin	1652253863936	Failed admin console login attempt	im.kurum.gov.tr	A failed login attempt to the admin console was made from address 172.16.21.1. 
6	admin	1652253886533	Failed admin console login attempt	im.kurum.gov.tr	A failed login attempt to the admin console was made from address 172.16.21.1. 
7	admin	1652253888194	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.1. 
8	admin	1652255794511	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.1. 
9	admin	1652255851092	created new user gardiyan_sunucu	im.kurum.gov.tr	name = null, email = null, admin = false
10	admin	1652255851099	added group member to null	im.kurum.gov.tr	username = gardiyan_sunucu
11	admin	1652255967733	uploaded plugin 	im.kurum.gov.tr	\N
12	admin	1652256048660	uploaded plugin userstatus.jar	im.kurum.gov.tr	\N
13	admin	1652256052241	uploaded plugin gardiyanplugin.jar	im.kurum.gov.tr	\N
14	admin	1652256079404	created new user test1	im.kurum.gov.tr	name = null, email = null, admin = false
15	admin	1652256079409	added group member to null	im.kurum.gov.tr	username = test1
16	admin	1652256301462	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.1. 
17	admin	1652257403770	Updated connection settings for SOCKET_C2S	im.kurum.gov.tr	plain: enabled=true, port=5222\nlegacy: enabled=true, port=5223\n
18	admin	1652257403785	set server property xmpp.client.idle	im.kurum.gov.tr	xmpp.client.idle = 7 seconds
19	admin	1652257403789	set server property xmpp.client.idle.ping	im.kurum.gov.tr	xmpp.client.idle.ping = true
20	admin	1652257537269	edited registration settings	im.kurum.gov.tr	inband enabled = true\ncan change password = true\nanon login = true\nallowed ips = \nblocked ips = \nSASL mechanisms enabled = [ANONYMOUS, PLAIN]
21	admin	1652339445770	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.1. 
22	admin	1652350185331	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.1. 
23	admin	1652350196850	closed session for address 2@im.kurum.gov.tr/agent	im.kurum.gov.tr	\N
24	admin	1652350245401	closed session for address 2@im.kurum.gov.tr/agent	im.kurum.gov.tr	\N
25	admin	1652350252768	closed session for address 1@im.kurum.gov.tr/agent	im.kurum.gov.tr	\N
26	admin	1652350265292	closed session for address 1@im.kurum.gov.tr/agent	im.kurum.gov.tr	\N
27	admin	1652350392880	Updated server property stream.management.active	im.kurum.gov.tr	Property created with value 'false'
28	admin	1652350432116	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.1. 
29	admin	1652350518016	closed session for address 2@im.kurum.gov.tr/agent	im.kurum.gov.tr	\N
30	admin	1652350530662	closed session for address 1@im.kurum.gov.tr/agent	im.kurum.gov.tr	\N
31	admin	1652364202785	Failed admin console login attempt	im.kurum.gov.tr	A failed login attempt to the admin console was made from address 172.16.20.204. 
32	admin	1652364204075	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.20.204. 
33	admin	1652424010902	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.1. 
34	admin	1652699528707	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.1. 
35	admin	1696429593171	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.20.190. 
36	admin	1710932502504	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.20.205. 
37	admin	1722604277230	Failed admin console login attempt	im.kurum.gov.tr	A failed login attempt to the admin console was made from address 10.212.134.201. 
38	admin	1722604281001	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 10.212.134.201. 
39	admin	1722606402781	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 10.212.134.200. 
40	admin	1722934747457	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.121. 
41	admin	1723012275066	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.121. 
42	admin	1723189939721	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.121. 
43	admin	1723445069024	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 172.16.21.121. 
44	admin	1730703503848	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 192.168.233.1. 
45	admin	1730703641156	uploaded plugin gardiyanplugin.jar	im.kurum.gov.tr	\N
46	admin	1730703647258	uploaded plugin userstatus.jar	im.kurum.gov.tr	\N
47	admin	1730707343361	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 192.168.233.1. 
48	admin	1730709582565	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 192.168.233.1. 
49	admin	1733426263033	Successful admin console login attempt	im.kurum.gov.tr	The user logged in successfully to the admin console from address 192.168.60.1. 
\.


--
-- Data for Name: ofuser; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofuser (username, storedkey, serverkey, salt, iterations, plainpassword, encryptedpassword, name, email, creationdate, modificationdate) FROM stdin;
admin	\N	\N	\N	\N	admin	\N	Administrator	admin@example.com	0              	0              
gardiyan_sunucu	ijGThKBFaCQObyd0QlBFZX85sIg=	GyvjuBvziHLI2ZknClfwvUMQCWA=	e3MLuKe8mmE/SSsCO37FWqNo2gLI4vhR	4096	\N	09f18f35ec9f5670b7d418102280d097a0870dfc9c178fd0c2982f41c1fbd8ffec2fc90c65307216	\N	\N	001652255851066	001652255851066
3	C5o2cyDP4yAlVPevaM2NDHl/Fcs=	GiQAIYTr4UFtrHXcR8UgJsVsXQo=	5njgMffPiONh1IeMRcikuYV/04nlPMgC	4096	\N	7217e7d80018bd8046f71ed20b69458d8feb2768f19866a8d5a56e12e225347077429738d304058a	DESKTOP-S41NC04	\N	001710932573519	001710932573519
4	icI4tTgnvkibC5SinzCpm6Nn/2g=	zjhKFKIfxmtaKbYKdn0OGCOLBaI=	LGz0+ENxGbY5giP6WW0Qrbvc1O9fatpk	4096	\N	142e2884249d48c543cd88b45312f5f3806a0aaf35d6016c42a7e5736cb07b67654e3d209d6bd37d	DESKTOP-S41NC04	\N	001710936575505	001710936575505
10	7XIAB2zVCGmoTnOd5gOriH447uc=	u2pzm5DDNB+AAPZDwu9M6I+zJU0=	hM70DMaJBexlpdZiabehbd3G3g+bC7dL	4096	\N	449db7163bec321b3de3b78b6ad7d698ae0b14b62c71727ad9ba29fb5fd9b59cfbef0a8eef218769	DESKTOP-8RSDQLN	\N	001722606430278	001722606430278
1	Bdve9CJRBxxpXFlquvEDXM9/d9A=	TVvfI6zH9jWRWOvyXdfBlUoCE1E=	OnRtLjxyEQ6ck/MOvDzIwHkSqN0jz0mW	4096	\N	eac4b21707229e1d76afdf2291bff0968ae6dacabcea980baa7efb69d1ab13780b477af968c2f02c	DESKTOP-1IAJ6L4	\N	001722938930445	001722938930445
15	okDPcjJAmbFjWfHHz/tWfNyJtLo=	CYcH2udmtVdtgkdiEVhEYDo9PZQ=	1glbQEwY6oK+yF/nn9wVJh3P8grmsHUA	4096	\N	1a0497ceba065acdf9edbf41a0b55517abe347fe4b910fdea012177dd82e5a2f642cd0fb6e0850da	Desktop-OZGUR	\N	001723012268083	001723012268083
0	WoXh7JM7I46qgKWA7+337OW0HaI=	VO1jgDjGZ/5tZ1ZANIR9iO8n1W4=	KXAYh/JLG4dIKTaxWZzn96a9QP61vUnI	4096	\N	256c5d2e987cf23d4acab65dee8e1392025cf94e4c899e6da0316386ba25e25fe4339268e119fc96	PC-SISTEM-19	\N	001730703697622	001730703697622
20	IWjMZo9dLjYXrmkUcTJ5s94tRIs=	ahqqn3OfihmyXLoAovJwFC9R/aE=	bqY58WwdbOROKeLOEdMAYPpgYzjUsAzd	4096	\N	3c1c76ffe0ded28a42aeb584280e60a7a8fb0bba30a129b2731e24327e2dd207fd3bec2fa0be08e1	PC-SISTEM-19	\N	001730703698571	001730703698571
\.


--
-- Data for Name: ofuserflag; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofuserflag (username, name, starttime, endtime) FROM stdin;
\.


--
-- Data for Name: ofuserprop; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofuserprop (username, name, propvalue) FROM stdin;
admin	console.refresh	session-summary=10
admin	console.rows_per_page	/session-summary.jsp=25,/server-properties.jsp=25,/muc-room-summary.jsp=25,/security-audit-viewer.jsp=25,/group-summary.jsp=25
\.


--
-- Data for Name: ofvcard; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofvcard (username, vcard) FROM stdin;
\.


--
-- Data for Name: ofversion; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.ofversion (name, version) FROM stdin;
user-status	1
openfire	34
\.


--
-- Data for Name: userstatus; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.userstatus (username, resource, online, presence, lastipaddress, lastlogindate, lastlogoffdate) FROM stdin;
1	agent	0	unavailable    	192.168.233.1381                             	001722952886114	001722954067336
10	agent	0	unavailable    	192.168.233.1381                             	001723011678100	001723012230890
15	agent	0	unavailable    	192.168.233.1381                             	001723465740718	001723469622082
gardiyan_sunucu	Smack	0	available      	127.0.0.1                                    	001732172170238	001730706517539
20	agent	0	available      	192.168.233.1                                	001730874685729	\N
\.


--
-- Data for Name: userstatushistory; Type: TABLE DATA; Schema: openfire; Owner: postgres
--

COPY openfire.userstatushistory (historyid, username, resource, lastipaddress, lastlogindate, lastlogoffdate) FROM stdin;
74	1	agent	192.168.233.1381                             	001722938935441	001722939819409
75	1	agent	192.168.233.1381                             	001722952886114	001722954067336
76	gardiyan_sunucu	Smack	127.0.0.1                                    	001722952886087	001722955970965
77	10	agent	192.168.233.1381                             	001723011678100	001723012230890
78	gardiyan_sunucu	Smack	127.0.0.1                                    	001723011711179	001723015308433
79	15	agent	192.168.233.1381                             	001723012273522	001723020971968
80	gardiyan_sunucu	Smack	127.0.0.1                                    	001723017302218	001723190334437
81	15	agent	192.168.233.1381                             	001723465740718	001723469622082
82	gardiyan_sunucu	Smack	127.0.0.1                                    	001723210765684	001723473282995
83	gardiyan_sunucu	Smack	127.0.0.1                                    	001730703693336	001730703995743
84	gardiyan_sunucu	Smack	127.0.0.1                                    	001730706482139	001730706517539
\.


--
-- Data for Name: kr_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent (agent_id, agent_version, create_date, is_deleted, dn, domain_name, hostname, jid, license_status, modify_date, operating_system, service_version, version, domain_status, tags, trusted_status, system_id, agent_build, guid, domain_trusted, ip_address) FROM stdin;
20	2.5.1	2024-11-04 10:01:36.15	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	workgroup	PC-SISTEM-19		t	\N	Windows	\N	3	\N	\N	\N	\N	4	b60dc0b09e1aee674948043d1b8585bd	\N	192.168.233.1
\.


--
-- Data for Name: kr_agent_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_collection (agent_collection_id, collection_type, create_date, is_deleted, description, filters, modify_date, name, version, parent_id, excel_file_name, owner) FROM stdin;
\.


--
-- Data for Name: kr_agent_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_configuration (agent_configuration_id, create_date, is_deleted, dn, settings, type, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_critical_process; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_critical_process (agent_critical_process_id, agent_send_date, cmd_line, cpu_percent, create_date, created, mem_percent, mem_rss, mem_vms, name, pid, status, user0, agent_critical_record_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_critical_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_critical_record (agent_critical_record_id, agent_send_date, cpu, create_date, critic_type, is_deleted, disk, ram, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_disk_usage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_disk_usage (agent_disk_usage_id, create_date, is_deleted, disk_name, free_disk, rate, total_disk, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_event_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_event_log (agent_event_log_id, begin_date, create_date, is_deleted, end_date, id_list, user0, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_event_log_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_event_log_detail (agent_event_log_detail_id, instance_id, category, category_number, container, data, entry_type, event_id, index, machine_name, message, replacement_strings, site, source, time_generated, time_written, username, agent_event_log_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_file (agent_file_id, agent_file_path, agent_version, create_date, is_deleted, description, modify_date, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_file_integrity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_file_integrity (agent_file_integrity_id, create_date, is_deleted, description, event, event_date, folder_type, user0, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_file_tracking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_file_tracking (agent_file_tracking, create_date, is_deleted, modify_date, path, path_type, process_date, process_type, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_folder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_folder (agent_folder_id, create_date, is_deleted, details, folder_type, name, parent_id_tree, version, parent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_hardware; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_hardware (agent_hardware_id, agent_send_date, create_date, is_deleted, modify_date, property_name, property_value, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_hardware_constraints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_hardware_constraints (agent_hardware_constraints_id, create_date, is_deleted, description, label, linux_disable_script_label, linux_enable_script_label, macos_disable_script_label, macos_enable_script_label, modify_date, refreshscriptkey, windows_disable_script_label, windows_enable_script_label, version) FROM stdin;
1	2023-03-17 14:38:49.32	f	WEB Camera türündeki görüntüleme aygıtlarını kullanma	Webcam Camera	lin_hsc_webcam_disable	lin_hsc_webcam_enable	dar_hsc_webcam_disable	dar_hsc_webcam_enable	\N	webcam	win_hsc_webcam_disable	win_hsc_webcam_enable	1
2	2023-03-20 14:56:37.29	f	Bluetooth üzerinden istemciye bağlanan aygıtları kullanma	Bluetooth	lin_hsc_bluetooth_disable	lin_hsc_bluetooth_enable	dar_hsc_bluetooth_disable	dar_hsc_bluetooth_enable	\N	bluetooth	win_hsc_bluetooth_disable	win_hsc_bluetooth_enable	1
3	2023-03-20 14:59:08.727	f	USB arayüzünden istemciye bağlanan depolama alanlarını kullanıma	USB Depolama	lin_hsc_usbstor_disable	lin_hsc_usbstor_enable	dar_hsc_usbstor_disable	dar_hsc_usbstor_enable	\N	usbstor	win_hsc_usbstor_disable	win_hsc_usbstor_enable	1
4	2023-03-20 15:00:23.258	f	USB üzerinden istemciye bağlanan ses giriş çıkış aygıtlarını kullanma	USB Ses Giriş/Çıkış	lin_hsc_usbaudio_disable	lin_hsc_usbaudio_enable	dar_hsc_usbaudio_disable	dar_hsc_usbaudio_enable	\N	usbaudio	win_hsc_usbaudio_disable	win_hsc_usbaudio_enable	1
5	2023-03-20 15:01:35.559	f	USB üzerinden istemciye bağlanan yazıcı aygıtlarını kullanma	USB Yazıcı	lin_hsc_usbprint_disable	lin_hsc_usbprint_enable	dar_hsc_usbprint_disable	dar_hsc_usbprint_enable	\N	usbprint	win_hsc_usbprint_disable	win_hsc_usbprint_enable	1
6	2023-03-20 15:02:33.24	f	CD - DVD ve BlueRAY tipi optik okuyucuları kullanma	CD/DVD-ROM Sürücüsü	lin_hsc_cdrom_disable	lin_hsc_cdrom_enable	dar_hsc_cdrom_disable	dar_hsc_cdrom_enable	\N	cdrom	win_hsc_cdrom_disable	win_hsc_cdrom_enable	1
\.


--
-- Data for Name: kr_agent_hardware_constraints_last_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_hardware_constraints_last_status (agent_hardware_constraints_last_status_id, create_date, is_deleted, modify_date, status, version, agent_id, agent_hardware_constraints_id) FROM stdin;
13	2024-08-02 16:48:19.581	f	2024-08-02 16:48:19.58	t	1	10	3
14	2024-08-02 16:48:19.649	f	2024-08-02 16:48:19.649	t	1	10	4
15	2024-08-02 16:48:19.711	f	2024-08-02 16:48:19.711	t	1	10	5
16	2024-08-02 16:48:19.771	f	2024-08-02 16:48:19.771	t	1	10	6
17	2024-08-02 16:48:19.839	f	2024-08-02 16:48:19.839	t	1	10	2
18	2024-08-02 16:48:19.911	f	2024-08-02 16:48:19.911	f	1	10	1
19	2024-08-06 13:25:48.686	f	2024-08-06 13:25:48.686	t	1	1	3
20	2024-08-06 13:25:48.792	f	2024-08-06 13:25:48.792	t	1	1	4
21	2024-08-06 13:25:48.954	f	2024-08-06 13:25:48.954	t	1	1	5
22	2024-08-06 13:25:49.052	f	2024-08-06 13:25:49.052	t	1	1	6
23	2024-08-06 13:25:49.153	f	2024-08-06 13:25:49.153	t	1	1	2
24	2024-08-06 13:25:49.246	f	2024-08-06 13:25:49.246	f	1	1	1
25	2024-08-07 09:37:29.453	f	2024-08-07 09:37:29.453	t	1	15	3
26	2024-08-07 09:37:29.54	f	2024-08-07 09:37:29.54	t	1	15	4
27	2024-08-07 09:37:29.627	f	2024-08-07 09:37:29.627	t	1	15	5
28	2024-08-07 09:37:29.723	f	2024-08-07 09:37:29.723	t	1	15	6
29	2024-08-07 09:37:29.811	f	2024-08-07 09:37:29.811	t	1	15	2
30	2024-08-07 09:37:29.903	f	2024-08-07 09:37:29.903	f	1	15	1
31	2024-11-04 11:46:23.111	f	2024-11-04 11:46:23.111	t	1	20	3
32	2024-11-04 11:46:23.289	f	2024-11-04 11:46:23.289	t	1	20	4
33	2024-11-04 11:46:23.506	f	2024-11-04 11:46:23.506	t	1	20	5
34	2024-11-04 11:46:23.665	f	2024-11-04 11:46:23.665	t	1	20	6
35	2024-11-04 11:46:23.828	f	2024-11-04 11:46:23.827	t	1	20	2
36	2024-11-04 11:46:23.995	f	2024-11-04 11:46:23.995	t	1	20	1
\.


--
-- Data for Name: kr_agent_hardware_constraints_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_hardware_constraints_task (agent_hardware_constraints_task_id, create_date, is_deleted, dn_type_detail, modify_date, owner_uid, process_type, total, type, uid_list, version, agent_hardware_constraints_id) FROM stdin;
1	2024-03-20 14:05:58.694	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
2	2024-03-20 14:06:57.663	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
3	2024-03-20 14:35:51.827	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
4	2024-03-20 14:53:55.762	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
5	2024-03-20 14:55:31.338	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
6	2024-03-20 14:57:13.069	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
7	2024-03-20 14:57:39.445	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
8	2024-03-20 14:57:43.982	f	3	\N	admin	DISABLE	1	client	[3]	1	3
9	2024-03-20 14:57:44.148	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
10	2024-03-20 14:57:44.618	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
11	2024-03-20 14:57:46.003	f	3	\N	admin	ENABLE	1	client	[3]	1	3
12	2024-03-20 14:57:46.155	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
13	2024-03-20 14:57:46.615	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
14	2024-03-20 14:58:09.23	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
15	2024-03-20 14:58:43.615	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
16	2024-03-20 14:59:42.002	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
17	2024-03-20 15:03:35.628	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
18	2024-03-20 15:05:23.383	f	3	\N	admin	REFRESH	1	client	[3]	1	\N
19	2024-03-20 15:09:51.975	f	4	\N	admin	REFRESH	1	client	[4]	1	\N
20	2024-03-20 15:09:56.661	f	4	\N	admin	REFRESH	1	client	[4]	1	\N
21	2024-03-20 15:10:21.894	f	4	\N	admin	REFRESH	1	client	[4]	1	\N
22	2024-03-20 15:11:58.162	f	4	\N	admin	REFRESH	1	client	[4]	1	\N
23	2024-03-20 15:13:23.542	f	4	\N	admin	REFRESH	1	client	[4]	1	\N
24	2024-08-02 16:48:18.85	f	10	\N	admin	REFRESH	1	client	[10]	1	\N
25	2024-08-02 17:12:06.587	f	10	\N	admin	REFRESH	1	client	[10]	1	\N
26	2024-08-02 17:46:12.963	f	10	\N	admin	REFRESH	1	client	[10]	1	\N
27	2024-08-02 17:46:25.944	f	10	\N	admin	REFRESH	1	client	[10]	1	\N
28	2024-08-05 11:38:43.89	f	10	\N	ecan	REFRESH	1	client	[10]	1	\N
29	2024-08-06 13:25:47.433	f	1	\N	admin	REFRESH	1	client	[1]	1	\N
30	2024-08-06 13:26:29.228	f	1	\N	admin	REFRESH	1	client	[1]	1	\N
31	2024-08-06 13:26:38.295	f	1	\N	admin	REFRESH	1	client	[1]	1	\N
32	2024-08-06 13:30:21.623	f	1	\N	admin	REFRESH	1	client	[1]	1	\N
33	2024-08-06 13:39:06.486	f	1	\N	admin	REFRESH	1	client	[1]	1	\N
34	2024-08-06 13:39:44.706	f	1	\N	admin	REFRESH	1	client	[1]	1	\N
35	2024-08-06 13:39:51.829	f	1	\N	admin	REFRESH	1	client	[1]	1	\N
36	2024-08-06 13:39:56.966	f	1	\N	admin	REFRESH	1	client	[1]	1	\N
37	2024-08-06 17:24:24.321	f	10	\N	admin	REFRESH	1	client	[10]	1	\N
38	2024-08-06 17:24:42.628	f	10	\N	admin	REFRESH	1	client	[10]	1	\N
39	2024-08-06 17:24:46.591	f	10	\N	admin	REFRESH	1	client	[10]	1	\N
40	2024-08-06 17:24:51.835	f	10	\N	admin	REFRESH	1	client	[10]	1	\N
41	2024-08-07 09:37:28.438	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
42	2024-08-07 09:50:18.522	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
43	2024-08-07 09:50:33.171	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
44	2024-08-07 11:17:54.152	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
45	2024-08-12 15:24:41.529	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
46	2024-08-12 15:29:04.518	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
47	2024-08-12 16:28:02.333	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
48	2024-08-12 16:28:05.462	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
49	2024-08-12 16:28:12.542	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
50	2024-08-12 16:28:46.097	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
51	2024-08-12 16:29:04.224	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
52	2024-08-12 16:29:29.219	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
53	2024-08-12 16:30:07.536	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
54	2024-08-12 16:31:35.764	f	15	\N	admin	REFRESH	1	client	[15]	1	\N
55	2024-11-04 11:46:21.847	f	20	\N	admin	REFRESH	1	client	[20]	1	\N
56	2024-11-04 11:47:06.683	f	20	\N	admin	REFRESH	1	client	[20]	1	\N
57	2024-11-04 11:49:13.997	f	20	\N	admin	REFRESH	1	client	[20]	1	\N
\.


--
-- Data for Name: kr_agent_hardware_constraints_task_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_hardware_constraints_task_result (agent_hardware_constraints_task_result_id, create_date, is_deleted, dn, modify_date, operating_system, owner_uid, response_data, response_message, version, agent_hardware_constraints_task_id, agent_id, agent_hardware_constraints_id) FROM stdin;
129	2024-08-02 16:48:19.535	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	24	10	3
130	2024-08-02 16:48:19.609	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	24	10	4
131	2024-08-02 16:48:19.674	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	24	10	5
132	2024-08-02 16:48:19.734	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	24	10	6
133	2024-08-02 16:48:19.798	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	24	10	2
134	2024-08-02 16:48:19.87	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	24	10	1
135	2024-08-02 17:46:13.699	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	26	10	3
136	2024-08-02 17:46:13.784	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	26	10	4
137	2024-08-02 17:46:13.852	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	26	10	5
138	2024-08-02 17:46:13.915	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	26	10	6
139	2024-08-02 17:46:13.982	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	26	10	2
140	2024-08-02 17:46:14.047	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	26	10	1
141	2024-08-02 17:46:26.544	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	27	10	3
142	2024-08-02 17:46:26.601	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	27	10	4
143	2024-08-02 17:46:26.658	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	27	10	5
144	2024-08-02 17:46:26.716	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	27	10	6
145	2024-08-02 17:46:26.771	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	27	10	2
146	2024-08-02 17:46:26.826	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	27	10	1
147	2024-08-05 11:38:44.604	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	ecan	\\x2275736273746f723a3322	SUCCESS	1	28	10	3
148	2024-08-05 11:38:44.66	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	ecan	\\x22757362617564696f3a3322	SUCCESS	1	28	10	4
149	2024-08-05 11:38:44.709	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	ecan	\\x227573627072696e743a3322	SUCCESS	1	28	10	5
150	2024-08-05 11:38:44.758	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	ecan	\\x226364726f6d3a3122	SUCCESS	1	28	10	6
151	2024-08-05 11:38:44.807	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	ecan	\\x22626c7565746f6f74683a3322	SUCCESS	1	28	10	2
152	2024-08-05 11:38:44.855	f	CN=DESKTOP-8RSDQLN,OU=WORKGROUP,DC=workgroup	\N	Windows	ecan	\\x2277656263616d3a3422	SUCCESS	1	28	10	1
153	2024-08-06 13:25:48.626	f	CN=DESKTOP-1IAJ6L4,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	29	1	3
154	2024-08-06 13:25:48.735	f	CN=DESKTOP-1IAJ6L4,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	29	1	4
155	2024-08-06 13:25:48.836	f	CN=DESKTOP-1IAJ6L4,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	29	1	5
156	2024-08-06 13:25:48.992	f	CN=DESKTOP-1IAJ6L4,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	29	1	6
157	2024-08-06 13:25:49.094	f	CN=DESKTOP-1IAJ6L4,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	29	1	2
158	2024-08-06 13:25:49.193	f	CN=DESKTOP-1IAJ6L4,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	29	1	1
159	2024-08-06 13:26:30.081	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	30	1	3
160	2024-08-06 13:26:30.159	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	30	1	4
161	2024-08-06 13:26:30.236	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	30	1	5
162	2024-08-06 13:26:30.317	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	30	1	6
163	2024-08-06 13:26:30.386	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	30	1	2
164	2024-08-06 13:26:30.464	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	30	1	1
165	2024-08-06 13:26:39.124	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	31	1	3
166	2024-08-06 13:26:39.211	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	31	1	4
167	2024-08-06 13:26:39.294	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	31	1	5
168	2024-08-06 13:26:39.361	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	31	1	6
169	2024-08-06 13:26:39.428	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	31	1	2
170	2024-08-06 13:26:39.498	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	31	1	1
171	2024-08-06 13:30:22.418	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	32	1	3
172	2024-08-06 13:30:22.494	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	32	1	4
173	2024-08-06 13:30:22.571	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	32	1	5
174	2024-08-06 13:30:22.644	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	32	1	6
175	2024-08-06 13:30:22.729	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	32	1	2
176	2024-08-06 13:30:22.813	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	32	1	1
177	2024-08-06 13:39:07.279	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	33	1	3
178	2024-08-06 13:39:07.382	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	33	1	4
179	2024-08-06 13:39:07.461	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	33	1	5
180	2024-08-06 13:39:07.545	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	33	1	6
181	2024-08-06 13:39:07.62	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	33	1	2
182	2024-08-06 13:39:07.702	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	33	1	1
183	2024-08-06 13:39:45.54	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	34	1	3
184	2024-08-06 13:39:45.636	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	34	1	4
185	2024-08-06 13:39:45.708	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	34	1	5
186	2024-08-06 13:39:45.791	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	34	1	6
187	2024-08-06 13:39:45.869	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	34	1	2
188	2024-08-06 13:39:45.94	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	34	1	1
189	2024-08-06 13:39:52.686	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	35	1	3
190	2024-08-06 13:39:52.763	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	35	1	4
191	2024-08-06 13:39:52.842	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	35	1	5
192	2024-08-06 13:39:52.916	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	35	1	6
193	2024-08-06 13:39:53.002	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	35	1	2
194	2024-08-06 13:39:53.114	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	35	1	1
195	2024-08-06 13:39:57.819	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	36	1	3
196	2024-08-06 13:39:57.917	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	36	1	4
197	2024-08-06 13:39:58.015	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	36	1	5
198	2024-08-06 13:39:58.09	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	36	1	6
199	2024-08-06 13:39:58.164	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	36	1	2
200	2024-08-06 13:39:58.233	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	36	1	1
201	2024-08-06 17:24:25.26	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	37	10	3
202	2024-08-06 17:24:25.37	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	37	10	4
203	2024-08-06 17:24:25.44	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	37	10	5
204	2024-08-06 17:24:25.51	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	37	10	6
205	2024-08-06 17:24:25.58	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	37	10	2
206	2024-08-06 17:24:25.656	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	37	10	1
207	2024-08-06 17:24:43.409	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	38	10	3
208	2024-08-06 17:24:43.483	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	38	10	4
209	2024-08-06 17:24:43.564	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	38	10	5
210	2024-08-06 17:24:43.652	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	38	10	6
211	2024-08-06 17:24:43.72	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	38	10	2
212	2024-08-06 17:24:43.788	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	38	10	1
213	2024-08-06 17:24:47.408	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	39	10	3
214	2024-08-06 17:24:47.477	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	39	10	4
215	2024-08-06 17:24:47.548	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	39	10	5
216	2024-08-06 17:24:47.606	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	39	10	6
217	2024-08-06 17:24:47.68	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	39	10	2
218	2024-08-06 17:24:47.751	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	39	10	1
219	2024-08-06 17:24:52.732	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	40	10	3
220	2024-08-06 17:24:53.159	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	40	10	4
221	2024-08-06 17:24:53.425	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	40	10	5
222	2024-08-06 17:24:53.559	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	40	10	6
223	2024-08-06 17:24:53.68	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	40	10	2
224	2024-08-06 17:24:53.748	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	40	10	1
225	2024-08-07 09:37:29.387	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	41	15	3
226	2024-08-07 09:37:29.487	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	41	15	4
227	2024-08-07 09:37:29.576	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	41	15	5
228	2024-08-07 09:37:29.666	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	41	15	6
229	2024-08-07 09:37:29.757	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	41	15	2
230	2024-08-07 09:37:29.846	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	41	15	1
231	2024-08-07 09:50:19.354	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	42	15	3
232	2024-08-07 09:50:19.433	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	42	15	4
233	2024-08-07 09:50:19.516	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	42	15	5
234	2024-08-07 09:50:19.581	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	42	15	6
235	2024-08-07 09:50:19.646	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	42	15	2
236	2024-08-07 09:50:19.709	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	42	15	1
237	2024-08-07 09:50:33.981	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	43	15	3
238	2024-08-07 09:50:34.055	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	43	15	4
239	2024-08-07 09:50:34.142	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	43	15	5
240	2024-08-07 09:50:34.217	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	43	15	6
241	2024-08-07 09:50:34.293	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	43	15	2
242	2024-08-07 09:50:34.369	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	43	15	1
243	2024-08-07 11:17:55.015	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	44	15	3
244	2024-08-07 11:17:55.103	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	44	15	4
245	2024-08-07 11:17:55.174	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	44	15	5
246	2024-08-07 11:17:55.277	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	44	15	6
247	2024-08-07 11:17:55.406	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	44	15	2
248	2024-08-07 11:17:55.465	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	44	15	1
249	2024-08-12 15:29:05.408	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	46	15	3
250	2024-08-12 15:29:05.511	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	46	15	4
251	2024-08-12 15:29:05.583	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	46	15	5
252	2024-08-12 15:29:05.671	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	46	15	6
253	2024-08-12 15:29:05.75	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	46	15	2
254	2024-08-12 15:29:05.814	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	46	15	1
255	2024-08-12 16:28:03.193	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	47	15	3
256	2024-08-12 16:28:03.276	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	47	15	4
257	2024-08-12 16:28:03.343	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	47	15	5
258	2024-08-12 16:28:03.4	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	47	15	6
259	2024-08-12 16:28:03.454	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	47	15	2
260	2024-08-12 16:28:03.518	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	47	15	1
261	2024-08-12 16:28:06.305	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	48	15	3
262	2024-08-12 16:28:06.379	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	48	15	4
263	2024-08-12 16:28:06.454	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	48	15	5
264	2024-08-12 16:28:06.53	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	48	15	6
265	2024-08-12 16:28:06.635	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	48	15	2
266	2024-08-12 16:28:06.689	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	48	15	1
267	2024-08-12 16:28:13.327	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	49	15	3
268	2024-08-12 16:28:13.406	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	49	15	4
269	2024-08-12 16:28:13.484	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	49	15	5
270	2024-08-12 16:28:13.553	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	49	15	6
271	2024-08-12 16:28:13.637	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	49	15	2
272	2024-08-12 16:28:13.722	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	49	15	1
273	2024-08-12 16:28:46.91	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	50	15	3
274	2024-08-12 16:28:46.973	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	50	15	4
275	2024-08-12 16:28:47.036	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	50	15	5
276	2024-08-12 16:28:47.095	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	50	15	6
277	2024-08-12 16:28:47.159	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	50	15	2
278	2024-08-12 16:28:47.221	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	50	15	1
279	2024-08-12 16:29:05.051	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	51	15	3
280	2024-08-12 16:29:05.112	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	51	15	4
281	2024-08-12 16:29:05.173	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	51	15	5
282	2024-08-12 16:29:05.23	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	51	15	6
283	2024-08-12 16:29:05.291	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	51	15	2
284	2024-08-12 16:29:05.355	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	51	15	1
285	2024-08-12 16:29:30.023	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	52	15	3
286	2024-08-12 16:29:30.114	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	52	15	4
287	2024-08-12 16:29:30.174	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	52	15	5
288	2024-08-12 16:29:30.247	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	52	15	6
289	2024-08-12 16:29:30.31	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	52	15	2
290	2024-08-12 16:29:30.373	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	52	15	1
291	2024-08-12 16:30:08.451	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	53	15	3
292	2024-08-12 16:30:08.539	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	53	15	4
293	2024-08-12 16:30:08.637	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	53	15	5
294	2024-08-12 16:30:08.702	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	53	15	6
295	2024-08-12 16:30:08.789	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	53	15	2
296	2024-08-12 16:30:08.865	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	53	15	1
297	2024-08-12 16:31:36.583	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	54	15	3
298	2024-08-12 16:31:36.641	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	54	15	4
299	2024-08-12 16:31:36.696	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	54	15	5
300	2024-08-12 16:31:36.765	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	54	15	6
301	2024-08-12 16:31:36.84	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	54	15	2
302	2024-08-12 16:31:36.912	f	CN=Desktop-OZGUR,OU=WORKGROUP,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3422	SUCCESS	1	54	15	1
303	2024-11-04 11:46:22.95	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	55	20	3
304	2024-11-04 11:46:23.189	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	55	20	4
305	2024-11-04 11:46:23.387	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	55	20	5
306	2024-11-04 11:46:23.577	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	55	20	6
307	2024-11-04 11:46:23.735	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	55	20	2
308	2024-11-04 11:46:23.895	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3322	SUCCESS	1	55	20	1
309	2024-11-04 11:47:07.968	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	56	20	3
310	2024-11-04 11:47:08.111	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	56	20	4
311	2024-11-04 11:47:08.243	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	56	20	5
312	2024-11-04 11:47:08.369	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	56	20	6
313	2024-11-04 11:47:08.995	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	56	20	2
314	2024-11-04 11:47:09.151	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3322	SUCCESS	1	56	20	1
315	2024-11-04 11:49:17.401	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x2275736273746f723a3322	SUCCESS	1	57	20	3
316	2024-11-04 11:49:17.529	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x22757362617564696f3a3322	SUCCESS	1	57	20	4
317	2024-11-04 11:49:17.657	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x227573627072696e743a3322	SUCCESS	1	57	20	5
318	2024-11-04 11:49:17.777	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x226364726f6d3a3122	SUCCESS	1	57	20	6
319	2024-11-04 11:49:17.9	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x22626c7565746f6f74683a3322	SUCCESS	1	57	20	2
320	2024-11-04 11:49:18.018	f	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	\N	Windows	admin	\\x2277656263616d3a3322	SUCCESS	1	57	20	1
\.


--
-- Data for Name: kr_agent_hardware_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_hardware_history (agent_hardware_history_id, agent_send_date, create_date, old_property_value, agent_hardware_id) FROM stdin;
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
-- Data for Name: kr_agent_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_message (agent_message_id, contents, create_date, is_deleted, key, total_count, type, type_detail, user0, version) FROM stdin;
3	\\x223c703e61646d696e3c2f703e3c703e746573743c2f703e22	2024-03-20 14:58:58.816	f	960E0524	1	client	3	admin	1
4	\\x223c703e61646d696e3c2f703e3c703e746573743c2f703e22	2024-11-04 11:46:51.803	f	F9E7A482	1	client	20	admin	1
\.


--
-- Data for Name: kr_agent_message_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_message_detail (agent_message_detail_id, agent_id, create_date, status, agent_message_id, is_deleted, version) FROM stdin;
3	3	2024-03-20 14:58:58.861	t	3	f	2
4	20	2024-11-04 11:46:51.885	t	4	f	2
\.


--
-- Data for Name: kr_agent_operating_system; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_operating_system (agent_operating_system_id, agent_send_date, console_version, create_date, is_deleted, os_arch, os_build_number, os_installed_date, os_name, os_version, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_operation_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_operation_history (agent_operation_history_id, agent_send_date, create_date, is_deleted, description, status, type, username, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_patch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_patch (agent_patch_id, agent_send_date, create_date, is_deleted, description, hotfix_name, installed_on, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_policy_tracking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_policy_tracking (agent_policy_tracking_id, agent_policy_tracking_type, completed, create_date, is_deleted, status, username, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_policy_tracking_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_policy_tracking_detail (agent_policy_tracking_detail_id, create_date, is_deleted, extension_status, name, policy_status, status, version, agent_policy_tracking_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_port_alarm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_port_alarm (agent_port_alarm_id, agent_send_date, create_date, is_deleted, ip, name, pid, port, status, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_process_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_process_log (agent_process_log_id, agent_id, create_date, is_deleted, file_name, file_path, process_name, process_time, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_install; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_install (agent_program_install_id, create_date, is_deleted, program_name, program_version, total_count, type, type_detail, user0, version) FROM stdin;
1	2022-05-12 09:48:38.164	f	Pot Player x64	7.0	1	client	2	admin	1
2	2022-05-12 09:53:30.002	f	7-Zip	21.07	1	client	2	admin	1
3	2022-05-12 09:59:04.584	f	Pot Player x64	7.0	1	client	2	admin	1
4	2024-03-20 14:59:48.515	f	7-Zip	2301	1	client	3	admin	1
\.


--
-- Data for Name: kr_agent_program_install_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_install_detail (agent_program_install_detail_id, agentid, create_date, is_deleted, version, agent_program_install_id) FROM stdin;
1	2	2022-05-12 09:48:38.195	f	1	1
2	2	2022-05-12 09:53:30.019	f	1	2
3	2	2022-05-12 09:59:04.606	f	1	3
4	3	2024-03-20 14:59:48.566	f	1	4
\.


--
-- Data for Name: kr_agent_program_install_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_install_result (agent_program_install_result_id, create_date, is_deleted, message, state, status, version, agent_program_install_detail_id) FROM stdin;
1	2022-05-12 09:48:38.637	f		1	t	1	1
2	2022-05-12 09:53:30.096	f		1	t	1	2
3	2022-05-12 09:53:31.44	f		2	t	1	2
4	2022-05-12 09:59:04.928	f	[Errno 13] Permission denied: 'C:/ProgramData/Gardiyan_v2/tmp/ad969d6af5ec41589bdef9c7a083354f.exe'	1	f	1	3
5	2024-03-20 14:59:48.695	f		1	t	1	4
6	2024-03-20 14:59:49.322	f		2	t	1	4
\.


--
-- Data for Name: kr_agent_program_restriction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_restriction (id, create_date, is_deleted, name, os, restriction, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_restriction_definitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_restriction_definitions (id, create_date, is_deleted, dn, name, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_restriction_definitions_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_restriction_definitions_detail (id, agent_id, agent_program_restriction_definitions_id, agent_program_restriction_detail_id, create_date, is_deleted, list, operating_system, program_name, program_version, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_restriction_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_restriction_detail (id, createdate, is_deleted, operating_system, program_name, program_version, version, agent_program_restriction_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_uninstall; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_uninstall (id, create_date, is_deleted, program_name, program_version, total_count, type, type_detail, username, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_uninstall_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_uninstall_detail (id, create_date, is_deleted, version, agent_id, agent_program_uninstall_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_uninstall_detail_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_uninstall_detail_results (id, agentid, agent_program_uninstall_detail_ids, create_date, is_deleted, message, state, status, version, agent_program_uninstall_detail_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_program_use_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_program_use_status (id, create_date, is_deleted, dn, programname, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_quarantine_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_quarantine_history (quarantine_history_id, create_date, is_deleted, description, ipaddress, status, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_remote_connection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_remote_connection (agent_remote_connection_id, create_date, is_deleted, end_date, record_name, session_status, status, remote_connection_type, username, version, agent_id, guacamole_id, key, token, ip_address) FROM stdin;
\.


--
-- Data for Name: kr_agent_remote_connection_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_remote_connection_setting (agent_remote_connection_setting_id, create_date, is_deleted, modify_date, remote_connection_type, setting, version) FROM stdin;
2	2024-05-30 13:52:49.876	f	2024-06-04 13:34:01.873	vnc	{"port":"5900"}	4
1	2024-05-30 13:47:06.925	f	2024-06-10 16:16:02.198	ssh	{"port":"22","server-layout":"","timezone":"Europe/Istanbul"}	5
3	2024-05-31 18:49:24.6	f	2024-06-13 11:09:23.933	rdp	{"port":"3389","server-layout":"tr-tr-qwerty","security":"nla","enable-wallpaper":"true","ignore-cert":"true","timezone":"Europe/Istanbul"}	16
\.


--
-- Data for Name: kr_agent_scan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_scan (agent_scan_id, baseip, create_date, is_deleted, name, version) FROM stdin;
\.


--
-- Data for Name: kr_agent_service_alarm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_service_alarm (agent_service_alarm_id, agent_send_date, create_date, is_deleted, name, new_state, old_state, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_session (agent_session_id, login_date, logoff_date, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_software; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_software (agent_software_id, agent_send_date, app_id, block_status, block_user, create_date, is_deleted, install_date, modify_date, name, program_version, publisher, status, uninstall_date, uninstall_string, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_software_metric; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_software_metric (agent_software_metric_id, create_date, date, is_deleted, duration, name, user0, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_usb_block; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_usb_block (agent_usb_block_id, create_date, is_deleted, event, event_date, serial_number, user0, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_usb_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_usb_file (agent_usb_file_id, create_date, is_deleted, dest, directory, letter, modify_date, serial_number, session_id, src, type, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_usb_tracking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_usb_tracking (agent_usb_tracking_id, create_date, is_deleted, name, partion, serial_number, session_id, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_user (agent_software_id, agent_send_date, create_date, is_deleted, display_name, folder, name, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_user_login_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_user_login_log (agent_user_login_log_id, create_date, is_deleted, host, login_date, login_type, session_event, username, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_user_session_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_user_session_history (agent_user_session_id, create_date, is_deleted, session_event, username, version, agent_id) FROM stdin;
1	2024-11-04 10:02:45.372	f	login	t.ozyurek	1	20
\.


--
-- Data for Name: kr_agent_vulnerability; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_vulnerability (agent_vulnerability_id, create_date, is_deleted, end_date, ip_address, scan_id, scan_uuid, start_date, status, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_vulnerability_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_vulnerability_detail (agent_vulnerability_detail_id, count, plugin_family, plugin_id, plugin_name, severity, agent_vulnerability_id, description, tags) FROM stdin;
\.


--
-- Data for Name: kr_agent_vulnerability_host; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_vulnerability_host (agent_vulnerability_host_id, critical, high, info, low, medium, score, agent_vulnerability_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_vulnerability_network_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_vulnerability_network_information (agent_vulnerability_network_information_id, create_date, is_deleted, device, port, status, value, vlan, version, agent_id) FROM stdin;
1	2024-08-06 13:09:42.522	t	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=DESKTOP-1IAJ6L4, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1722938965710}	Intel(R) 82574L Gigabit Network Connection	2	1
2	2024-08-06 13:26:01.504	t	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1722939930840}	Intel(R) 82574L Gigabit Network Connection	2	1
3	2024-08-06 14:26:14.161	t	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1722943569731}	Intel(R) 82574L Gigabit Network Connection	2	1
4	2024-08-06 17:01:28.928	t	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1722947208481}	Intel(R) 82574L Gigabit Network Connection	2	1
5	2024-08-06 17:01:33.761	f	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1722950847403}	Intel(R) 82574L Gigabit Network Connection	1	1
6	2024-08-06 17:23:05.386	f	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1722954182637}	Intel(R) 82574L Gigabit Network Connection	1	10
7	2024-08-07 09:31:43.781	t	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1723012300606}	Intel(R) 82574L Gigabit Network Connection	2	15
8	2024-08-07 10:55:02.481	t	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1723015939351}	Intel(R) 82574L Gigabit Network Connection	2	15
9	2024-08-07 11:33:05.061	t	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1723019578700}	Intel(R) 82574L Gigabit Network Connection	2	15
10	2024-08-12 15:29:31.239	t	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1723465769208}	Intel(R) 82574L Gigabit Network Connection	2	15
11	2024-08-12 16:30:12.386	f	HP_22NoluKabin	4	t	{TimeToLive=120, SystemDescription=ProCurve J9021A Switch 2810-24G, revision N.11.78, ROM N.10.01 (/sw/code/build/bass), IPAddress=[172.16.21.120], Port=4, Device=HP_22NoluKabin, PortDescription=4, ChassisId={}, Computer=Desktop-OZGUR, Connection=Ethernet0, Interface=Intel(R) 82574L Gigabit Network Connection, Type=LLDP, date=1723469407843}	Intel(R) 82574L Gigabit Network Connection	1	15
\.


--
-- Data for Name: kr_auto_agent_delete_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_auto_agent_delete_history (auto_agent_delete_history_id, create_date, is_deleted, description, lastlogoffdate, modify_date, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_auto_provision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_auto_provision (auto_provision_id, args, auto_provision_type, create_date, is_deleted, modify_date, operating_system_type, priority, property_name, property_value, is_status, version, program_file_id, script_file_id, owner) FROM stdin;
\.


--
-- Data for Name: kr_auto_provision_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_auto_provision_detail (auto_provision_detail_id, agentid, create_date, is_deleted, modify_date, status, version, agent_program_install_detail_id, auto_provision_id, command_execution_id) FROM stdin;
\.


--
-- Data for Name: kr_city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_city (city_id, city_koordinat, create_date, is_deleted, name, version, country_id) FROM stdin;
\.


--
-- Data for Name: kr_command; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_command (command_id, activation_date, command_owner_uid, create_date, is_deleted, dn_list, dn_type, dn_type_detail, expiration_date, mail_threading_active, sent_mail, total, uid_list, version, task_id, script_user) FROM stdin;
46	\N	admin	2024-11-04 11:46:34.993	f	["CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup"]	1	20	\N	f	f	1	["20"]	1	46	root
\.


--
-- Data for Name: kr_command_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_command_execution (command_execution_id, create_date, dn, dn_type, online, uid, command_id) FROM stdin;
46	2024-11-04 11:46:35.039	CN=PC-SISTEM-19,OU=cekino.local,DC=workgroup	1	t	20	46
\.


--
-- Data for Name: kr_command_execution_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_command_execution_result (command_execution_result_id, content_type, create_date, is_deleted, mail_content, mail_subject, response_code, response_data, response_message, version, command_execution_id, agent_id) FROM stdin;
1	1	2024-11-04 11:46:48.514	f			6	\\x7b22526573756c74223a2241637469766520636f646520706167653a2036353030315c725c6e457863657074696f6e2063616c6c696e67205c2253686f756c64436f6e74696e75655c222077697468205c22325c2220617267756d656e742873293a205c224e65736e65206261c59f76757275737520626972206e65736e656e696e20c3b6726e65c49f696e6520617961726c616e6d6164c4b12e5c225c725c6e417420433a5c5c50726f6772616d2046696c65735c5c57696e646f7773506f7765725368656c6c5c5c4d6f64756c65735c5c506f7765725368656c6c4765745c5c312e302e302e315c5c50534d6f64756c652e70736d313a3734353520636861723a385c725c6e2b202020202069662824466f726365202d6f7220247073436d646c65742e53686f756c64436f6e74696e7565282473686f756c64436f6e74696e756551756572794d6573736167202e2e2e5c725c6e2b20202020202020207e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e5c725c6e202020202b2043617465676f7279496e666f202020202020202020203a204e6f745370656369666965643a20283a29205b5d2c204d6574686f64496e766f636174696f6e457863657074696f6e5c725c6e202020202b2046756c6c795175616c69666965644572726f724964203a204e756c6c5265666572656e6365457863657074696f6e5c725c6e205c725c6e496e7374616c6c2d4d6f64756c65203a204e754765742070726f766964657220697320726571756972656420746f20696e7465726163742077697468204e754765742d6261736564207265706f7369746f726965732e20506c6561736520656e7375726520746861742027322e382e352e32303127206f5c725c6e72206e657765722076657273696f6e206f66204e754765742070726f766964657220697320696e7374616c6c65642e5c725c6e417420433a5c5c50726f6772616d446174615c5c476172646979616e5f76325c5c746d705c5c32643035633639392d326230632d346438352d623536312d3933353236326239313865392e7073313a3120636861723a315c725c6e2b20496e7374616c6c2d4d6f64756c65202d4e616d65205053446973636f7665727950726f746f636f6c5c725c6e2b207e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e7e5c725c6e202020202b2043617465676f7279496e666f202020202020202020203a20496e76616c69644f7065726174696f6e3a20283a29205b496e7374616c6c2d4d6f64756c655d2c20496e76616c69644f7065726174696f6e457863657074696f6e5c725c6e202020202b2046756c6c795175616c69666965644572726f724964203a20436f756c644e6f74496e7374616c6c4e7547657450726f76696465722c496e7374616c6c2d4d6f64756c655c725c6e205c725c6e227d	Betik basariyla calistirildi.	1	46	20
\.


--
-- Data for Name: kr_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_country (country_id, country_koordinat, create_date, is_deleted, name, version) FROM stdin;
\.


--
-- Data for Name: kr_domain_subnet_match; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_domain_subnet_match (domain_subnet_match_id, create_date, is_deleted, dn, subnet, version) FROM stdin;
\.


--
-- Data for Name: kr_email_job; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_email_job (email_job_id, create_date, is_deleted, email_body, email_type, modify_date, property_name, property_value, send_date, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_file_transfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_file_transfer (file_transfer_id, agent_path, create_date, is_deleted, dn, dn_detail, dn_type, file_path, file_size, file_transfer_type, file_name, modify_date, operator, original_file_name, status, task_name, version, task_id) FROM stdin;
1	C:/Users/cekino/Desktop/	2024-08-12 16:32:37.235	f	\N	15	client	/home/ftp_gardiyan/ftp/receive_file/single/1/9e624b9307224c1ba0ed23510e969903.txt	0	pushing	test.txt	\N	admin	test.txt	transferred	test	3	\N
\.


--
-- Data for Name: kr_file_transfer_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_file_transfer_detail (file_transfer_detail_id, create_date, is_deleted, message, resend_count, resend_date, status, version, file_transfer_id, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_file_transfer_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_file_transfer_schedule (file_transfer_schedule_id, create_date, cron, is_deleted, end_date, period, period_type, file_transfer_schedule_type, start_date, status, version, file_transfer_id) FROM stdin;
\.


--
-- Data for Name: kr_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_inventory (inventory_id, create_date, is_deleted, inventory_status, modify_date, name, serial_no, version, agent_id, last_inventory_activity_id) FROM stdin;
\.


--
-- Data for Name: kr_inventory_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_inventory_activity (inventory_activity_id, activitydate, create_date, is_deleted, description, finishdate, inventory_status, modify_date, version, inventory_id, person_id) FROM stdin;
\.


--
-- Data for Name: kr_ldap_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_ldap_user (ldap_user_id, create_date, is_deleted, dn, domain_name, name, version) FROM stdin;
\.


--
-- Data for Name: kr_ldap_user_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_ldap_user_policy (ldap_user_policy_id, create_date, is_deleted, version, ldapuser, policy_id) FROM stdin;
\.


--
-- Data for Name: kr_ldap_user_property; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_ldap_user_property (ldap_user_property_id, create_date, property_name, property_value, ldap_user_id) FROM stdin;
\.


--
-- Data for Name: kr_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_person (person_id, create_date, is_deleted, email, full_name, identification_number, modify_date, phone, version, ldap_user_id) FROM stdin;
\.


--
-- Data for Name: kr_process_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_process_history (process_history, agent_id, create_date, is_deleted, dn, process_type, version) FROM stdin;
1	1	2024-08-06 13:25:20.155	f	\N	repairAgentPrograms	1
2	1	2024-08-06 13:25:26.666	f	\N	repairAgentPrograms	1
3	1	2024-08-06 13:26:40.238	f	\N	repairHardware	1
4	1	2024-08-06 13:30:24.253	f	\N	repairAgentPrograms	1
5	1	2024-08-06 13:39:46.699	f	\N	repairHardware	1
6	10	2024-08-06 17:24:53.684	f	\N	repairHardware	1
7	15	2024-08-07 09:37:31.651	f	\N	repairHardware	1
8	15	2024-08-07 11:18:57.367	f	\N	repairAgentPrograms	1
\.


--
-- Data for Name: kr_program_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_program_file (program_file_id, create_date, is_deleted, linux_parameter, linux_path, linux_version, mac_parameter, mac_path, mac_version, modify_date, name, windows_parameter, windows_path, windows_version, version) FROM stdin;
1	2022-05-12 09:48:15.653	t	\N	\N	\N	\N	\N	\N	\N	Pot Player x64	Start-Process ./[FILENAME] -Wait -ArgumentList /S\n	apps/programFiles/ad969d6af5ec41589bdef9c7a083354f.exe	7.0	2
2	2022-05-12 09:52:51.152	t	\N	\N	\N	\N	\N	\N	\N	7-Zip	Start-Process ./[FILENAME] -Wait -ArgumentList /S	apps/programFiles/7215f46c5d514b30a5647c2deb7c77f3.exe	21.07	2
3	2023-12-18 16:59:09.872	t	\N	\N	\N	\N	\N	\N	\N	 7-Zip	./[FILENAME] /S	apps/programFiles/e363f92306984746aac530b039309762.exe	23.1.0	2
4	2024-03-20 14:08:38.383	f	\N	\N	\N	\N	\N	\N	\N	7-Zip	./[FILENAME] /S	apps/programFiles/36f705185f904bc99b06d48b99a89c09.exe	2301	1
\.


--
-- Data for Name: kr_program_license; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_program_license (agent_id, create_date, is_deleted, expiration_date, modify_date, program_name, program_version, version) FROM stdin;
\.


--
-- Data for Name: kr_queue_class_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_queue_class_configuration (id, class_path, create_date, is_deleted, queue_name, version, prefetch_count) FROM stdin;
1	com.karcin.client.queue.subscribers.interfaces.subscribers.IAgentHardwareConstraintsSubscriber	2024-09-01 00:00:00	f	hardware_constraints	1	50
9	com.karcin.client.queue.subscribers.interfaces.subscribers.IEventLogSubscriber	2024-09-01 00:00:00	f	eventlog	1	50
10	com.karcin.client.queue.subscribers.interfaces.subscribers.IGpoSubscriber	2024-09-01 00:00:00	f	wingpo	1	50
11	com.karcin.client.queue.subscribers.interfaces.subscribers.IMessageSubscriber	2024-09-01 00:00:00	f	message	1	50
14	com.karcin.client.queue.subscribers.interfaces.subscribers.IProgramInstallSubscriber	2024-09-01 00:00:00	f	softwareinstall	1	50
16	com.karcin.client.queue.subscribers.interfaces.subscribers.IFileTransferSubscriber	2024-09-01 00:00:00	f	filetransfer	1	50
18	com.karcin.client.queue.subscribers.interfaces.subscribers.ITaskSequenceSubscriber	2024-09-01 00:00:00	f	task-sequence	1	50
21	com.karcin.client.queue.subscribers.interfaces.subscribers.IUninstallSubscriber	2024-09-01 00:00:00	f	uninstall	1	50
122	com.karcin.client.queue.subscribers.interfaces.subscribers.IAgentConfigurationSubscriber	2024-09-01 00:00:00	f	agentConfiguration	1	50
\.


--
-- Data for Name: kr_queue_error_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_queue_error_log (id, create_date, is_deleted, error, message, queue_name, version) FROM stdin;
\.


--
-- Data for Name: kr_rdp_recorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_rdp_recorder (id, create_date, is_deleted, expiration_date, expiration_date_type, operator, path, recycle_period, recycle_period_type, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_rdp_recorder_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_rdp_recorder_history (id, create_date, is_deleted, expiration_date, expiration_date_type, operator, path, recycle_period, recycle_period_type, status, version, agent_id, rdp_recorder_id) FROM stdin;
\.


--
-- Data for Name: kr_rdp_recorder_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_rdp_recorder_list (id, create_date, is_deleted, duration, file_create_date, file_size, name, path, recycle_period, recycle_period_type, status, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_recording_timer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_recording_timer (recording_timer_id, create_date, is_deleted, description, end_date, modify_date, operator, start_date, status, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_script_button_definition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_script_button_definition (script_button_definition_id, is_active, create_date, is_deleted, description, name, platform, version, script_id) FROM stdin;
\.


--
-- Data for Name: kr_script_file; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_script_file (script_file_id, contents, create_date, is_deleted, description, general_type, label, normal_script_parameters, script_type, version) FROM stdin;
615	$current_date = Get-Date\r\n$expire_date  = Get-date "$[EXDATE]"\r\n$wait_time    = 30\r\n\r\nfunction time_check {\r\nclear\r\nWrite-Host "Betik gecerlilik saati kontrol ediliyor!"\r\nsleep 1\r\n\r\n    if ($expire_date -lt $current_date) \r\n        {\r\n          Write-Host "Betik gecerlilik suresi doldu, bypass ediliyor!!!"\r\n        }\r\n        \r\n        else\r\n        {\r\n          Write-Host "Betik gecerli, uygulaniyor..."\r\n          sleep 1\r\n          exec_script\r\n        }\r\n}\r\n\r\nfunction exec_script {\r\nshutdown /s /t $wait_time\r\n}\r\ntime_check	2023-05-12 09:29:32.517	f		normal	win_powerSave	\N	powerShell	1
18	ipconfig	2021-07-12 10:11:54.455	f	Politika 1	policy	Politika 1 - Win	\N	powerShell	3
27	Get-LocalUser | Select-Object Name, Enabled | ConvertTo-Json	2021-07-12 22:41:55.714	f	Tüm yerel kullanıcıları getirir.	normal	CEKINO-YerelKullanıcılar-B-18	\N	powerShell	3
3	ipconfig /all	2021-07-12 09:06:59.071	f	Cihazdaki ip bilgisini getirir.	normal	CEKINO-IPBilgisiniGetir-B-11	\N	powerShell	5
4	ip a	2021-07-12 09:06:59.071	f	Cihazdaki ip bilgisini getirir.	normal	CEKINO-IPBilgisiniGetir-B-12	\N	bash	3
22	(Get-CimInstance -ClassName win32_computersystem).model	2021-07-12 22:09:12.079	f	Bilgisayar modelini döndürür.	normal	CEKINO-BilgisayarModeli-B-05	\N	powerShell	2
21	print("Örnek betiktir.")	2021-07-12 22:02:56.578	f	Örnek Python betiğidir.	normal	CEKINO-ÖrnekPythonBetiği-B-19	\N	python	3
26	(Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Select DisplayName).DisplayName	2021-07-12 22:17:14.626	f	Antivirus uygulamasını kontrol eder.	normal	CEKINO-AntivirusKontrol-B-03	\N	powerShell	3
24	dir c:\\ProgramData\\Gardiyan	2021-07-12 22:13:19.205	f	Gardiyan klasörünün içeriğini gösterir.	normal	CEKINO-GardiyanDiziniGöster-B-09	\N	powerShell	3
616	# Date 1\r\nalert_sec=30\r\nexp_date='$[EXDATE]'\r\nmsg="!!! UYARI !!!" "Bilgisariniz Gardiyan tarafindan $alert_sec Saniye sonra kapatilacak!"\r\n# Compute the seconds since epoch for date 1\r\nt1=$(date --date="$exp_date" +%s)\r\n\r\n# Date 2 : Current date\r\ncurr_date=$(date +%Y-%m-%d\\ %H:%M:%S)\r\n# Compute the seconds since epoch for date 2\r\nt2=$(date --date="$curr_date" +%s)\r\n\r\n# Compute the difference in dates in seconds\r\nlet "tDiff=$t2-$t1"\r\n# Compute the approximate hour difference\r\nlet "hDiff=$tDiff/3600"\r\n\r\necho "Yaklasik saat farki b/w $exp_date & $curr_date = $hDiff"\r\n\r\nif [[ "$exp_date" > "$curr_date" ]] ;\r\nthen\r\n    echo "Expire date gecerli degil, script uygulaniyor..."\r\n    user_list=($(who | grep -E "\\(:[0-9](\\.[0-9])*\\)" | awk '{print $msg "@" $NF}' | sort -u))\r\n    for user in $user_list; do\r\n    username=${user%@*}\r\n    display=${user#*@}\r\n    dbus=unix:path=/run/user/$(id -u $username)/bus\r\n    sudo -u $username DISPLAY=${display:1:-1} \\\r\n                      DBUS_SESSION_BUS_ADDRESS=$dbus \\\r\n                      notify-send "$@"\r\n    done\r\n    sleep $alert_sec;\r\n    shutdown -h now\r\nelse echo "Sure doldu, komut ByPass ediliyor..."\r\nfi	2023-05-12 09:30:07.482	f		normal	lin_powerSave	\N	python	2
72	hostname	2021-07-16 21:24:40.203	f	Bilgisayarın İsmini Getirir	normal	CEKINO-BilgisayarınİsminiGetirir-B-07	\N	bash	4
617	cd C:\\ProgramData\\Gardiyan_v2\\apps\\iperf\\\r\nCMD /C iperf3.exe iperf3 -c $[IP] -p 333 -J	2023-05-12 09:30:25.681	f		normal	win_staticSpeedTest	\N	powerShell	1
631	Install-Module -Name PSDiscoveryProtocol 	2024-03-20 14:57:09.732	f	Ethernet kablosu takılısı ise çalıştırılmalıdır.	normal	Ağ Bağlantı Bilgisi	\N	powerShell	1
128	echo "a"	2021-08-28 13:36:58.296	f	Hızlı Betik !	normal	CEKINO-HızlıTestBetiği-B-10	\N	powerShell	4
618	apt-get install iperf3 -y >> /tmp/test.log\r\niperf3 -c $[IP] -p 333 -J	2023-05-12 09:30:46.267	f		normal	lin_staticSpeedTest	\N	python	1
71	hostname	2021-07-16 21:03:59.079	f	Bilgisayarın İsmini Getirir	normal	CEKINO-Bilgisayarın İsmini Getirir-B-06	\N	macosBash	3
547	(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\\cimv2\\TerminalServices).SetAllowTsConnections(0,0) | Out-Null\r\n	2022-02-16 15:16:46.827	f		normal	CEKINO - Disable RDP	\N	powerShell	2
549	netsh advfirewall set currentprofile state on\r\nnetsh advfirewall set privateprofile state on\r\nnetsh advfirewall set publicprofile state on\r\n	2022-02-16 15:17:30.917	f		normal	CEKINO - Enable Firewall	\N	powerShell	2
619	Start-BitsTransfer -Source $[mainDomain] -Destination "$[path]/$[orjFileName]"	2023-05-12 09:31:22.64	f		normal	win_fileDownload	\N	powerShell	1
108	hostname	2021-08-09 16:38:45.745	f	Bilgisayarın İsmini Getirir	normal	CEKINO-BilgisayarınİsminiGetirir-B-08	\N	powerShell	3
109	$env:UserName	2021-08-09 16:45:10.552	f	Betiği çalıştıran kullanıcı bilgisini çeker	normal	CEKINO-BenKimim-B-04	\N	powerShell	3
103	echo "türkçe karakter test ğüşıöç ĞÜŞİÇÖ şölııüi"	2021-08-01 17:16:04.667	f	Türkçe karakterleri test eder.	normal	CEKINO-TürkçeKarakterTest-B-16	\N	bash	3
111	ifconfig	2021-08-09 18:33:35.206	f	Politika 2	policy	Politika 2 - Lin	\N	bash	2
121	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbvideo\\\\" -Name "start" -Value 3\r\n\r\nEnable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *cam* -Status Error).InstanceId -confirm:$false	2021-08-16 15:09:06.816	f	Webcam aktif eder.	policy	webcam_enable_policy	\N	powerShell	4
122	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbvideo\\\\" -Name "start" -Value 4\r\n\r\nDisable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *cam*  -Status OK).InstanceId -Confirm:$false	2021-08-16 15:10:51.091	f	Webcam kullanılamaz hale getirir.	policy	webcam_disable_policy	\N	powerShell	3
123	try{\r\n    $webcam=$(Get-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\usbvideo\\" -Name "start" -ErrorAction Stop).Start\r\n}\r\ncatch{\r\n    $webcam=4\r\n}	2021-08-16 15:12:18.984	f	Webcam durumunu kontrol eder.	policy	webcam_status_policy	\N	powerShell	3
115	Set-ItemProperty 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\\' -Name "fDenyTSConnections" -Value 0\r\nSet-ItemProperty 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Terminal Server\\WinStations\\RDP-Tcp\\' -Name "UserAuthentication" -Value 0\r\nnetsh advfirewall firewall add rule name="Windows RDP Pass" dir=in action=allow protocol=TCP localport=3389	2021-08-10 13:37:25.689	f	Rdp ile bağlanmak için gerekli ayarları yapar.	normal	CEKINO-RDPİzin-B-15	\N	powerShell	3
116	echo "türkçe karakter test ğüşıöç ĞÜŞİÇÖ"	2021-08-10 13:39:03.36	f	Türkçe karakterleri test eder.	normal	CEKINO-TürkçeKarakterTest-B-17	\N	powerShell	5
112	cmd /c "dir/w C:\\ProgramData\\Gardiyan_v2\\log"\r\n	2021-08-09 18:34:06.725	f	Listeler.	policy	List Gar	\N	powerShell	3
503	users	2021-11-05 16:29:26.953	f	Aktif kullanıcı bilgisini getirir.	normal	CEKINO-AktifKullanıcı-B-02	\N	bash	4
150	import socket\r\nprint(socket.gethostbyname(socket.gethostname()))	2021-10-02 15:32:36.048	f	Cihazdaki ip bilgisini getirir.	normal	CEKINO-IPAdresiniGetir-B-13	\N	python	4
555	netsh advfirewall set currentprofile state off\r\nnetsh advfirewall set privateprofile state off\r\nnetsh advfirewall set publicprofile state off\r\n	2022-02-18 16:01:13.682	f		policy	SB Test - Firewall Disable	\N	powerShell	1
1	$($($(if(query session | Select-String -Pattern 'Active'){query session | Select-String -Pattern 'Active'}else{"  "}) | ForEach-Object {$_}) -replace '\\s\\s+', ',').split(",")[1]	2021-07-12 09:06:59.071	f	Aktif kullanıcı bilgisini getirir.	normal	CEKINO-ActiveUser-B-01	\N	powerShell	2
57	(netsh wlan show interfaces) -Match '^\\s+Signal' -Replace '^\\s+Signal\\s+:\\s','' -Replace '%',''	2021-07-15 14:52:04.13	f	Wi-Fi kalitesinin getirir.	normal	CEKINO-KablosuzİnternetKalitesi-B-14	\N	powerShell	3
548	netsh advfirewall set currentprofile state off\r\nnetsh advfirewall set privateprofile state off\r\nnetsh advfirewall set publicprofile state off\r\n	2022-02-16 15:17:14.916	f		normal	CEKINO - Disable Firewall	\N	powerShell	2
552	(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\\cimv2\\TerminalServices).SetAllowTsConnections(1,1) | Out-Null\r\n(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\\cimv2\\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null\r\n	2022-02-18 15:59:39.359	f		policy	SB Test - RDP Enable	\N	powerShell	3
538	(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\\cimv2\\TerminalServices).SetAllowTsConnections(0,0) | Out-Null	2022-02-08 15:39:56.438	f	RDP Disable 32 bit powershell 2.0 da kullanılacak	normal	RDP Disable	\N	powerShell	1
539	(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\\cimv2\\TerminalServices).SetAllowTsConnections(1,1) | Out-Null\r\n(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\\cimv2\\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null\r\nGet-NetFirewallRule -DisplayName "Remote Desktop*" | Set-NetFirewallRule -enabled true	2022-02-08 15:42:53.803	f	RDP Enable 32 bit powershell 2.0 da kullanılacak	normal	RDP Enable	\N	powerShell	1
540	Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True	2022-02-08 15:49:45.195	f	Firewall Enable 32 bit powershell 2.0 da kullanılacak	normal	Firewall Enable	\N	powerShell	1
541	Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False	2022-02-08 15:52:34.773	f	Firewall Disable 32 bit powershell 2.0 da kullanılacak	normal	Firewall Disable	\N	powerShell	1
542	Get-WmiObject win32_networkadapterconfiguration | \r\nSelect-Object -Property @{\r\n    Name = 'IPAddress'\r\n    Expression = {($PSItem.IPAddress[0])}\r\n},MacAddress | \r\nWhere IPAddress -NE $null	2022-02-08 16:01:44.568	f	Aktif IP Adresini ve MAC Adresini Öğrenme Komutu 32 bit powershell 2.0 da kullanılacak	normal	Aktif IP Adresini ve MAC Adresini Öğrenme Komutu 	\N	powerShell	1
554	netsh advfirewall set currentprofile state on\r\nnetsh advfirewall set privateprofile state on\r\nnetsh advfirewall set publicprofile state on\r\n	2022-02-18 16:00:49.783	f		policy	SB Test - Firewall Enable	\N	powerShell	1
553	(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\\cimv2\\TerminalServices).SetAllowTsConnections(0,0) | Out-Null	2022-02-18 16:00:16.729	f		policy	SB Test - RDP Disable	\N	powerShell	2
550	reg add "HKCU\\Control Panel\\Desktop" /v ScreenSaveTimeOut /t REG_SZ /d 60 /f\r\nreg add "HKCU\\Control Panel\\Desktop" /v ScreenSaverIsSecure /t REG_SZ /d 1 /f\r\nreg add "HKCU\\Control Panel\\Desktop" /v ScreenSaveActive /t REG_SZ /d 1 /f\r\n	2022-02-16 15:21:50.891	f		normal	CEKINO-1 Dk İşlem Yapılmadığında Ekranı Kapat ve Kilitle	\N	powerShell	3
546	(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\\cimv2\\TerminalServices).SetAllowTsConnections(1,1) | Out-Null\r\n(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\\cimv2\\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null\r\n	2022-02-16 15:16:28.53	f		normal	CEKINO - Enable RDP	\N	powerShell	2
544	(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\\cimv2\\TerminalServices).SetAllowTsConnections(1,1) | Out-Null\r\n(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\\cimv2\\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null\r\nGet-NetFirewallRule -DisplayName "Remote Desktop*" | Set-NetFirewallRule -enabled true\r\n	2022-02-08 17:45:22.8	f		normal	CEKINO - RDP-OPEN	\N	powerShell	2
646	if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }	2021-07-13 21:30:34.174	f	Yetkili modu aktif eder.	system	win_administratorMode	\N	powerShell	1
647	iptables -D INPUT $[num] & netfilter-persistent save	2021-07-13 21:47:24.813	f	Güvenlik duvarı kuralını siler.	system	lin_firewallRemove	\N	bash	2
648	Remove-NetFirewallRule -Name "$[name]"	2021-07-13 21:43:31.397	f	Güvenlik duvarı kuralını siler.	system	win_firewallRemove	\N	powerShell	2
594	#script start\r\nSet-ExecutionPolicy Unrestricted -Force\r\n\r\n#guncel reader dosya indirilmesi\r\nInvoke-WebRequest http://[IP BILGISI]/repo/agent/AcroRdrDC1900820071_tr_TR.exe -OutFile C:\\ProgramData\\Gardiyan_v2\\apps\\AcroRdrDC1900820071_tr_TR.exe\r\n\r\n\r\n# indirilen adobe dosyasının verilen yada istenen path de olması gerekir.\t\r\n$isExeFileExist =  Test-Path "C:\\ProgramData\\Gardiyan_v2\\apps\\AcroRdrDC1900820071_tr_TR.exe"\r\n\r\nIf($isExeFileExist) {\r\n\r\nStart-Process "C:\\ProgramData\\Gardiyan_v2\\apps\\AcroRdrDC1900820071_tr_TR.exe"  -ArgumentList "/sAll /rs /rps /msi /norestart /quiet EULA_ACCEPT=YES"\r\n\r\n} Else {\r\n\techo "indirdiginiz dosyayi gerekli alana tasiyin"\r\n}\r\n\r\n\r\n#script end	2022-04-14 13:31:11.209	f		normal	Adobe Acrobat Reader DC Update	\N	powerShell	2
595	shutdown now\r\n	2022-04-14 15:29:23.81	f		normal	Bilgisayarı Kapat	\N	bash	2
586	mkdir -p C:\\ProgramData\\GardiyanUpdate\r\nInvoke-WebRequest http://172.16.23.105/repo/agent/self_update/gar_update.ps1 -OutFile C:\\ProgramData\\GardiyanUpdate\\gar_update.ps1 -UseBasicParsing	2022-04-08 17:16:48.056	f		normal	Self Update | 2-Send Script	\N	powerShell	4
587	Start-ScheduledTask -TaskName "GardiyanUpdate"	2022-04-08 17:28:48.096	f		normal	Self Update | 3-Trigger	\N	powerShell	3
551	$url = "http://172.16.21.233/repo/apps/niyazi/test.lnk" \r\n$path = "C:\\Users\\Public\\Desktop\\test.lnk" \r\n# param([string]$url, [string]$path) \r\n\r\nif(!(Split-Path -parent $path) -or !(Test-Path -pathType Container (Split-Path -parent $path))) { \r\n$targetFile = Join-Path $pwd (Split-Path -leaf $path) \r\n} \r\n\r\n(New-Object Net.WebClient).DownloadFile($url, $path) \r\n$path\r\n	2022-02-17 13:08:18.476	f		normal	CEKINO - Public Altına Link Kopyalama	\N	powerShell	3
585	mkdir -p C:\\ProgramData\\GardiyanUpdate\r\nInvoke-WebRequest http://172.16.23.105/repo/agent/self_update/GardiyanUpdate.xml -OutFile C:\\ProgramData\\GardiyanUpdate\\GardiyanUpdate.xml -UseBasicParsing\r\nschtasks.exe /create /xml "C:\\ProgramData\\GardiyanUpdate\\GardiyanUpdate.xml" /tn "GardiyanUpdate"	2022-04-08 17:14:23.536	f		normal	Self Update | 1-Task	\N	powerShell	6
649	New-NetFirewallRule -DisplayName "$[name]" -Direction Inbound -RemoteAddress $[ip] -Action $[type] -Protocol $[protocol]\n\n/*\n    type = Allow / Block\n*/	2021-07-14 08:56:28.529	f	Güvenlik duvarı kuralı ekler.	system	win_firewallAdd_ICMPv4	\N	powerShell	4
650	iptables -A INPUT -p $[protocol] -s $[ip] --dport $[port] -j $[type]	2021-07-14 09:28:08.912	f	Güvenlik duvarı kuralı ekler.	system	lin_firewallAdd	\N	bash	1
651	Set-NetFirewallRule -Name "$[name]" -Action $[type]\n\n/*\n    type = Allow / Block\n*/	2021-07-13 21:46:01.73	f	Güvenlik duvarı kuralını değiştirir.	system	win_firewallChangeType	\N	powerShell	3
652	$[type]-NetFirewallRule -Name "$[name]"\n\n/*\n    type = Enable / Disable\n*/	2021-07-13 21:42:41.621	f	Güvenlik duvarının durumunu değiştirir.	system	win_firewallChangeStatus	\N	powerShell	3
626	Install-Module -Name PSDiscoveryProtocol	2024-01-16 11:31:12.403	f		normal	win_PSDiscoveryProtocol	\N	powerShell	1
653	New-NetFirewallRule -DisplayName "$[name]" -Direction Inbound -RemoteAddress $[ip] -Action $[type] -Protocol $[protocol] -LocalPort $[port]\n\n/*\n    type = Allow / Block\n*/	2021-07-14 09:01:00.287	f	Güvenlik duvarı kuralı ekler.	system	win_firewallAdd	\N	powerShell	3
654	iptables -A INPUT -p $[protocol] -s $[ip] -j $[type]	2021-07-14 09:27:26.22	f	Güvenlik duvarı kuralı ekler.	system	lin_firewallAdd_ICMPv4	\N	bash	2
655	$[type]-PnpDevice -InstanceId '$[id]' -confirm:$false\n\n/*\n    type = Enable / Disable\n*/	2021-07-13 21:33:46.906	f	Aygıt yöneticisindeki aygıtların durumlarını değiştirir.	system	win_deviceStatusChange	\N	powerShell	5
633	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12,[Net.SecurityProtocolType]::Ssl3\r\n[Net.ServicePointManager]::SecurityProtocol = "Tls, Tls11, Tls12, Ssl3"\r\n[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}\r\nfunction func_downfile {\r\n    # GardiyanUpdate klasörünü oluştur (eğer yoksa)\r\n    $gardiyanUpdateFolder = "C:\\ProgramData\\GardiyanUpdate"\r\n    if (-not (Test-Path $gardiyanUpdateFolder -PathType Container)) {\r\n        New-Item -Path $gardiyanUpdateFolder -ItemType Directory | Out-Null\r\n        Write-Host "GardiyanUpdate klasörü oluşturuldu."\r\n    }\r\n\r\n    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12\r\n    $url = "http://172.16.23.105/repo/agent/PSDiscoveryProtocol.zip"\r\n    $path = Join-Path $gardiyanUpdateFolder "PSDiscoveryProtocol.zip"\r\n    $downloadedFilePath = (New-Object Net.WebClient).DownloadFile($url, $path)\r\n\r\n    if (Test-Path $path) {\r\n        Write-Host "Dosyalar indirildi."\r\n        \r\n        # ZIP dosyasını aç\r\n        $destinationPath = Join-Path $gardiyanUpdateFolder "PSDiscoveryProtocol"\r\n        Expand-Archive -Path $path -DestinationPath $destinationPath\r\n        \r\n        # Klasörü taşı\r\n        $destinationDirectory = "C:\\Program Files\\WindowsPowerShell\\Modules"\r\n        if (Test-Path $destinationPath) {\r\n            Move-Item -Path $destinationPath -Destination $destinationDirectory -Force\r\n            Write-Host "Klasör taşındı."\r\n        } else {\r\n            Write-Host "Klasör bulunamadı: $destinationPath"\r\n        }\r\n    } else {\r\n        Write-Host "Dosya indirilemedi: $url"\r\n    }\r\n}\r\n\r\nfunc_downfile\r\n	2024-05-08 14:50:32.601	f	PS LLDP Modülü indirir.	normal	Windows LLDP Download	\N	powerShell	1
634	Stop-Process -Id $[pid] -F	2021-07-13 16:20:41.274	f	İşlemi durdurur.	system	win_killProcess	\N	powerShell	5
635	ip addr flush dev $[name]\nsleep 2\nip addr flush dev $[name]\nnmcli con mod "$[name]" ipv4.method auto\nnmcli con mod "$[name]" connection.autoconnect yes\nnmcli networking off\nnmcli networking on\nsystemctl restart network-manager	2021-07-16 14:50:46.264	f	Ağ yapılandırması için DHCP aktif eder.	system	lin_networkDHCP	\N	bash	2
636	nmcli con mod "$[name]" ipv4.addresses $[ip]/$[prefix]\nnmcli con mod "$[name]" ipv4.gateway $[gate]\nnmcli con mod "$[name]" ipv4.dns $[dns]\nnmcli con mod "$[name]" ipv4.method manual\nnmcli con mod "$[name]" connection.autoconnect yes\nnmcli networking off\nnmcli networking on\nsystemctl restart network-manager	2021-07-16 14:54:39.206	f	Ağ yapılandırması için IP ekler.	system	lin_networkManual	\N	bash	2
637	Stop-Process -Id $[pid] -F	2021-07-13 21:14:58.481	f	Servisi durdurur.	system	win_serviceStop	\N	powerShell	6
638	systemctl start $[name]	2021-07-13 16:25:29.412	f	Servisi başlatır.	system	lin_serviceStart	\N	bash	3
639	kill -9 $[pid]	2021-07-13 16:21:02.133	f	İşlemi durdurur.	system	lin_killProcess	\N	bash	4
640	Set-Service -Name "$[name]" -Status "running"	2021-07-13 16:28:23.427	f	Servisi başlatır.	system	win_serviceStart	\N	powerShell	5
641	systemctl stop $[name]	2021-07-13 16:24:46.695	f	Servisi durdurur.	system	lin_serviceStop	\N	bash	4
642	systemctl $[type] $[name]\n\n/*\n    type = enable / disable\n*/	2021-07-13 16:36:23.803	f	Servisin başlangıç durumunu değiştirir.	system	lin_serviceStartType	\N	bash	4
643	Set-Service -Name "$[name]" -StartupType "$[type]"\n\n/*\n    type = manual / automatic / disabled\n*/	2021-07-13 16:34:32.519	f	Servisin başlangıç durumunu değiştirir.	system	win_serviceStartType	\N	powerShell	5
644	rm -rf /usr/local/share/client-gardiyan && rm -rf /Library/LaunchDaemons/gardiyanworkerservice.plist &	2024-01-17 17:52:22.03	f	ajan kaldırma	system	dar_uninstallAgent	\N	macosBash	6
645	cd C:\\ProgramData\\Gardiyan_v2\\apps\\iperf\\\nCMD /C iperf3.exe iperf3 -c $[IP] -p 333 -J	2024-07-15 23:07:07.894	f		system	win_staticSpeedTest	\N	powerShell	1
656	shutdown -r 1\n\nKULLANICI=$(users)\nif [[ -z "$KULLANICI" ]]\nthen\n    echo "Oturum kapali."\nelse\n\n    ADET=$(who | wc -l)\n\n    if [ "$ADET" -gt 1 ]\n    then\n        echo 'Aktif olarak birden fazla kullanici istemci uzerinde mevcut.';\n        \n    else\n\n        sudo -H -u $KULLANICI bash -c 'export DISPLAY=:0 && nohup xdg-open http://192.168.233.1389/staticPages/reboot.html'\n        echo "Oturum acik."\n\n    fi\n\nfi	2021-07-16 15:49:25.176	f	Bilgisayarı yeniden başlatır.	system	lin_rebootComputer	\N	bash	5
657	Set-NetIPInterface -InterfaceIndex $[interfaceIndex] -Dhcp Enable | ipconfig /renew	2021-07-15 19:49:04.058	f	Ağ yapılandırması için DHCP aktif eder.	system	win_networkDHCP	\N	powerShell	4
658	echo "" > /etc/modprobe.d/uvcvideo.conf\n\nwhr=`whereis modprobe | wc -w`\n\nif (( whr > 1 ));\nthen\n\tmodprobe -r uvcvideo\n\tmodprobe uvcvideo\nelse\n\t/usr/sbin/modprobe -r uvcvideo\n\t/usr/sbin/modprobe uvcvideo\nfi	2021-07-24 19:24:46.571	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_webcam_enable	\N	bash	1
659	New-NetIPAddress -InterfaceIndex $[interfaceIndex] -AddressFamily IPv4 -IpAddress $[IpAddress] -PrefixLength $[prefix] -DefaultGateway $[DefaultGateway]	2021-07-15 19:52:51.876	f	Ağ yapılandırması için IP ekler.	system	win_networkManual	\N	powerShell	4
660	try{\n$data=(Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | Select DisplayName) | Convertto-Json\nif (!$data) { \n   cho '[{"DisplayName":"empty"}]'\n}else{\n    if($data[0] -eq '['){\n        echo $data\n    }else{\n        echo '['$data']'\n    }\n}\n}\ncatch{\n    echo '[{"DisplayName":"empty"}]'\n}	2021-07-15 18:07:56.875	f	Cihazda bulunan antivirüs uygulamalarını tespit eder.	system	win_antivirusControl	\N	powerShell	6
661	$Source = @"\nusing System;  \nusing System.Runtime.InteropServices;\n\nnamespace cekino.ProcessExtensions  \n{\n    public static class ProcessExtensions\n    {\n        #region Win32 Constants\n\n        private const int CREATE_UNICODE_ENVIRONMENT = 0x00000400;\n        private const int CREATE_NO_WINDOW = 0x08000000;\n\n        private const int CREATE_NEW_CONSOLE = 0x00000010;\n\n        private const uint INVALID_SESSION_ID = 0xFFFFFFFF;\n        private static readonly IntPtr WTS_CURRENT_SERVER_HANDLE = IntPtr.Zero;\n\n        #endregion\n\n        #region DllImports\n\n        [DllImport("advapi32.dll", EntryPoint = "CreateProcessAsUser", SetLastError = true, CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]\n        private static extern bool CreateProcessAsUser(\n            IntPtr hToken,\n            String lpApplicationName,\n            String lpCommandLine,\n            IntPtr lpProcessAttributes,\n            IntPtr lpThreadAttributes,\n            bool bInheritHandle,\n            uint dwCreationFlags,\n            IntPtr lpEnvironment,\n            String lpCurrentDirectory,\n            ref STARTUPINFO lpStartupInfo,\n            out PROCESS_INFORMATION lpProcessInformation);\n\n        [DllImport("advapi32.dll", EntryPoint = "DuplicateTokenEx")]\n        private static extern bool DuplicateTokenEx(\n            IntPtr ExistingTokenHandle,\n            uint dwDesiredAccess,\n            IntPtr lpThreadAttributes,\n            int TokenType,\n            int ImpersonationLevel,\n            ref IntPtr DuplicateTokenHandle);\n\n        [DllImport("userenv.dll", SetLastError = true)]\n        private static extern bool CreateEnvironmentBlock(ref IntPtr lpEnvironment, IntPtr hToken, bool bInherit);\n\n        [DllImport("userenv.dll", SetLastError = true)]\n        [return: MarshalAs(UnmanagedType.Bool)]\n        private static extern bool DestroyEnvironmentBlock(IntPtr lpEnvironment);\n\n        [DllImport("kernel32.dll", SetLastError = true)]\n        private static extern bool CloseHandle(IntPtr hSnapshot);\n\n        [DllImport("kernel32.dll")]\n        private static extern uint WTSGetActiveConsoleSessionId();\n\n        [DllImport("Wtsapi32.dll")]\n        private static extern uint WTSQueryUserToken(uint SessionId, ref IntPtr phToken);\n\n        [DllImport("wtsapi32.dll", SetLastError = true)]\n        private static extern int WTSEnumerateSessions(\n            IntPtr hServer,\n            int Reserved,\n            int Version,\n            ref IntPtr ppSessionInfo,\n            ref int pCount);\n\n        #endregion\n\n        #region Win32 Structs\n\n        private enum SW\n        {\n            SW_HIDE = 0,\n            SW_SHOWNORMAL = 1,\n            SW_NORMAL = 1,\n            SW_SHOWMINIMIZED = 2,\n            SW_SHOWMAXIMIZED = 3,\n            SW_MAXIMIZE = 3,\n            SW_SHOWNOACTIVATE = 4,\n            SW_SHOW = 5,\n            SW_MINIMIZE = 6,\n            SW_SHOWMINNOACTIVE = 7,\n            SW_SHOWNA = 8,\n            SW_RESTORE = 9,\n            SW_SHOWDEFAULT = 10,\n            SW_MAX = 10\n        }\n\n        private enum WTS_CONNECTSTATE_CLASS\n        {\n            WTSActive,\n            WTSConnected,\n            WTSConnectQuery,\n            WTSShadow,\n            WTSDisconnected,\n            WTSIdle,\n            WTSListen,\n            WTSReset,\n            WTSDown,\n            WTSInit\n        }\n\n        [StructLayout(LayoutKind.Sequential)]\n        private struct PROCESS_INFORMATION\n        {\n            public IntPtr hProcess;\n            public IntPtr hThread;\n            public uint dwProcessId;\n            public uint dwThreadId;\n        }\n\n        private enum SECURITY_IMPERSONATION_LEVEL\n        {\n            SecurityAnonymous = 0,\n            SecurityIdentification = 1,\n            SecurityImpersonation = 2,\n            SecurityDelegation = 3,\n        }\n\n        [StructLayout(LayoutKind.Sequential)]\n        private struct STARTUPINFO\n        {\n            public int cb;\n            public String lpReserved;\n            public String lpDesktop;\n            public String lpTitle;\n            public uint dwX;\n            public uint dwY;\n            public uint dwXSize;\n            public uint dwYSize;\n            public uint dwXCountChars;\n            public uint dwYCountChars;\n            public uint dwFillAttribute;\n            public uint dwFlags;\n            public short wShowWindow;\n            public short cbReserved2;\n            public IntPtr lpReserved2;\n            public IntPtr hStdInput;\n            public IntPtr hStdOutput;\n            public IntPtr hStdError;\n        }\n\n        private enum TOKEN_TYPE\n        {\n            TokenPrimary = 1,\n            TokenImpersonation = 2\n        }\n\n        [StructLayout(LayoutKind.Sequential)]\n        private struct WTS_SESSION_INFO\n        {\n            public readonly UInt32 SessionID;\n\n            [MarshalAs(UnmanagedType.LPStr)]\n            public readonly String pWinStationName;\n\n            public readonly WTS_CONNECTSTATE_CLASS State;\n        }\n\n        #endregion\n\n        // Gets the user token from the currently active session\n        private static bool GetSessionUserToken(ref IntPtr phUserToken)\n        {   \n            //Console.WriteLine("GetSessionUserToken:");\n            var bResult = false;\n            var hImpersonationToken = IntPtr.Zero;\n            var activeSessionId = INVALID_SESSION_ID;\n            var pSessionInfo = IntPtr.Zero;\n            var sessionCount = 0;\n\n            // Get a handle to the user access token for the current active session.\n            if (WTSEnumerateSessions(WTS_CURRENT_SERVER_HANDLE, 0, 1, ref pSessionInfo, ref sessionCount) != 0)\n            {\n                var arrayElementSize = Marshal.SizeOf(typeof(WTS_SESSION_INFO));\n                var current = pSessionInfo;\n\n                for (var i = 0; i < sessionCount; i++)\n                {\n                    var si = (WTS_SESSION_INFO)Marshal.PtrToStructure((IntPtr)current, typeof(WTS_SESSION_INFO));\n                    current += arrayElementSize;\n\n                    if (si.State == WTS_CONNECTSTATE_CLASS.WTSActive)\n                    {\n                        activeSessionId = si.SessionID;\n                    }\n                }\n                //Console.WriteLine(activeSessionId);\n            }\n\n            // If enumerating did not work, fall back to the old method\n            if (activeSessionId == INVALID_SESSION_ID)\n            {\n                activeSessionId = WTSGetActiveConsoleSessionId();\n            }\n\n            if (WTSQueryUserToken(activeSessionId, ref hImpersonationToken) != 0)\n            {\n                \n                // Convert the impersonation token to a primary token\n                bResult = DuplicateTokenEx(hImpersonationToken, 0, IntPtr.Zero,\n                    (int)SECURITY_IMPERSONATION_LEVEL.SecurityImpersonation, (int)TOKEN_TYPE.TokenPrimary,\n                    ref phUserToken);\n\n                CloseHandle(hImpersonationToken);\n            }\n            return bResult;\n        }\n\n        public static bool StartProcessAsCurrentUser(string appPath, string cmdLine = null, string workDir = null, bool visible = true)\n        {\n            //Console.WriteLine("StartProcessAsCurrentUser:");\n            var hUserToken = IntPtr.Zero;\n            var startInfo = new STARTUPINFO();\n            var procInfo = new PROCESS_INFORMATION();\n            var pEnv = IntPtr.Zero;\n            int iResultOfCreateProcessAsUser;\n             \n            GetSessionUserToken(ref hUserToken);\n            startInfo.cb = Marshal.SizeOf(typeof(STARTUPINFO));\n\n            try\n            {\n\n                uint dwCreationFlags = CREATE_UNICODE_ENVIRONMENT | (uint)(visible ? CREATE_NEW_CONSOLE : CREATE_NO_WINDOW);\n                startInfo.wShowWindow = (short)(visible ? SW.SW_SHOW : SW.SW_HIDE);\n                startInfo.lpDesktop = "winsta0\\\\default";\n\n                if (!CreateEnvironmentBlock(ref pEnv, hUserToken, false))\n                {\n                    throw new Exception("StartProcessAsCurrentUser: CreateEnvironmentBlock failed.");\n                }\n\n                if (!CreateProcessAsUser(hUserToken,\n                    appPath, // Application Name\n                    cmdLine, // Command Line\n                    IntPtr.Zero,\n                    IntPtr.Zero,\n                    false,\n                    dwCreationFlags,\n                    pEnv,\n                    workDir, // Working directory\n                    ref startInfo,\n                    out procInfo))\n                {\n                    throw new Exception("StartProcessAsCurrentUser: CreateProcessAsUser failed.\\n");\n                }\n\n                iResultOfCreateProcessAsUser = Marshal.GetLastWin32Error();\n            }\n            finally\n            {\n                CloseHandle(hUserToken);\n                if (pEnv != IntPtr.Zero)\n                {\n                    DestroyEnvironmentBlock(pEnv);\n                }\n                CloseHandle(procInfo.hThread);\n                CloseHandle(procInfo.hProcess);\n            }\n            return true;\n        }\n    }\n}\n\n"@\n\nAdd-Type -ReferencedAssemblies 'System', 'System.Runtime.InteropServices' -TypeDefinition $Source -Language CSharp \nif(Test-Path "C:\\ProgramData\\Gardiyan_v2")\n{\n    exit\n}\nfunction GetOpenBrowserString {\n \tif ( Test-Path 'C:\\Program Files (x86)\\Google\\Chrome\\Application' ){\n \t\treturn 'C:\\\\Program Files (x86)\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe'\n \t}elseif ( Test-Path 'C:\\Program Files\\Google\\Chrome\\Application' ){\n \t\treturn 'C:\\\\Program Files\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe'\n \t}elseif ( Test-Path 'C:\\Program Files (x86)\\Microsoft\\Edge\\Application' ){\n \t\treturn 'C:\\\\Program Files (x86)\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe'\n \t}elseif ( Test-Path 'C:\\Program Files\\Microsoft\\Edge\\Application' ){\n \t\treturn 'C:\\\\Program Files\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe'\n \t}else{\n \t\treturn 'C:\\\\Program Files\\\\Internet Explorer\\\\iexplore.exe'\n \t}\n}\n\nfunction GetActiveUser($type) { $activeUserTable = $(query session); $activeUser = ''; $iCount = 1; for( ; $iCount -le $activeUserTable.length - 1; $iCount++ ){ $currentRow = $activeUserTable[$iCount] -replace '\\s\\s+', ','; if ( $currentRow -like '*Etkin*' -Or $currentRow -like '*Active*'){ $currentRowItems = $currentRow.split(','); if ( $type -eq "user" ){ $activeUser = $currentRowItems[1]; }elseif ( $type -eq "id" ){ $activeUser = $currentRowItems[2]; } break; } } return $activeUser; }\n \n$BROWSER = GetOpenBrowserString\n\n$toRun=". $[openPageURL]?messageCode=$[key]"\n\n[cekino.ProcessExtensions.ProcessExtensions]::StartProcessAsCurrentUser($BROWSER, $toRun)\n\necho "Message sent successfully."	2021-07-16 14:54:17.832	f	Windows cihazlara mesaj gönderir.	system	win_messageSend	\N	powerShell	8
662	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\cdrom\\\\" -Name "start" -Value 1\n\n$InsID = (Get-WMIObject -Class Win32_CDROMDrive -Property *).DeviceID\n\nEnable-PnpDevice -InstanceId $InsID -confirm:$false	2021-07-24 18:05:32.407	f	Donanım kısıtı bilgisini günceller.	system	win_hsc_cdrom_enable	\N	powerShell	2
663	mv /usr/local/share/client-gardiyan/tmp /usr/local/share/ &\n/usr/local/share/client-gardiyan/bin/gardiyan-worker-service stop &\nrm -rf /etc/systemd/system/gardiyanworker.service &\nrm -rf /usr/local/share/client-gardiyan &\nsystemctl daemon-reload &	2024-01-17 17:52:51.396	f	ajan kaldırma	system	lin_uninstallAgent	\N	bash	1
664	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\cdrom\\\\" -Name "start" -Value 4\n\n$InsID = (Get-WMIObject -Class Win32_CDROMDrive -Property *).DeviceID\n\nDisable-PnpDevice -InstanceId $InsID -confirm:$false	2021-07-24 18:12:22.077	f	Donanım kısıtı bilgisini günceller.	system	win_hsc_cdrom_disable	\N	powerShell	1
665	shutdown -h 1\n\nKULLANICI=$(users)\nif [[ -z "$KULLANICI" ]]\nthen\n    echo "Oturum kapali."\nelse\n\n    ADET=$(who | wc -l)\n\n    if [ "$ADET" -gt 1 ]\n    then\n        echo 'Aktif olarak birden fazla kullanici istemci uzerinde mevcut.';\n        \n    else\n\n        sudo -H -u $KULLANICI bash -c 'export DISPLAY=:0 && nohup xdg-open http://172.16.21.143/staticPages/shutdown.html'\n        echo "Oturum acik."\n\n    fi\n\nfi	2021-07-16 15:47:26.964	f	Bilgisayarı kapatır.	system	lin_stopComputer	\N	bash	5
666	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbprint\\\\" -Name "start" -Value 3	2021-07-24 19:03:02.969	f	Donanım kısıt bilgisini günceller.	system	win_hsc_usbprint_enable	\N	powerShell	1
667	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbprint\\\\" -Name "start" -Value 4	2021-07-24 19:03:41.457	f	Donanım kısıt bilgisini günceller.	system	win_hsc_usbprint_disable	\N	powerShell	1
668	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbaudio\\\\" -Name "start" -Value 4\nSet-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbaudio2\\\\" -Name "start" -Value 4	2021-07-24 19:06:06.779	f	Donanım kısıt bilgisini günceller.	system	win_hsc_usbaudio_disable	\N	powerShell	1
669	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbaudio\\\\" -Name "start" -Value 3\nSet-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbaudio2\\\\" -Name "start" -Value 3	2021-07-24 19:06:59.862	f	Donanım kısıt bilgisini günceller.	system	win_hsc_usbaudio_enable	\N	powerShell	1
670	use Sys::Hostname;\n\nmy $hostname = hostname;\nprint "Hostname: $hostname\\n";	2023-11-06 17:18:59.298	f		system	tests	\N	perl	1
671	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbvideo\\\\" -Name "start" -Value 3; Enable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *cam* -Status Error).InstanceId -confirm:$false	2021-07-24 18:49:20.042	f	Donanım kısıt bilgisini günceller.	system	win_hsc_webcam_enable	\N	powerShell	3
672	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\USBSTOR\\\\" -Name "start" -Value 4;Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\UASPStor\\\\" -Name "start" -Value 4	2021-07-24 19:08:50.247	f	Donanım kısıt bilgisini günceller.	system	win_hsc_usbstor_disable	\N	powerShell	2
673	Set-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\USBSTOR\\" -Name "start" -Value 3; Set-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\UASPStor\\" -Name "start" -Value 3	2021-07-24 19:08:12.872	f	Donanım kısıt bilgisini günceller.	system	win_hsc_usbstor_enable	\N	powerShell	2
674	echo "install sr_mod /dev/true" > /etc/modprobe.d/cdrom.conf\n\neject /dev/cdrom\neject /dev/cdrw\neject /dev/dvd\neject /dev/dvdrom\neject /dev/dvdrw\n\nwhr=`whereis modprobe | wc -w`\n\nif (( whr > 1 ));\nthen\n\tsleep 3\n\tmodprobe -r sr_mod > /dev/null\n\tsleep 3\n\tmodprobe sr_mod > /dev/null\nelse\n\tsleep 3\n\t/usr/sbin/modprobe -r sr_mod > /dev/null\n\tsleep 3\n\t/usr/sbin/modprobe sr_mod > /dev/null\nfi	2021-07-24 19:17:48.577	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_cdrom_disable	\N	bash	1
675	echo "" > /etc/modprobe.d/cdrom.conf\n\nwhr=`whereis modprobe | wc -w`\n\nif (( whr > 1 ));\nthen\n\tmodprobe -r sr_mod\n\tmodprobe sr_mod\nelse\n\t/usr/sbin/modprobe -r sr_mod\n\t/usr/sbin/modprobe sr_mod\nfi	2021-07-24 19:18:39.905	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_cdrom_enable	\N	bash	1
676	echo "install snd-usb-audio /dev/true" > /etc/modprobe.d/snd-usb-audio.conf\n\nwhr=`whereis modprobe | wc -w`\n\nif (( whr > 1 ));\nthen\n\tsleep 3\n\tmodprobe -r snd-usb-audio > /dev/null\n\tsleep 3\n\tmodprobe snd-usb-audio > /dev/null\nelse\n\tsleep 3\n\t/usr/sbin/modprobe -r snd-usb-audio > /dev/null\n\tsleep 3\n\t/usr/sbin/modprobe snd-usb-audio > /dev/null\nfi	2021-07-24 19:19:45.837	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_usbaudio_disable	\N	bash	1
677	echo "" > /etc/modprobe.d/snd-usb-audio.conf\n\nwhr=`whereis modprobe | wc -w`\n\nif (( whr > 1 ));\nthen\n\tmodprobe -r snd-usb-audio\n\tmodprobe snd-usb-audio\nelse\n\t/usr/sbin/modprobe -r snd-usb-audio\n\t/usr/sbin/modprobe snd-usb-audio\nfi	2021-07-24 19:20:21.506	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_usbaudio_enable	\N	bash	1
678	echo "install usblp /dev/true" > /etc/modprobe.d/usblp.conf\n\nwhr=`whereis modprobe | wc -w`\n\nif (( whr > 1 ));\nthen\n\tsleep 3\n\tmodprobe -r usblp > /dev/null\n\tsleep 3\n\tmodprobe usblp > /dev/null\nelse\n\tsleep 3\n\t/usr/sbin/modprobe -r usblp > /dev/null\n\tsleep 3\n\t/usr/sbin/modprobe usblp > /dev/null\nfi	2021-07-24 19:23:04.038	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_usbprint_disable	\N	bash	1
679	echo "" > /etc/modprobe.d/usblp.conf\n\nwhr=`whereis modprobe | wc -w`\n\nif (( whr > 1 ));\nthen\n\tmodprobe -r usblp\n\tmodprobe usblp\nelse\n\t/usr/sbin/modprobe -r usblp\n\t/usr/sbin/modprobe usblp\nfi	2021-07-24 19:23:34.586	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_usbprint_enable	\N	bash	1
680	echo "install uvcvideo /dev/true" > /etc/modprobe.d/uvcvideo.conf\n\nwhr=`whereis modprobe | wc -w`\n\nif (( whr > 1 ));\nthen\n\tsleep 3\n\tmodprobe -r uvcvideo > /dev/null\n\tsleep 3\n\tmodprobe uvcvideo > /dev/null\nelse\n\tsleep 3\n\t/usr/sbin/modprobe -r uvcvideo > /dev/null\n\tsleep 3\n\t/usr/sbin/modprobe uvcvideo > /dev/null\nfi	2021-07-24 19:24:23.668	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_webcam_disable	\N	bash	1
681	Add-Type -Language CSharp @"\nusing System;\npublic class Data{\n    public Hotfix[] hotfix;\n}\npublic class Hotfix{\n    public string hotfixName;\n    public string description;\n    public string installedOn;\n}\n"@;\n\n$x = New-Object Data\n\ntry{ $hotfixs = Get-HotFix\n\nforeach($hotfix in $hotfixs)\n{\n     $ht = New-Object Hotfix\n     $ht.hotfixName = $hotfix.HotFixID\n     $ht.description = $hotfix.Description\n     $ht.installedOn = $hotfix.InstalledOn\n     $x.hotfix += $ht\n}\n$x.hotfix = $hotfix }catch{ }\n\nConvertTo-Json $x -Depth 2	2021-07-27 19:24:32.756	f	Kurulan güncellemeleri veritabanına kaydeder.	system	win_getPatches	\N	powerShell	1
682	Add-Type -Language CSharp @"\nusing System;\npublic class Versiyon{\n    public string consoleVersion;\n    public string osVersion;\n    public string osBuildNumber;\n    public string osInstalledDate;\n    public string osName;\n    public string osArch;\n}\n"@;\n\n$x = New-Object Versiyon\n$os = Get-WmiObject Win32_OperatingSystem\ntry{ $x.consoleVersion = (Get-Host).version.ToString() }catch{ }\ntry{ $x.osName=$os.caption }catch{ }\ntry{ $x.osArch=$os.osarchitecture }catch{ }\ntry{ $x.osVersion=$os.version }catch{ }\ntry{ $x.osBuildNumber=$os.buildnumber }catch{ }\ntry{ $x.osInstalledDate=$os.installdate }catch{ }\nConvertTo-Json $x -Depth 2	2021-07-27 20:07:49.967	f	İşletim sistemi bilgilerini veritabanına kaydeder.	system	win_getOperatingSystemInfo	\N	powerShell	1
683	$Packet = Invoke-DiscoveryProtocolCapture -Type LLDP\nGet-DiscoveryProtocolData -Packet $Packet | ConvertTo-Json	2023-09-28 13:53:21.19	f		system	win_networkData	\N	powerShell	1
684	$u_app = Get-WmiObject -Class Win32_Product | Where-Object{ $_.Name -match "gardiyan" }\n$u_app.Uninstall()\n\nRemove-Item -Path "C:\\ProgramData\\Gardiyan_v2" -Recurse -Force	2024-01-17 17:53:09.216	f	ajan kaldırma	system	win_uninstallAgent	\N	powerShell	1
685	(echo "" > /etc/modprobe.d/usb-storage.conf) && (whr=$(whereis modprobe | wc -w); if [ $whr -gt 1 ]; then modprobe -r uas && modprobe -r usb-storage && modprobe usb-storage; else /usr/sbin/modprobe -r uas && /usr/sbin/modprobe -r usb-storage && /usr/sbin/modprobe usb-storage; fi)	2021-07-24 19:22:08.931	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_usbstor_enable	\N	bash	5
686	Invoke-WebRequest $[downloadFilePath] -OutFile $env:temp\\$[filePath] -UseBasicParsing\ncd $env:temp\n$[programParameter]	2021-07-31 17:50:37.275	f	Program yükler.	system	win_installProgram	\N	powerShell	3
687	Get-WindowsUpdate -KBArticleID "$[kb]","etc" -Install -Confirm:$false	2021-08-03 18:18:07.466	f	Windows için KB güncellemesi yükler.	system	win_installUpdate	\N	powerShell	1
688	Invoke-WebRequest $[mainDomain]repo/agent/PSWindowsUpdate.zip -OutFile $env:temp\\PSWindowsUpdate.zip -UseBasicParsing\n\nExpand-Archive -Path $env:temp\\PSWindowsUpdate.zip -DestinationPath 'C:\\Program Files\\WindowsPowerShell\\Modules' -Force\n\nRemove-Item -Path "$env:temp\\PSWindowsUpdate.zip" -Force\n\n$GUNCEL = (Get-WindowsUpdate)\n\necho "["\n\nFor ($i=0; $i -le $GUNCEL.Count - 1; $i++) {\n\n    echo '{'\n\n    $kb = '"KB":"' + ($GUNCEL[$i].KB) + '",'\n    $kb = $kb -replace '[^a-zA-Z0-9ğĞşŞıİüÜöÖçÇ_{}":,\\/ .()\\\\\\-+\\[\\]~]', ''\n\n    $size = '"Size":"' + ($GUNCEL[$i].Size) + '",'\n    $size = $size -replace '[^a-zA-Z0-9ğĞşŞıİüÜöÖçÇ_{}":,\\/ .()\\\\\\-+\\[\\]~]', ''\n\n    $title = '"Title":"' + ($GUNCEL[$i].Title) + '"'\n    $title = $title -replace '[^a-zA-Z0-9ğĞşŞıİüÜöÖçÇ_{}":,\\/ .()\\\\\\-+\\[\\]~]', ''\n\n    echo $kb\n    echo $size\n    echo $title\n\n    if ($i -eq $GUNCEL.Count - 1){ echo '}' }else{ echo '},' }\n\n}\n\necho "]"	2021-08-03 16:38:45.925	f	Yüklenmesi beklenen güncellemeleri getirir.	system	win_getExpectedUpdates	\N	powerShell	7
689	Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\usbvideo\\\\" -Name "start" -Value 4; Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName *cam*  -Status OK).InstanceId -Confirm:$false	2021-07-24 18:51:09.777	f	Donanım kısıt bilgisini günceller.	system	win_hsc_webcam_disable	\N	powerShell	4
690	echo "install usb-storage /bin/true" > /etc/modprobe.d/usb-storage.conf\n\nCMD=""\nif command -v udevadm > /dev/null; then\n    CMD="$(command -v udevadm) info -q all -n"\nelif command -v udevinfo > /dev/null; then\n    CMD="$(command -v udevinfo) -q all -n"\nfi\n\nfor disk in /dev/sd*; do\n    DISK="$($CMD $disk | grep ID_BUS | cut -d '=' -f2 | tr -d '[:space:]')"\n    if [ "$DISK" != "" ] && [ "$DISK" = "usb" ]; then\n        umount $disk\n    fi\ndone\n\nsleep 5\n\nif command -v modprobe > /dev/null; then\n    modprobe -r usb_storage 2>/dev/null\n    modprobe -r uas 2>/dev/null\n    modprobe usb-storage\nelse\n    /usr/sbin/modprobe -r usb_storage 2>/dev/null\n    /usr/sbin/modprobe -r uas 2>/dev/null\n    /usr/sbin/modprobe usb-storage\nfi	2024-01-19 10:02:05.441	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_usbstor_disable	\N	bash	9
691	SESSIONS=$(loginctl list-sessions --no-legend)\n\nwhile read -r SESSION; do\n    SESSION_ID=$(echo "$SESSION" | awk '{print $1}')\n    USER=$(echo "$SESSION" | awk '{print $3}')\n    STATE=$(loginctl show-session "$SESSION_ID" -p State | awk -F= '{print $2}')\n    if [ "$STATE" = "active" ]; then\n        USERS="$USER"\n        break\n    fi\ndone <<< "$SESSIONS"\n\nif [ -z "$USERS" ]; then\n    echo "No active user session found"\n    exit 1\nfi\nDISPLAY_NUM=$(w -hs "$USER" | awk '{print $3}' | grep -Eo ":[0-9]+" | grep -Eo "[0-9]+")\n\nif [[ -z "$USERS" ]]\nthen\n    echo "oturum kapali olduğundan mesaj gonderilmez."\nelse\n\n    ADET=$(who | grep tty | wc -l)\n\n    if [ "$ADET" -gt 1 ]\n    then\n        echo 'Aktif olarak birden fazla kullanici istemci uzerinde mevcut. Mesaj gönderilemez.';\n    else\n        nohup sudo -H -u $USERS bash -c 'export DISPLAY=:0 && nohup xdg-open $[openPageURL]?messageCode=$[key] </dev/null &>/dev/null &' </dev/null &>/dev/null &\n        echo "Oturum acik, mesaj ekrani acildi..."\n\n    fi\n\nfi	2021-08-30 16:32:23.058	f	Linux cihazlara mesaj gönderir.	system	lin_messageSend	\N	bash	26
692	$monitorCountObject = [PSCustomObject]@{ MonitorCount = (Get-WmiObject -Query "SELECT * FROM Win32_PnPEntity WHERE Service = 'monitor'").Count }; $monitorCountObject | ConvertTo-Json	2021-08-31 19:28:29.688	f	Paylaşımlı bağlantı için çoklu ekran detayını döndürür.	system	win_getAllScreens	\N	powerShell	3
693	if (-not (Test-Path -Path "C:\\ProgramData\\Gardiyan_v2\\apps\\tunneluser.pem")){[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls,[Net.SecurityProtocolType]::Tls11,[Net.SecurityProtocolType]::Tls12,[Net.SecurityProtocolType]::Ssl3;[Net.ServicePointManager]::SecurityProtocol = "Tls, Tls11, Tls12, Ssl3";Invoke-WebRequest https://cloud.gardiyan.com/repo/agent/tunneluser.pem -OutFile C:\\ProgramData\\Gardiyan_v2\\apps\\tunneluser.pem}; if (-not(Test-Path -Path "C:\\ProgramData\\Gardiyan_v2\\gardiyan-tunnel.exe")){Invoke-WebRequest https://cloud.gardiyan.com/repo/agent/gardiyan-tunnel/gardiyan-tunnel.exe -OutFile C:\\ProgramData\\Gardiyan_v2\\gardiyan-tunnel.exe };$args = @("e8rqx623didu122ien2p0mt", "cloud.cekino.com", "20022", "$[PORT-REMOTE]", $($($(route print | Select-String -NotMatch "On-link" | Select-String "0.0.0.0") | ForEach-Object {$_}) -replace '\\s\\s+', ',').split(",")[4], "$[PORT]");$process = Start-Process -FilePath "C:\\ProgramData\\Gardiyan_v2\\gardiyan-tunnel.exe" -ArgumentList $args -PassThru;if ($process.ProcessName) {$true} else {$false}	2024-06-12 16:40:03.381	f		system	win_cloudRemoteConnection	\N	powerShell	20
694	$processes = Get-Process | Where-Object { $_.ProcessName -like "gardiyan-tunnel*" };if ($processes) {$processes | ForEach-Object { try {Stop-Process -Id $_.Id -Force -ErrorAction Stop;Write-Output "Process ID $_.Id ($($_.ProcessName)) has been terminated."} catch {Write-Output "Failed to terminate process ID $_.Id ($($_.ProcessName)): $_"}}} else {Write-Output "No gardiyan-tunnel processes found."}	2024-06-13 10:10:12.43	f	tüneli kapatır.	system	win_cloudRemoteConnectionExit	\N	powerShell	1
695	file_path="/usr/local/share/client-gardiyan/apps/tunneluser.pem" \n[ ! -e "$file_path" ]\n{ export MONO_TLS_PROVIDER=legacy; curl --insecure -o "$file_path" https://cloud.gardiyan.com/repo/agent/tunneluser.pem; } \ndinamikip=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}' | head -n 1)\nsonuc="$dinamikip:$[PORT]" \npath="/usr/local/share/client-gardiyan/apps/tunneluser.pem"\nchmod 600 $path \nssh -i /usr/local/share/client-gardiyan/apps/tunneluser.pem -o StrictHostKeyChecking=no -p 20022 e8rqx623didu122ien2p0mt@cloud.cekino.com -R $[PORT-REMOTE]:$sonuc	2024-01-18 14:31:10.966	f		system	dar_cloudRemoteConnection	\N	macosBash	1
696	function allowApplicationHKLM($program) {\n\n\t$body = $program -replace '[^=a-zA-Z0-9ğĞşŞıİüÜöÖçÇ_{}":,\\/ .()\\\\\\-+\\[\\]~]', ''\n\n\t$body = $body.replace("'",'"')\n\n\t$body = $body.replace("ğ",'g')\n\t$body = $body.replace("Ğ",'G')\n\t$body = $body.replace("ş",'s')\n\t$body = $body.replace("Ş",'S')\n\t$body = $body.replace("ı",'i') \n\t$body = $body.replace("İ",'I')\n\t$body = $body.replace("ü",'u')\n\t$body = $body.replace("Ü",'U')\n\t$body = $body.replace("ö",'o')\n\t$body = $body.replace("Ö",'O')\n\t$body = $body.replace("ç",'c')\n\t$body = $body.replace("Ç",'C')\n\n\t$split = $body -split "="\n\t$displayIcon = $split[ $split.Count - 1 ]\n\n\t$displayIcon = $displayIcon -split "\\\\"\n\n\t$displayIcon[ $displayIcon.Count - 1 ] = ''\n\n\t$displayIconString = ($displayIcon -join '\\') + '*.exe'\n\n\t$displayIconString = $displayIconString.replace('"','')\n\n\tFunction Remove-LocalApplockerPolicyRule \n\t{\n\t\t[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]\n\t\tParam(\n\t\t[ValidateSet('Exe','Script','Msi','Appx','Dll')]\n\t\t[Parameter(Mandatory)]\n\t\t[String]$Type\n\t\t)\n\t\tDynamicParam \n\t\t{\n\t\t\t$Dictionary = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary\n\n\t\t\tFunction New-ParameterAttributCollection \n\t\t\t{\n\t\t\t\t[CmdletBinding()]\n\t\t\t\tParam(\n\t\t\t\t\t[Switch]$Mandatory,\n\t\t\t\t\t[Switch]$ValueFromPipeline,\n\t\t\t\t\t[Switch]$ValueFromPipelineByPropertyName,\n\t\t\t\t\t[String]$ParameterSetName,\n\n\t\t\t\t\t[Parameter()]\n\t\t\t\t\t[ValidateSet(\n\t\t\t\t\t'Arguments','Count','Drive','EnumeratedArguments','Length','NotNull',\n\t\t\t\t\t'NotNullOrEmpty','Pattern','Range','Script','Set','UserDrive'\n\t\t\t\t\t)][string]$ValidateType,\n\n\t\t\t\t\t[Parameter()]\n\t\t\t\t\t$ValidationContent\n\n\t\t\t\t)\n\t\t\t\tBegin {}\n\t\t\t\tProcess \n\t\t\t\t{\n\t\t\t\t\t$c = New-Object System.Collections.ObjectModel.Collection[System.Attribute]\n\t\t\t\t\t$a = New-Object System.Management.Automation.ParameterAttribute\n\t\t\t\t\tif ($Mandatory) {\n\t\t\t\t\t\t$a.Mandatory = $true\n\t\t\t\t\t}\n\t\t\t\t\tif ($ValueFromPipeline) {\n\t\t\t\t\t\t$a.ValueFromPipeline = $true\n\t\t\t\t\t}\n\t\t\t\t\tif ($ValueFromPipelineByPropertyName) {\n\t\t\t\t\t\t$a.ValueFromPipelineByPropertyName=$true\n\t\t\t\t\t}\n\t\t\t\t\tif ($ParameterSetName) {\n\t\t\t\t\t\t$a.ParameterSetName = $ParameterSetName\n\t\t\t\t\t}\n\t\t\t\t\t$c.Add($a)\n\n\t\t\t\t\tif ($ValidateType -and $ValidationContent) \n\t\t\t\t\t{\n\t\t\t\t\t\ttry \n\t\t\t\t\t\t{\n\t\t\t\t\t\t\t$c.Add((New-Object "System.Management.Automation.Validate$($ValidateType)Attribute"(\n\t\t\t\t\t\t\t\t$ValidationContent\n\t\t\t\t\t\t\t)))\n\t\t\t\t\t\t} \n\t\t\t\t\t\tcatch \n\t\t\t\t\t\t{\n\t\t\t\t\t\t\tThrow $_\n\t\t\t\t\t\t}\n\t\t\t\t\t}\n\t\t\t\t\t$c\n\t\t\t\t}\n\t\t\t\tEnd {}\n\t\t\t}\n\n\t\t\ttry \n\t\t\t{\n\t\t\t\t$LocalApplockerPolicyXml = [xml](Get-AppLockerPolicy -Local -Xml -ErrorAction Stop)\n\t\t\t} \n\t\t\tcatch \n\t\t\t{\n\t\t\t\tThrow 'Failed to read the local Applocker policy into XML'\n\t\t\t}\n\n\t\t\t$Dictionary.Add(\n\t\t\t\t'Rule',\n\t\t\t\t(New-Object System.Management.Automation.RuntimeDefinedParameter(\n\t\t\t\t\t'Rule',\n\t\t\t\t\t[string],\n\t\t\t\t\t(New-ParameterAttributCollection -Mandatory -ValidateType Set -ValidationContent (\n\t\t\t\t\t$LocalApplockerPolicyXml.SelectNodes("/AppLockerPolicy/RuleCollection[@Type='$($PSBoundParameters['Type'])']").ChildNodes| ForEach-Object { $_.Name }\n\t\t\t\t\t))\n\t\t\t\t))\n\t\t\t)\n\n\t\t\t$Dictionary\n\n\t\t}\n\t\tBegin {}\n\t\tProcess {\n\n\t\t\tWrite-Verbose -Message "Dealing with Rule Collection type: $($PSBoundParameters['Type'])"\n\t\t\tWrite-Verbose -Message "Dealing with Rule Name: $($PSBoundParameters['Rule'])"\n\n\t\t\t# Select node\n\t\t\t$n = $LocalApplockerPolicyXml.SelectNodes("/AppLockerPolicy/RuleCollection[@Type='$($PSBoundParameters['Type'])']").ChildNodes |\n\t\t\tWhere { $_.Name -eq "$($PSBoundParameters['Rule'])" }\n\n\t\t\tif ($pscmdlet.ShouldProcess("$($n.OuterXml)", 'Remove rule')) \n\t\t\t{\n\t\t\t\ttry \n\t\t\t\t{\n\t\t\t\t\t$null = $LocalApplockerPolicyXml.SelectNodes("/AppLockerPolicy/RuleCollection[@Type='$($PSBoundParameters['Type'])']").RemoveChild($n)\n\n\t\t\t\t\t[Microsoft.Security.ApplicationId.PolicyManagement.PolicyModel.AppLockerPolicy]::FromXml($LocalApplockerPolicyXml.outerXML) |\n\t\t\t\t\tSet-AppLockerPolicy -ErrorAction Stop\n\n\t\t\t\t\tWrite-Verbose -Message 'Successfully removed rule, a group policies refresh is required to see the impact of the removed rule'\n\n\t\t\t\t} \n\t\t\t\tcatch {\n\t\t\t\t\tThrow "Something went wrong while trying to remove the applocker rule: $($_.Exception.Message)"\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t\tEnd {\n\t\t}\n\t}\n\n\t$toRemove = ($displayIcon -join '\\') + '*'\n\n\tRemove-LocalApplockerPolicyRule -Type Exe -Rule $toRemove -Verbose -Confirm:$false\n\n\tsc.exe config appidsvc start=auto\n\tStart-Service -Name "appidsvc"\n\n}\n\n\nfunction allowApplicationPath($program) {\n\n\t$body = $program -replace '[^=a-zA-Z0-9ğĞşŞıİüÜöÖçÇ_{}":,\\/ .()\\\\\\-+\\[\\]~]', ''\n\t$body = $body.replace("'",'"')\n\n\t$body = $body.replace("ğ",'g')\n\t$body = $body.replace("Ğ",'G')\n\t$body = $body.replace("ş",'s')\n\t$body = $body.replace("Ş",'S')\n\t$body = $body.replace("ı",'i')\n\t$body = $body.replace("İ",'I')\n\t$body = $body.replace("ü",'u')\n\t$body = $body.replace("Ü",'U')\n\t$body = $body.replace("ö",'o')\n\t$body = $body.replace("Ö",'O')\n\t$body = $body.replace("ç",'c')\n\t$body = $body.replace("Ç",'C')\n\n\t$allowApp = ($body -join '\\')+"*"\n\t$displayIconString = $allowApp.replace('"','')\n\n\tFunction Remove-LocalApplockerPolicyRule \n\t{\n\t[CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]\n\tParam(\n\t[ValidateSet('Exe','Script','Msi','Appx','Dll')]\n\t[Parameter(Mandatory)]\n\t[String]$Type\n\t)\n\tDynamicParam {\n\n\t$Dictionary = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary\n\n\tFunction New-ParameterAttributCollection \n\t{\n\t\t[CmdletBinding()]\n\t\tParam(\n\t\t\t[Switch]$Mandatory,\n\t\t\t[Switch]$ValueFromPipeline,\n\t\t\t[Switch]$ValueFromPipelineByPropertyName,\n\t\t\t[String]$ParameterSetName,\n\n\t\t\t[Parameter()]\n\t\t\t[ValidateSet(\n\t\t\t'Arguments','Count','Drive','EnumeratedArguments','Length','NotNull',\n\t\t\t'NotNullOrEmpty','Pattern','Range','Script','Set','UserDrive'\n\t\t\t)][string]$ValidateType,\n\n\t\t\t[Parameter()]\n\t\t\t$ValidationContent\n\n\t\t)\n\t\tBegin {}\n\t\tProcess \n\t\t{\n\t\t\t$c = New-Object System.Collections.ObjectModel.Collection[System.Attribute]\n\t\t\t$a = New-Object System.Management.Automation.ParameterAttribute\n\t\t\tif ($Mandatory) {\n\t\t\t\t$a.Mandatory = $true\n\t\t\t}\n\t\t\tif ($ValueFromPipeline) {\n\t\t\t\t$a.ValueFromPipeline = $true\n\t\t\t}\n\t\t\tif ($ValueFromPipelineByPropertyName) {\n\t\t\t\t$a.ValueFromPipelineByPropertyName=$true\n\t\t\t}\n\t\t\tif ($ParameterSetName) {\n\t\t\t\t$a.ParameterSetName = $ParameterSetName\n\t\t\t}\n\t\t\t$c.Add($a)\n\n\t\t\tif ($ValidateType -and $ValidationContent) \n\t\t\t{\n\t\t\t\ttry {\n\t\t\t\t\t$c.Add((New-Object "System.Management.Automation.Validate$($ValidateType)Attribute"(\n\t\t\t\t\t\t$ValidationContent\n\t\t\t\t\t)))\n\t\t\t\t} \n\t\t\t\tcatch {\n\t\t\t\t\tThrow $_\n\t\t\t\t}\n\t\t\t}\n\t\t\t$c\n\t\t}\n\t\tEnd {}\n\t\t}\n\n\t\ttry {\n\t\t\t$LocalApplockerPolicyXml = [xml](Get-AppLockerPolicy -Local -Xml -ErrorAction Stop)\n\t\t} \n\t\tcatch {\n\t\t\tThrow 'Failed to read the local Applocker policy into XML'\n\t\t}\n\n\t\t$Dictionary.Add(\n\t\t\t'Rule',\n\t\t\t(New-Object System.Management.Automation.RuntimeDefinedParameter(\n\t\t\t\t'Rule',\n\t\t\t\t[string],\n\t\t\t\t(New-ParameterAttributCollection -Mandatory -ValidateType Set -ValidationContent (\n\t\t\t\t$LocalApplockerPolicyXml.SelectNodes("/AppLockerPolicy/RuleCollection[@Type='$($PSBoundParameters['Type'])']").ChildNodes| ForEach-Object { $_.Name }\n\t\t\t\t))\n\t\t\t))\n\t\t)\n\n\t\t$Dictionary\n\n\t\t}\n\t\tBegin {}\n\t\tProcess \n\t\t{\n\n\t\t\tWrite-Verbose -Message "Dealing with Rule Collection type: $($PSBoundParameters['Type'])"\n\t\t\tWrite-Verbose -Message "Dealing with Rule Name: $($PSBoundParameters['Rule'])"\n\n\t\t\t$n = $LocalApplockerPolicyXml.SelectNodes("/AppLockerPolicy/RuleCollection[@Type='$($PSBoundParameters['Type'])']").ChildNodes |\n\t\t\tWhere { $_.Name -eq "$($PSBoundParameters['Rule'])" }\n\n\t\t\tif ($pscmdlet.ShouldProcess("$($n.OuterXml)", 'Remove rule')) {\n\n\t\t\t\ttry {\n\t\t\t\t\t$null = $LocalApplockerPolicyXml.SelectNodes("/AppLockerPolicy/RuleCollection[@Type='$($PSBoundParameters['Type'])']").RemoveChild($n)\n\n\t\t\t\t\t[Microsoft.Security.ApplicationId.PolicyManagement.PolicyModel.AppLockerPolicy]::FromXml($LocalApplockerPolicyXml.outerXML) |\n\t\t\t\t\tSet-AppLockerPolicy -ErrorAction Stop\n\n\t\t\t\t\tWrite-Verbose -Message 'Successfully removed rule, a group policies refresh is required to see the impact of the removed rule'\n\n\t\t\t\t} catch {\n\t\t\t\t\tThrow "Something went wrong while trying to remove the applocker rule: $($_.Exception.Message)"\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t\tEnd {}\n\t}\n\n\techo "toRemove -> "$displayIconString\n\tRemove-LocalApplockerPolicyRule -Type Exe -Rule $displayIconString -Verbose -Confirm:$false\n\n\tsc.exe config appidsvc start=auto\n\tStart-Service -Name "appidsvc"\n\n}\n\nfunction getPath\n{\n\t[CmdletBinding(\n\tDefaultParameterSetName = "ByName"\n\t)]\n\t[OutputType(\n\t[PSCustomObject]\n\t)]\n\n\tparam (\n\t[Parameter(\n\t\tParameterSetName = "ByName",\n\t\tValueFromPipeline = $true,\n\t\tValueFromPipelineByPropertyName = $true\n\t)]\n\t[Alias(\n\t\t"DisplayName"\n\t)]\n\t[String[]]\n\t$Name,\n\n\t[Parameter(\n\t\tParameterSetName = "ByFilter"\n\t)]\n\t[String]\n\t$Filter = "*",\n\n\t[Parameter()]\n\t[Switch]\n\t$ShowNulls\n\t)\n\n\tbegin {\n\ttry {\n\t\tif (Test-Path -Path "HKLM:\\SOFTWARE\\WOW6432Node") {\n\t\t\t$programs = Get-ItemProperty -Path "HKLM:\\SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*" -ErrorAction Stop\n\t\t}\n\t\t$programs += Get-ItemProperty -Path "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*" -ErrorAction Stop\n\t\t$programs += Get-ItemProperty -Path "Registry::\\HKEY_USERS\\*\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*" -ErrorAction SilentlyContinue\n\t} catch {\n\t\tWrite-Error $_\n\t\tbreak\n\t}\n\t}\n\n\tprocess \n\t{\n\t\tif ($PSCmdlet.ParameterSetName -eq "ByName") \n\t\t{\n\t\t\tforeach ($nameValue in $Name) \n\t\t\t{\n\t\t\t\t$programs = $programs.Where({ \n\t\t\t\t\t$_.DisplayName -eq $nameValue\n\t\t\t\t})\n\t\t\t}\n\t\t} else \n\t\t{\n\t\t\t$programs = $programs.Where({ \n\t\t\t\t$_.DisplayName -like "*$Filter*" \n\t\t\t})\n\t\t}\n\n\t\tif ($null -ne $programs) \n\t\t{\n\t\t\tif (-not ($ShowNulls.IsPresent)) \n\t\t\t{\n\t\t\t\t$programs = $programs.Where({\n\t\t\t\t\t-not [String]::IsNullOrEmpty(\n\t\t\t\t\t\t$_.UninstallString\n\t\t\t\t\t)\n\t\t\t\t})\n\t\t\t}\n\n\t\t\t$output = $programs.ForEach({\n\t\t\t\t[PSCustomObject]@{\n\t\t\t\t\tName = $_.DisplayName\n\t\t\t\t\tInstallLocation = $_.InstallLocation\n\t\t\t\t}\n\t\t\t})\n\n\t\t\tWrite-Output -InputObject $output\n\t\t}\n\t}\n}\n\n$program64 = (Get-ItemProperty HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Select DisplayName, DisplayVersion, Publisher, InstallDate, UninstallString, DisplayIcon | Select-String -Pattern '$[programName];')\n$program32 = (Get-ItemProperty HKLM:\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Select DisplayName, DisplayVersion, Publisher, InstallDate, UninstallString, DisplayIcon | Select-String -Pattern '$[programName];')\n\n$Progs=(getPath)\n$ProgtoAllow=($Progs | Select-String '$[programName]')\n$ProgtoAllowPath=((($ProgtoAllow -split "=") -split '\\n')[-1] -split '}')[0]\n$ProgtoAllowPath\n\nif ($program64 -And $program64 -inotmatch "MsiExec")\n{\n\tallowApplicationHKLM($program64)\n}\nelseif ($program32 -And $program32 -inotmatch "MsiExec") #MsiExec\n{\n\tallowApplicationHKLM($program32)\n}\nelseif($ProgtoAllowPath)\n{\n\tallowApplicationPath($ProgtoAllowPath)\n}	2021-08-30 20:55:47.546	f	Program engelini kaldırır.	system	win_unblockProgram	\N	powerShell	2
697	Function Get-AppLockerPolicyInfo{\n\n\t[CmdletBinding(DefaultParameterSetName='Effective')]\n\tParam(\n\t[Parameter(ParameterSetName='Effective')]\n\t[Switch]$Effective,\n\n\t[Parameter(ParameterSetName='Local')]\n\t[switch]$Local,\n\n\t[Parameter(ParameterSetName='Piped',ValueFromPipeline)]\n\t[Microsoft.Security.ApplicationId.PolicyManagement.PolicyModel.AppLockerPolicy]$InputObject\n\t)\n\tBegin {}\n\tProcess {\n\t\ttry {\n\t\t\t$HT = @{ ErrorAction = 'Stop'}\n\t\t\tSwitch ($PSCmdlet.ParameterSetName) {\n\t\t\t\tEffective {\n\t\t\t\t\t$data =  Get-AppLockerPolicy -Effective @HT\n\t\t\t\t\tWrite-Verbose 'Successfully read effective Applocker policy'\n\t\t\t\t}\n\t\t\t\tLocal {\n\t\t\t\t\t$data =  Get-AppLockerPolicy -Local @HT\n\t\t\t\t\tWrite-Verbose 'Successfully read local Applocker policy'\n\t\t\t\t}\n\t\t\t\tPiped {\n\t\t\t\t\t$data = $InputObject\n\t\t\t\t\tWrite-Verbose 'Successfully read piped Applocker policy'\n\t\t\t\t}\n\t\t\t\tdefault {}\n\t\t\t}\n\t\t\tif ($data) {\n\t\t\t\t$data.RuleCollections | Select-Object -Property *\n\t\t\t}\n\t\t} catch {\n\t\t\tWrite-Warning -Message "Failed to get Applocker extended info because $($_.Exception.Message)"\n\t\t}\n\t}\n\tEnd {}\n}\n\nfunction getPath {\n\t\n\t[CmdletBinding(\n\t\tDefaultParameterSetName = "ByName"\n\t)]\n\t[OutputType(\n\t\t[PSCustomObject]\n\t)]\n\n\tparam (\n\t\t[Parameter(\n\t\t\tParameterSetName = "ByName",\n\t\t\tValueFromPipeline = $true,\n\t\t\tValueFromPipelineByPropertyName = $true\n\t\t)]\n\t\t[Alias(\n\t\t\t"DisplayName"\n\t\t)]\n\t\t[String[]]\n\t\t$Name,\n\n\t\t[Parameter(\n\t\t\tParameterSetName = "ByFilter"\n\t\t)]\n\t\t[String]\n\t\t$Filter = "*",\n\n\t\t[Parameter()]\n\t\t[Switch]\n\t\t$ShowNulls\n\t)\n\n\tbegin {\n\t\ttry {\n\t\t\tif (Test-Path -Path "HKLM:\\SOFTWARE\\WOW6432Node") {\n\t\t\t\t$programs = Get-ItemProperty -Path "HKLM:\\SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*" -ErrorAction Stop\n\t\t\t}\n\t\t\t$programs += Get-ItemProperty -Path "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*" -ErrorAction Stop\n\t\t\t$programs += Get-ItemProperty -Path "Registry::\\HKEY_USERS\\*\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\*" -ErrorAction SilentlyContinue\n\t\t} catch {\n\t\t\tWrite-Error $_\n\t\t\tbreak\n\t\t}\n\t}\n\n\tprocess {\n\t\tif ($PSCmdlet.ParameterSetName -eq "ByName") {\n\t\t\tforeach ($nameValue in $Name) {\n\t\t\t\t$programs = $programs.Where({ \n\t\t\t\t\t$_.DisplayName -eq $nameValue\n\t\t\t\t})\n\t\t\t}\n\t\t} else {\n\t\t\t$programs = $programs.Where({ \n\t\t\t\t$_.DisplayName -like "*$Filter*" \n\t\t\t})\n\t\t}\n\n\t\tif ($null -ne $programs) {\n\t\t\tif (-not ($ShowNulls.IsPresent)) {\n\t\t\t\t$programs = $programs.Where({\n\t\t\t\t\t-not [String]::IsNullOrEmpty(\n\t\t\t\t\t\t$_.UninstallString\n\t\t\t\t\t)\n\t\t\t\t})\n\t\t\t}\n\n\t\t\t$output = $programs.ForEach({\n\t\t\t\t[PSCustomObject]@{\n\t\t\t\t\tName = $_.DisplayName\n\t\t\t\t\tInstallLocation = $_.InstallLocation\n\t\t\t\t}\n\t\t\t})\n\n\t\t\tWrite-Output -InputObject $output\n\t\t}\n\t}\n}\n\nfunction denyApplicationHKLM($program){\n\n\t$body = $program -replace '[^=a-zA-Z0-9ğĞşŞıİüÜöÖçÇ_{}":,\\/ .()\\\\\\-+\\[\\]~]', ''\n\t$body = $body.replace("'",'"')\n\n\t$body = $body.replace("ğ",'g')\n\t$body = $body.replace("Ğ",'G')\n\t$body = $body.replace("ş",'s')\n\t$body = $body.replace("Ş",'S')\n\t$body = $body.replace("ı",'i')\n\t$body = $body.replace("İ",'I')\n\t$body = $body.replace("ü",'u')\n\t$body = $body.replace("Ü",'U')\n\t$body = $body.replace("ö",'o')\n\t$body = $body.replace("Ö",'O')\n\t$body = $body.replace("ç",'c')\n\t$body = $body.replace("Ç",'C')\n\n\t$split = $body -split "="\n\t\n\t$displayIcon = $split[ $split.Count - 1 ]\n\t\t\n\t$displayIcon = $displayIcon -split "\\\\"\n\n\t$displayIcon[ $displayIcon.Count - 1 ] = ''\n\n\t$displayIconString = ($displayIcon -join '\\') + '*.exe'\n\n\t$displayIconString = $displayIconString.replace('"','')\n\n\tmkdir C:\\tempPolicies\n\t$displayIconString\n\t(Get-ChildItem $displayIconString).fullname | Get-AppLockerFileInformation | New-AppLockerPolicy -RuleType Path -User '$[username]' -XML -Optimize > C:\\tempPolicies\\newPolicy.xml\n\n\t$nametmp=($displayIcon -join '\\') + '*'\n\t$name = 'Name="'+$nametmp+'"'\n\n\t$content = Get-Content -Path 'C:\\tempPolicies\\newPolicy.xml'\n\t$content = $content -replace 'Allow', 'Deny'\n\t$content = $content -replace 'Name="[^"]*"', $name\n\n\t$content | Set-Content -Path 'C:\\tempPolicies\\newPolicy.xml'\n\n\tInvoke-WebRequest $[repoURL]AppLocker.ps1 -OutFile C:\\ProgramData\\AppLocker.ps1 -UseBasicParsing\n\tInvoke-WebRequest $[repoURL]clear.xml -OutFile C:\\ProgramData\\clear.xml -UseBasicParsing \n\n\t$isUsed = Get-AppLockerPolicy -Effective | Get-AppLockerPolicyInfo -Verbose |Format-Table -Property EnforcementMode -AutoSize | Out-String\n\tif ( $isUsed -match "Enabled" ){\n\t\tGet-AppLockerPolicy -Effective -Xml > C:\\tempPolicies\\EffectiveAppLocker.xml  \n\t}else{\n\t\tInvoke-WebRequest $[repoURL]defaultRules.xml -OutFile C:\\ProgramData\\defaultRules.xml  -UseBasicParsing \n\t\tCopy-Item C:\\ProgramData\\defaultRules.xml C:\\tempPolicies\\\n\t}\n\n\tpowershell.exe -file C:\\ProgramData\\AppLocker.ps1 -merge -in C:\\tempPolicies -out C:\\tempPolicies\\mergedPolicy.xml\n\n\tsleep 3\n\n\tSet-AppLockerPolicy -XMLPolicy C:\\tempPolicies\\mergedPolicy.xml\n\n\tRemove-Item C:\\tempPolicies -Recurse -Force\n\n\tsc.exe config appidsvc start=auto\n\tStart-Service -Name "appidsvc"\n\n}\n\nfunction denyApplicationPath($program) {\n\n\t$body = $program -replace '[^=a-zA-Z0-9ğĞşŞıİüÜöÖçÇ_{}":,\\/ .()\\\\\\-+\\[\\]~]', ''\n\t$body = $body.replace("'",'"')\n\n\t$body = $body.replace("ğ",'g')\n\t$body = $body.replace("Ğ",'G')\n\t$body = $body.replace("ş",'s')\n\t$body = $body.replace("Ş",'S')\n\t$body = $body.replace("ı",'i')\n\t$body = $body.replace("İ",'I')\n\t$body = $body.replace("ü",'u')\n\t$body = $body.replace("Ü",'U')\n\t$body = $body.replace("ö",'o')\n\t$body = $body.replace("Ö",'O')\n\t$body = $body.replace("ç",'c')\n\t$body = $body.replace("Ç",'C')\n\n\t$denyApp = ($body -join '\\') + '*.exe'\n\t$displayIconString = $denyApp.replace('"','')\n\tmkdir C:\\tempPolicies\n\n\t$displayIconString  | New-AppLockerPolicy -RuleType Path -User '$[username]' -XML > C:\\tempPolicies\\newPolicy.xml\n\n\t$nametmp=($body -join '\\') + '*'\n\t$name = 'Name="'+$nametmp+'"'\n\n\t$content = Get-Content -Path 'C:\\tempPolicies\\newPolicy.xml'\n\t$content = $content -replace 'Allow', 'Deny'\n\t$content = $content -replace 'Name="[^"]*"', $name\n\n\t$content | Set-Content -Path 'C:\\tempPolicies\\newPolicy.xml'\n\n\tInvoke-WebRequest $[repoURL]AppLocker.ps1 -OutFile C:\\ProgramData\\AppLocker.ps1 -UseBasicParsing\n\tInvoke-WebRequest $[repoURL]clear.xml   -OutFile C:\\ProgramData\\clear.xml  -UseBasicParsing\n\n\t$isUsed = Get-AppLockerPolicy -Effective | Get-AppLockerPolicyInfo -Verbose |Format-Table -Property EnforcementMode -AutoSize | Out-String\n\n\tif ( $isUsed -match "Enabled" ){\n\t\tGet-AppLockerPolicy -Effective -Xml > C:\\tempPolicies\\EffectiveAppLocker.xml  \n\t}else{\n\t\tInvoke-WebRequest $[repoURL]defaultRules.xml -OutFile C:\\ProgramData\\defaultRules.xml\n\t\tCopy-Item C:\\ProgramData\\defaultRules.xml C:\\tempPolicies\\\n\t}\n\n\tpowershell.exe -file C:\\ProgramData\\AppLocker.ps1 -merge -in C:\\tempPolicies -out C:\\tempPolicies\\mergedPolicy.xml\n\n\tsleep 3\n\n\tSet-AppLockerPolicy -XMLPolicy C:\\tempPolicies\\mergedPolicy.xml\n\n\tRemove-Item C:\\tempPolicies -Recurse -Force\n\n\tsc.exe config appidsvc start=auto\n\tStart-Service -Name "appidsvc"\n\n}\n\n$program64 = (Get-ItemProperty HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Select DisplayName, DisplayVersion, Publisher, InstallDate, UninstallString, DisplayIcon | Select-String -Pattern '$[programName];')\n$program32 = (Get-ItemProperty HKLM:\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\* | Select DisplayName, DisplayVersion, Publisher, InstallDate, UninstallString, DisplayIcon | Select-String -Pattern '$[programName];')\n\n$Progs=(getPath)\n$ProgtoDeny=($Progs | Select-String '$[programName]')\n$ProgtoDenyPath=((($ProgtoDeny -split "=") -split '\\n')[-1] -split '}')[0]\n$ProgtoDenyPath\n\nif ($program64 -And $program64 -inotmatch "MsiExec")\n{\n\tdenyApplicationHKLM($program64)\n}\nelseif ($program32 -And $program32 -inotmatch "MsiExec")\n{\n\tdenyApplicationHKLM($program32)\n}\nelseif($ProgtoDenyPath)\n{\n\tdenyApplicationPath($ProgtoDenyPath)\n}\nelse\n{\n\techo 'Program bloklanamaz.'\n}	2021-08-30 20:56:02.865	f	Program engeller.	system	win_blockProgram	\N	powerShell	3
698	shutdown -s -f -t 60\n\n$Source = @"\nusing System;  \nusing System.Runtime.InteropServices;\n\nnamespace cekino.ProcessExtensions  \n{\n\tpublic static class ProcessExtensions\n\t{\n\t\tprivate const int CREATE_UNICODE_ENVIRONMENT = 0x00000400;\n\t\tprivate const int CREATE_NO_WINDOW = 0x08000000;\n\t\tprivate const int CREATE_NEW_CONSOLE = 0x00000010;\n\t\tprivate const uint INVALID_SESSION_ID = 0xFFFFFFFF;\n\t\tprivate static readonly IntPtr WTS_CURRENT_SERVER_HANDLE = IntPtr.Zero;\n\n\t\t[DllImport("advapi32.dll", EntryPoint = "CreateProcessAsUser", SetLastError = true, CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]\n\t\tprivate static extern bool CreateProcessAsUser(\n\t\t\tIntPtr hToken,\n\t\t\tString lpApplicationName,\n\t\t\tString lpCommandLine,\n\t\t\tIntPtr lpProcessAttributes,\n\t\t\tIntPtr lpThreadAttributes,\n\t\t\tbool bInheritHandle,\n\t\t\tuint dwCreationFlags,\n\t\t\tIntPtr lpEnvironment,\n\t\t\tString lpCurrentDirectory,\n\t\t\tref STARTUPINFO lpStartupInfo,\n\t\t\tout PROCESS_INFORMATION lpProcessInformation);\n\n\t\t[DllImport("advapi32.dll", EntryPoint = "DuplicateTokenEx")]\n\t\tprivate static extern bool DuplicateTokenEx(\n\t\t\tIntPtr ExistingTokenHandle,\n\t\t\tuint dwDesiredAccess,\n\t\t\tIntPtr lpThreadAttributes,\n\t\t\tint TokenType,\n\t\t\tint ImpersonationLevel,\n\t\t\tref IntPtr DuplicateTokenHandle);\n\n\t\t[DllImport("userenv.dll", SetLastError = true)]\n\t\tprivate static extern bool CreateEnvironmentBlock(ref IntPtr lpEnvironment, IntPtr hToken, bool bInherit);\n\n\t\t[DllImport("userenv.dll", SetLastError = true)]\n\t\t[return: MarshalAs(UnmanagedType.Bool)]\n\t\tprivate static extern bool DestroyEnvironmentBlock(IntPtr lpEnvironment);\n\n\t\t[DllImport("kernel32.dll", SetLastError = true)]\n\t\tprivate static extern bool CloseHandle(IntPtr hSnapshot);\n\n\t\t[DllImport("kernel32.dll")]\n\t\tprivate static extern uint WTSGetActiveConsoleSessionId();\n\n\t\t[DllImport("Wtsapi32.dll")]\n\t\tprivate static extern uint WTSQueryUserToken(uint SessionId, ref IntPtr phToken);\n\n\t\t[DllImport("wtsapi32.dll", SetLastError = true)]\n\t\tprivate static extern int WTSEnumerateSessions(\n\t\t\tIntPtr hServer,\n\t\t\tint Reserved,\n\t\t\tint Version,\n\t\t\tref IntPtr ppSessionInfo,\n\t\t\tref int pCount);\n\n\t\tprivate enum SW\n\t\t{\n\t\t\tSW_HIDE = 0,\n\t\t\tSW_SHOWNORMAL = 1,\n\t\t\tSW_NORMAL = 1,\n\t\t\tSW_SHOWMINIMIZED = 2,\n\t\t\tSW_SHOWMAXIMIZED = 3,\n\t\t\tSW_MAXIMIZE = 3,\n\t\t\tSW_SHOWNOACTIVATE = 4,\n\t\t\tSW_SHOW = 5,\n\t\t\tSW_MINIMIZE = 6,\n\t\t\tSW_SHOWMINNOACTIVE = 7,\n\t\t\tSW_SHOWNA = 8,\n\t\t\tSW_RESTORE = 9,\n\t\t\tSW_SHOWDEFAULT = 10,\n\t\t\tSW_MAX = 10\n\t\t}\n\n\t\tprivate enum WTS_CONNECTSTATE_CLASS\n\t\t{\n\t\t\tWTSActive,\n\t\t\tWTSConnected,\n\t\t\tWTSConnectQuery,\n\t\t\tWTSShadow,\n\t\t\tWTSDisconnected,\n\t\t\tWTSIdle,\n\t\t\tWTSListen,\n\t\t\tWTSReset,\n\t\t\tWTSDown,\n\t\t\tWTSInit\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct PROCESS_INFORMATION\n\t\t{\n\t\t\tpublic IntPtr hProcess;\n\t\t\tpublic IntPtr hThread;\n\t\t\tpublic uint dwProcessId;\n\t\t\tpublic uint dwThreadId;\n\t\t}\n\n\t\tprivate enum SECURITY_IMPERSONATION_LEVEL\n\t\t{\n\t\t\tSecurityAnonymous = 0,\n\t\t\tSecurityIdentification = 1,\n\t\t\tSecurityImpersonation = 2,\n\t\t\tSecurityDelegation = 3,\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct STARTUPINFO\n\t\t{\n\t\t\tpublic int cb;\n\t\t\tpublic String lpReserved;\n\t\t\tpublic String lpDesktop;\n\t\t\tpublic String lpTitle;\n\t\t\tpublic uint dwX;\n\t\t\tpublic uint dwY;\n\t\t\tpublic uint dwXSize;\n\t\t\tpublic uint dwYSize;\n\t\t\tpublic uint dwXCountChars;\n\t\t\tpublic uint dwYCountChars;\n\t\t\tpublic uint dwFillAttribute;\n\t\t\tpublic uint dwFlags;\n\t\t\tpublic short wShowWindow;\n\t\t\tpublic short cbReserved2;\n\t\t\tpublic IntPtr lpReserved2;\n\t\t\tpublic IntPtr hStdInput;\n\t\t\tpublic IntPtr hStdOutput;\n\t\t\tpublic IntPtr hStdError;\n\t\t}\n\n\t\tprivate enum TOKEN_TYPE\n\t\t{\n\t\t\tTokenPrimary = 1,\n\t\t\tTokenImpersonation = 2\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct WTS_SESSION_INFO\n\t\t{\n\t\t\tpublic readonly UInt32 SessionID;\n\n\t\t\t[MarshalAs(UnmanagedType.LPStr)]\n\t\t\tpublic readonly String pWinStationName;\n\n\t\t\tpublic readonly WTS_CONNECTSTATE_CLASS State;\n\t\t}\n\n\t\tprivate static bool GetSessionUserToken(ref IntPtr phUserToken)\n\t\t{   \n\t\t\tvar bResult = false;\n\t\t\tvar hImpersonationToken = IntPtr.Zero;\n\t\t\tvar activeSessionId = INVALID_SESSION_ID;\n\t\t\tvar pSessionInfo = IntPtr.Zero;\n\t\t\tvar sessionCount = 0;\n\n\t\t\tif (WTSEnumerateSessions(WTS_CURRENT_SERVER_HANDLE, 0, 1, ref pSessionInfo, ref sessionCount) != 0)\n\t\t\t{\n\t\t\t\tvar arrayElementSize = Marshal.SizeOf(typeof(WTS_SESSION_INFO));\n\t\t\t\tvar current = pSessionInfo;\n\n\t\t\t\tfor (var i = 0; i < sessionCount; i++)\n\t\t\t\t{\n\t\t\t\t\tvar si = (WTS_SESSION_INFO)Marshal.PtrToStructure((IntPtr)current, typeof(WTS_SESSION_INFO));\n\t\t\t\t\tcurrent += arrayElementSize;\n\n\t\t\t\t\tif (si.State == WTS_CONNECTSTATE_CLASS.WTSActive)\n\t\t\t\t\t{\n\t\t\t\t\t\tactiveSessionId = si.SessionID;\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\n\t\t\tif (activeSessionId == INVALID_SESSION_ID)\n\t\t\t{\n\t\t\t\tactiveSessionId = WTSGetActiveConsoleSessionId();\n\t\t\t}\n\n\t\t\tif (WTSQueryUserToken(activeSessionId, ref hImpersonationToken) != 0)\n\t\t\t{\n\t\t\t\t\n\t\t\t\tbResult = DuplicateTokenEx(hImpersonationToken, 0, IntPtr.Zero,\n\t\t\t\t\t(int)SECURITY_IMPERSONATION_LEVEL.SecurityImpersonation, (int)TOKEN_TYPE.TokenPrimary,\n\t\t\t\t\tref phUserToken);\n\n\t\t\t\tCloseHandle(hImpersonationToken);\n\t\t\t}\n\t\t\treturn bResult;\n\t\t}\n\n\t\tpublic static bool StartProcessAsCurrentUser(string appPath, string cmdLine = null, string workDir = null, bool visible = true)\n\t\t{\n\t\t\tvar hUserToken = IntPtr.Zero;\n\t\t\tvar startInfo = new STARTUPINFO();\n\t\t\tvar procInfo = new PROCESS_INFORMATION();\n\t\t\tvar pEnv = IntPtr.Zero;\n\t\t\tint iResultOfCreateProcessAsUser;\n\t\t\t \n\t\t\tGetSessionUserToken(ref hUserToken);\n\t\t\tstartInfo.cb = Marshal.SizeOf(typeof(STARTUPINFO));\n\n\t\t\ttry\n\t\t\t{\n\t\t\t\tuint dwCreationFlags = CREATE_UNICODE_ENVIRONMENT | (uint)(visible ? CREATE_NEW_CONSOLE : CREATE_NO_WINDOW);\n\t\t\t\tstartInfo.wShowWindow = (short)(visible ? SW.SW_SHOW : SW.SW_HIDE);\n\t\t\t\tstartInfo.lpDesktop = "winsta0\\\\default";\n\n\t\t\t\tif (!CreateEnvironmentBlock(ref pEnv, hUserToken, false))\n\t\t\t\t{\n\t\t\t\t\tthrow new Exception("StartProcessAsCurrentUser: CreateEnvironmentBlock failed.");\n\t\t\t\t}\n\n\t\t\t\tif (!CreateProcessAsUser(hUserToken,\n\t\t\t\t\tappPath, // Application Name\n\t\t\t\t\tcmdLine, // Command Line\n\t\t\t\t\tIntPtr.Zero,\n\t\t\t\t\tIntPtr.Zero,\n\t\t\t\t\tfalse,\n\t\t\t\t\tdwCreationFlags,\n\t\t\t\t\tpEnv,\n\t\t\t\t\tworkDir, // Working directory\n\t\t\t\t\tref startInfo,\n\t\t\t\t\tout procInfo))\n\t\t\t\t{\n\t\t\t\t\tthrow new Exception("StartProcessAsCurrentUser: CreateProcessAsUser failed.\\n");\n\t\t\t\t}\n\n\t\t\t\tiResultOfCreateProcessAsUser = Marshal.GetLastWin32Error();\n\t\t\t}\n\t\t\tfinally\n\t\t\t{\n\t\t\t\tCloseHandle(hUserToken);\n\t\t\t\tif (pEnv != IntPtr.Zero)\n\t\t\t\t{\n\t\t\t\t\tDestroyEnvironmentBlock(pEnv);\n\t\t\t\t}\n\t\t\t\tCloseHandle(procInfo.hThread);\n\t\t\t\tCloseHandle(procInfo.hProcess);\n\t\t\t}\n\t\t\treturn true;\n\t\t}\n\t}\n}\n\n"@\n\nAdd-Type -ReferencedAssemblies 'System', 'System.Runtime.InteropServices' -TypeDefinition $Source -Language CSharp \n\nfunction GetOpenBrowserString {\n\tif ( Test-Path 'C:\\Program Files (x86)\\Google\\Chrome\\Application' ){\n\t\treturn 'C:\\\\Program Files (x86)\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe'\n\t}elseif ( Test-Path 'C:\\Program Files\\Google\\Chrome\\Application' ){\n\t\treturn 'C:\\\\Program Files\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe'\n\t}elseif ( Test-Path 'C:\\Program Files (x86)\\Microsoft\\Edge\\Application' ){\n\t\treturn 'C:\\\\Program Files (x86)\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe'\n\t}elseif ( Test-Path 'C:\\Program Files\\Microsoft\\Edge\\Application' ){\n\t\treturn 'C:\\\\Program Files\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe'\n\t}else{\n\t\treturn 'C:\\\\Program Files\\\\Internet Explorer\\\\iexplore.exe'\n\t}\n}\n\nfunction GetActiveUser($type) { $activeUserTable = $(query session); $activeUser = ''; $iCount = 1; for( ; $iCount -le $activeUserTable.length - 1; $iCount++ ){ $currentRow = $activeUserTable[$iCount] -replace '\\s\\s+', ','; if ( $currentRow -like '*Etkin*' -Or $currentRow -like '*Active*'){ $currentRowItems = $currentRow.split(','); if ( $type -eq "user" ){ $activeUser = $currentRowItems[1]; }elseif ( $type -eq "id" ){ $activeUser = $currentRowItems[2]; } break; } } return $activeUser; }\n \n$BROWSER = GetOpenBrowserString\n\n$toRun=". http://172.16.21.233/staticPages/shutdown.html"\n\n[cekino.ProcessExtensions.ProcessExtensions]::StartProcessAsCurrentUser($BROWSER, $toRun)	2021-07-16 15:46:27.978	f	Bilgisayarı kapatır.	system	win_stopComputer	\N	powerShell	8
699	USERS=$(users)\nif [ -z "$USERS" ]\nthen\n\n   # curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"noActiveUser"}]}'\n   echo "The connection cannot be made because the session is closed."\n    \nelse\n\n    ADET=$(who | grep console | wc -l)\n\n    if [ "$ADET" -gt 1 ]\n    then\n   #     curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"multiActiveUser"}]}'\n        echo 'More than one active user exists on the client. Shared connection is not possible.';\n    else\n    kill $(lsof -t -i:5910)\n    /usr/local/share/client-gardiyan/apps/vnc/storepasswd $[textPassword] /usr/local/share/client-gardiyan/apps/vnc/.vncpass\n    chmod 755 /usr/local/share/client-gardiyan/apps/vnc/.vncpass\n\n#sudo -u $USERS sh -c "export DISPLAY=:0 && open -a Safari '$[mainDomain]permission/#/$[logID]/$[user]' < /dev/null > /dev/null 2>&1 &"\n  sudo -u $USERS /usr/local/share/client-gardiyan/bin/gardiyan-worker-service file /usr/local/share/client-gardiyan/apps/vnc/startConnection.py\n\n      curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"sessionOpened"}]}'\n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"status":true}]}'\n\n  #sudo -u $USERS nohup /usr/local/share/client-gardiyan/apps/vnc/OSXvnc-server -rfbport 5900 -donotloadproxy -rfbauth /usr/local/share/client-gardiyan/apps/vnc/.vncpass -restartonuserswitch N -UnicodeKeyboard 0 -keyboardLoading N -pressModsForKeys N -EventTap 3 -EventSource 2 -swapButtons -rendezvous Y > /dev/null 2>&1 &\n    fi\n\nfi	2024-02-21 14:29:24.103	f		system	dar_sharedConnectionUnauthorized	\N	macosBash	2
700	echo "install usb-storage /bin/true" > /etc/modprobe.d/usb-storage.conf; CMD=""; command_exists() { type "$1" &>/dev/null; }; if command_exists udevadm; then CMD="$(which udevadm) info -q all -n"; fi; if command_exists udevinfo; then CMD="$(which udevinfo) -q all -n"; fi; for disk in /dev/sd*; do DISK=$($CMD $disk | grep ID_BUS); if [[ "$DISK" == *usb ]]; then umount $disk; fi; done; sleep 5; whr=`whereis modprobe | wc -w`; if (( whr > 1 )); then modprobe -r uas > /dev/null; modprobe -r usb-storage > /dev/null; modprobe -r uas > /dev/null; modprobe -r usb-storage > /dev/null; modprobe usb-storage > /dev/null; else /usr/sbin/modprobe -r uas > /dev/null; /usr/sbin/modprobe -r usb-storage > /dev/null; /usr/sbin/modprobe -r uas > /dev/null; /usr/sbin/modprobe -r usb-storage > /dev/null; /usr/sbin/modprobe usb-storage > /dev/null; fi	2021-07-24 19:21:38.303	f	Donanım kısıt bilgisini günceller.	system	lin_hsc_usbstor_disable2	\N	bash	16
701	import speedtest\nimport json\nimport ssl\n\nssl._create_default_https_context = ssl._create_unverified_context\n\ns = speedtest.Speedtest()\ns.get_best_server()\nping = s.results.ping\ndownload = s.download()\nupload = s.upload()\n\nobj = {"download": float("{:.2f}".format(download / 1048576)), "upload": float("{:.2f}".format(upload / 1048576)), "ping": str(ping)+" ms", "ip": s.config["client"]["ip"], "hostedBy": s.config["client"]["isp"]}\nprint(json.dumps(obj))	2022-01-06 15:33:43.166	f	İnternet hız testi yapar.	system	dar_internetSpeedTest	\N	python	2
702	kill -9 $[pid]	2022-01-06 15:36:25.533	f	İşlemi durdurur.	system	dar_killProcess	\N	macosBash	1
703	open $[openPageURL]?messageCode=$[key]	2022-01-06 15:36:45.242	f	MacOS cihazlara mesaj gönderir.	system	dar_messageSend	\N	macosBash	1
704	launchctl start $[name]	2022-01-06 15:37:30.643	f	Servisi başlatır.	system	dar_serviceStart	\N	macosBash	1
705	launchctl $[type] -w /Library/LaunchDaemons/$[name]\n\n/*\n    type = load / unload\n*/	2022-01-06 15:37:52.861	f	Servisin başlangıç durumunu değiştirir.	system	dar_serviceStartType	\N	macosBash	1
706	launchctl stop $[name]	2022-01-06 15:38:13.261	f	Servisi durdurur.	system	dar_serviceStop	\N	macosBash	1
707	import speedtest\nimport json\nimport ssl\n\nssl._create_default_https_context = ssl._create_unverified_context\n\ns = speedtest.Speedtest()\ns.get_best_server()\nping = s.results.ping\ndownload = s.download()\nupload = s.upload()\n\nobj = {"download": float("{:.2f}".format(download / 1048576)), "upload": float("{:.2f}".format(upload / 1048576)), "ping": str(ping)+" ms", "ip": s.config["client"]["ip"], "hostedBy": s.config["client"]["isp"]}\nprint(json.dumps(obj))	2021-07-15 10:02:20.632	f	İnternet hız testi yapar.	system	win_internetSpeedTest	\N	python	11
708	shutdown -h +1\n	2022-01-06 15:39:02.309	f	Bilgisayarı kapatır.	system	dar_stopComputer	\N	macosBash	3
709	shutdown -r +1\n	2022-01-06 15:37:08.57	f	Bilgisayarı yeniden başlatır.	system	dar_rebootComputer	\N	macosBash	3
710	$u_app = Get-WmiObject -Class Win32_Product | Where-Object{ $_.Name -match "gardiyan" }\n$u_app.Uninstall()\n\nRemove-Item -Path "C:\\ProgramData\\Gardiyan_v2" -Recurse -Force	2024-01-30 17:15:43.169	f		system	uninstallAgent	\N	powerShell	1
711	USERS=$(users)\nif [ -z "$USERS" ]\nthen\n\n   # curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"noActiveUser"}]}'\n   echo "The connection cannot be made because the session is closed."\n    \nelse\n\n    ADET=$(who | grep console | wc -l)\n\n    if [ "$ADET" -gt 1 ]\n    then\n   #     curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"multiActiveUser"}]}'\n        echo 'More than one active user exists on the client. Shared connection is not possible.';\n    else\n    kill $(lsof -t -i:5910)\n    /usr/local/share/client-gardiyan/apps/vnc/storepasswd $[textPassword] /usr/local/share/client-gardiyan/apps/vnc/.vncpass\n    chmod 755 /usr/local/share/client-gardiyan/apps/vnc/.vncpass\n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"sessionOpened"}]}'\n    sudo -u $USERS sh -c "export DISPLAY=:0 && open -a Safari '$[mainDomain]permission/#/$[logID]/$[user]' < /dev/null > /dev/null 2>&1 &"\n  sudo -u $USERS /usr/local/share/client-gardiyan/bin/gardiyan-worker-service file /usr/local/share/client-gardiyan/apps/vnc/startConnection.py\n  #sudo -u $USERS nohup /usr/local/share/client-gardiyan/apps/vnc/OSXvnc-server -rfbport 5900 -donotloadproxy -rfbauth /usr/local/share/client-gardiyan/apps/vnc/.vncpass -restartonuserswitch N -UnicodeKeyboard 0 -keyboardLoading N -pressModsForKeys N -EventTap 3 -EventSource 2 -swapButtons -rendezvous Y > /dev/null 2>&1 &\n    fi\n\nfi	2022-01-06 15:38:35.9	f	Paylaşımlı bağlantı betiğidir.	system	dar_sharedConnection	\N	macosBash	6
712	$username = "$[domainusername]"\n$password = ConvertTo-SecureString "$[pass]" -AsPlainText -Force\n$credential = New-Object System.Management.Automation.PSCredential($username, $password)\n\nRename-Computer -ComputerName "$[oldhostname]" -NewName "$[hostname]" -DomainCredential $credential -Force 	2024-02-07 15:16:03.503	f	Bilgisayar ismini değiştirir.	system	win_changehostname	\N	powerShell	1
713	SESSIONS=$(loginctl list-sessions --no-legend)\n\nwhile read -r SESSION; do\n    SESSION_ID=$(echo "$SESSION" | awk '{print $1}')\n    USER=$(echo "$SESSION" | awk '{print $3}')\n    STATE=$(loginctl show-session "$SESSION_ID" -p State | awk -F= '{print $2}')\n    if [ "$STATE" = "active" ]; then\n        USERS="$USER"\n        break\n    fi\ndone <<< "$SESSIONS"\n\nif [ -z "$USERS" ]; then\n    echo "No active user session found"\n    exit 1\nfi\nDISPLAY_NUM=$(w -hs "$USER" | awk '{print $3}' | grep -Eo ":[0-9]+" | grep -Eo "[0-9]+")\n\nnextShared(){\n    killall x11vnc\n    systemctl disable x11vnc.service\n    systemctl stop x11vnc.service\n    rm -rf /lib/systemd/system/x11vnc.service\n    apt-get install -y curl\n    mkdir -p /etc/x11vnc\n    x11vnc --storepasswd $[textPassword] /etc/x11vnc/vncpwd\n    x11vnc --storepasswd $[textPassword] /etc/x11vnc.pass\n    chown $USERS /etc/x11vnc /etc/x11vnc/vncpwd /etc/x11vnc.pass\n    chmod 700 /etc/x11vnc /etc/x11vnc/vncpwd /etc/x11vnc.pass\n    echo '[Unit]' >> /lib/systemd/system/x11vnc.service\n    echo 'Description=Start x11vnc at startup.' >> /lib/systemd/system/x11vnc.service\n    echo 'After=multi-user.target' >> /lib/systemd/system/x11vnc.service\n    echo '[Service]' >> /lib/systemd/system/x11vnc.service\n    echo 'Type=simple' >> /lib/systemd/system/x11vnc.service\n    echo 'User='"$USERS" >> /lib/systemd/system/x11vnc.service\n    echo 'ExecStart=/usr/bin/x11vnc -xkb -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared -display :'$DISPLAY_NUM'' >> /lib/systemd/system/x11vnc.service\n    echo '[Install]' >> /lib/systemd/system/x11vnc.service\n    echo 'WantedBy=multi-user.target' >> /lib/systemd/system/x11vnc.service\n    if ! sudo grep -q "^$USERS ALL=(ALL) NOPASSWD: /bin/systemctl start x11vnc.service$" /etc/sudoers; then\n    echo "$USERS ALL=(ALL) NOPASSWD: /bin/systemctl start x11vnc.service" | sudo tee -a /etc/sudoers >/dev/null\n    fi\n    systemctl daemon-reload\n    sudo -k\n    sudo systemctl start x11vnc.service\n\n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"sessionOpened"}]}'\n    \n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"status":true}]}'\n\n}\n\ninstallShared(){\n#    sudo sed -i '/^KillMode=none/ { s//KillMode=mixed/; :a; n; ba; }' /lib/systemd/system/plymouth-start.service\n    systemctl stop x11vnc.service\n    systemctl disabled x11vnc.service\n    rm -rf /lib/systemd/system/x11vnc.service\n    rm -rf /etc/x11vnc\n    systemctl reset-failed\n    systemctl daemon-reload\n    apt-get install -y curl\n    apt-get install -y x11vnc\n    mkdir -p /etc/x11vnc\n    x11vnc --storepasswd $[textPassword] /etc/x11vnc/vncpwd\n    x11vnc --storepasswd $[textPassword] /etc/x11vnc.pass\n    chown $USERS /etc/x11vnc /etc/x11vnc/vncpwd /etc/x11vnc.pass\n    chmod 700 /etc/x11vnc /etc/x11vnc/vncpwd /etc/x11vnc.pass\n    echo '[Unit]' >> /lib/systemd/system/x11vnc.service\n    echo 'Description=Start x11vnc at startup.' >> /lib/systemd/system/x11vnc.service\n    echo 'After=multi-user.target' >> /lib/systemd/system/x11vnc.service\n    echo '[Service]' >> /lib/systemd/system/x11vnc.service\n    echo 'Type=simple' >> /lib/systemd/system/x11vnc.service\n    echo 'User='"$USERS" >> /lib/systemd/system/x11vnc.service\n    echo 'ExecStart=/usr/bin/x11vnc -xkb -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared -display :'$DISPLAY_NUM'' >> /lib/systemd/system/x11vnc.service\n    echo '[Install]' >> /lib/systemd/system/x11vnc.service\n    echo 'WantedBy=multi-user.target' >> /lib/systemd/system/x11vnc.service\n    systemctl enable x11vnc.service\n    if ! sudo grep -q "^$USERS ALL=(ALL) NOPASSWD: /bin/systemctl start x11vnc.service$" /etc/sudoers; then\n  echo "$USERS ALL=(ALL) NOPASSWD: /bin/systemctl start x11vnc.service" | sudo tee -a /etc/sudoers >/dev/null\nfi\n    systemctl daemon-reload\n    sudo -k\n    sudo systemctl start x11vnc.service\n    sleep 3\n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"sessionOpened"}]}'\n    \n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"status":true}]}'\n    echo "Sign in, request screen popped up."\n\n}\n\nif [ -z "$USERS" ]\nthen\n\n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"noActiveUser"}]}'\n   echo "The connection cannot be made because the session is closed."\n    \nelse\n\n    ADET=$(who | grep :0 | wc -l)\n\n    if [ "$ADET" -gt 1 ]\n    then\n        \n        curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"multiActiveUser"}]}'\n        echo 'More than one active user exists on the client. Shared connection is not possible.';\n        \n    else\n\n        SERVICE_CONTROL=$(which x11vnc | wc -l)\n        if [ "$SERVICE_CONTROL" -eq 0 ]\n        then\n            # kurulu değil\n            installShared\n        else\n            # kurulu.\n            nextShared\n        fi\n\n    fi\n\nfi	2024-02-21 14:29:57.555	f		system	lin_sharedConnectionUnauthorized	\N	bash	1
714	shutdown -r -f -t 60\n\n$Source = @"\nusing System;  \nusing System.Runtime.InteropServices;\n\nnamespace cekino.ProcessExtensions  \n{\n\tpublic static class ProcessExtensions\n\t{\n\t\tprivate const int CREATE_UNICODE_ENVIRONMENT = 0x00000400;\n\t\tprivate const int CREATE_NO_WINDOW = 0x08000000;\n\t\tprivate const int CREATE_NEW_CONSOLE = 0x00000010;\n\t\tprivate const uint INVALID_SESSION_ID = 0xFFFFFFFF;\n\t\tprivate static readonly IntPtr WTS_CURRENT_SERVER_HANDLE = IntPtr.Zero;\n\n\t\t[DllImport("advapi32.dll", EntryPoint = "CreateProcessAsUser", SetLastError = true, CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]\n\t\tprivate static extern bool CreateProcessAsUser(\n\t\t\tIntPtr hToken,\n\t\t\tString lpApplicationName,\n\t\t\tString lpCommandLine,\n\t\t\tIntPtr lpProcessAttributes,\n\t\t\tIntPtr lpThreadAttributes,\n\t\t\tbool bInheritHandle,\n\t\t\tuint dwCreationFlags,\n\t\t\tIntPtr lpEnvironment,\n\t\t\tString lpCurrentDirectory,\n\t\t\tref STARTUPINFO lpStartupInfo,\n\t\t\tout PROCESS_INFORMATION lpProcessInformation);\n\n\t\t[DllImport("advapi32.dll", EntryPoint = "DuplicateTokenEx")]\n\t\tprivate static extern bool DuplicateTokenEx(\n\t\t\tIntPtr ExistingTokenHandle,\n\t\t\tuint dwDesiredAccess,\n\t\t\tIntPtr lpThreadAttributes,\n\t\t\tint TokenType,\n\t\t\tint ImpersonationLevel,\n\t\t\tref IntPtr DuplicateTokenHandle);\n\n\t\t[DllImport("userenv.dll", SetLastError = true)]\n\t\tprivate static extern bool CreateEnvironmentBlock(ref IntPtr lpEnvironment, IntPtr hToken, bool bInherit);\n\n\t\t[DllImport("userenv.dll", SetLastError = true)]\n\t\t[return: MarshalAs(UnmanagedType.Bool)]\n\t\tprivate static extern bool DestroyEnvironmentBlock(IntPtr lpEnvironment);\n\n\t\t[DllImport("kernel32.dll", SetLastError = true)]\n\t\tprivate static extern bool CloseHandle(IntPtr hSnapshot);\n\n\t\t[DllImport("kernel32.dll")]\n\t\tprivate static extern uint WTSGetActiveConsoleSessionId();\n\n\t\t[DllImport("Wtsapi32.dll")]\n\t\tprivate static extern uint WTSQueryUserToken(uint SessionId, ref IntPtr phToken);\n\n\t\t[DllImport("wtsapi32.dll", SetLastError = true)]\n\t\tprivate static extern int WTSEnumerateSessions(\n\t\t\tIntPtr hServer,\n\t\t\tint Reserved,\n\t\t\tint Version,\n\t\t\tref IntPtr ppSessionInfo,\n\t\t\tref int pCount);\n\n\t\tprivate enum SW\n\t\t{\n\t\t\tSW_HIDE = 0,\n\t\t\tSW_SHOWNORMAL = 1,\n\t\t\tSW_NORMAL = 1,\n\t\t\tSW_SHOWMINIMIZED = 2,\n\t\t\tSW_SHOWMAXIMIZED = 3,\n\t\t\tSW_MAXIMIZE = 3,\n\t\t\tSW_SHOWNOACTIVATE = 4,\n\t\t\tSW_SHOW = 5,\n\t\t\tSW_MINIMIZE = 6,\n\t\t\tSW_SHOWMINNOACTIVE = 7,\n\t\t\tSW_SHOWNA = 8,\n\t\t\tSW_RESTORE = 9,\n\t\t\tSW_SHOWDEFAULT = 10,\n\t\t\tSW_MAX = 10\n\t\t}\n\n\t\tprivate enum WTS_CONNECTSTATE_CLASS\n\t\t{\n\t\t\tWTSActive,\n\t\t\tWTSConnected,\n\t\t\tWTSConnectQuery,\n\t\t\tWTSShadow,\n\t\t\tWTSDisconnected,\n\t\t\tWTSIdle,\n\t\t\tWTSListen,\n\t\t\tWTSReset,\n\t\t\tWTSDown,\n\t\t\tWTSInit\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct PROCESS_INFORMATION\n\t\t{\n\t\t\tpublic IntPtr hProcess;\n\t\t\tpublic IntPtr hThread;\n\t\t\tpublic uint dwProcessId;\n\t\t\tpublic uint dwThreadId;\n\t\t}\n\n\t\tprivate enum SECURITY_IMPERSONATION_LEVEL\n\t\t{\n\t\t\tSecurityAnonymous = 0,\n\t\t\tSecurityIdentification = 1,\n\t\t\tSecurityImpersonation = 2,\n\t\t\tSecurityDelegation = 3,\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct STARTUPINFO\n\t\t{\n\t\t\tpublic int cb;\n\t\t\tpublic String lpReserved;\n\t\t\tpublic String lpDesktop;\n\t\t\tpublic String lpTitle;\n\t\t\tpublic uint dwX;\n\t\t\tpublic uint dwY;\n\t\t\tpublic uint dwXSize;\n\t\t\tpublic uint dwYSize;\n\t\t\tpublic uint dwXCountChars;\n\t\t\tpublic uint dwYCountChars;\n\t\t\tpublic uint dwFillAttribute;\n\t\t\tpublic uint dwFlags;\n\t\t\tpublic short wShowWindow;\n\t\t\tpublic short cbReserved2;\n\t\t\tpublic IntPtr lpReserved2;\n\t\t\tpublic IntPtr hStdInput;\n\t\t\tpublic IntPtr hStdOutput;\n\t\t\tpublic IntPtr hStdError;\n\t\t}\n\n\t\tprivate enum TOKEN_TYPE\n\t\t{\n\t\t\tTokenPrimary = 1,\n\t\t\tTokenImpersonation = 2\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct WTS_SESSION_INFO\n\t\t{\n\t\t\tpublic readonly UInt32 SessionID;\n\n\t\t\t[MarshalAs(UnmanagedType.LPStr)]\n\t\t\tpublic readonly String pWinStationName;\n\n\t\t\tpublic readonly WTS_CONNECTSTATE_CLASS State;\n\t\t}\n\n\t\tprivate static bool GetSessionUserToken(ref IntPtr phUserToken)\n\t\t{   \n\t\t\tvar bResult = false;\n\t\t\tvar hImpersonationToken = IntPtr.Zero;\n\t\t\tvar activeSessionId = INVALID_SESSION_ID;\n\t\t\tvar pSessionInfo = IntPtr.Zero;\n\t\t\tvar sessionCount = 0;\n\n\t\t\tif (WTSEnumerateSessions(WTS_CURRENT_SERVER_HANDLE, 0, 1, ref pSessionInfo, ref sessionCount) != 0)\n\t\t\t{\n\t\t\t\tvar arrayElementSize = Marshal.SizeOf(typeof(WTS_SESSION_INFO));\n\t\t\t\tvar current = pSessionInfo;\n\n\t\t\t\tfor (var i = 0; i < sessionCount; i++)\n\t\t\t\t{\n\t\t\t\t\tvar si = (WTS_SESSION_INFO)Marshal.PtrToStructure((IntPtr)current, typeof(WTS_SESSION_INFO));\n\t\t\t\t\tcurrent += arrayElementSize;\n\n\t\t\t\t\tif (si.State == WTS_CONNECTSTATE_CLASS.WTSActive)\n\t\t\t\t\t{\n\t\t\t\t\t\tactiveSessionId = si.SessionID;\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t}\n\n\t\t\tif (activeSessionId == INVALID_SESSION_ID)\n\t\t\t{\n\t\t\t\tactiveSessionId = WTSGetActiveConsoleSessionId();\n\t\t\t}\n\n\t\t\tif (WTSQueryUserToken(activeSessionId, ref hImpersonationToken) != 0)\n\t\t\t{\n\t\t\t\t\n\t\t\t\tbResult = DuplicateTokenEx(hImpersonationToken, 0, IntPtr.Zero,\n\t\t\t\t\t(int)SECURITY_IMPERSONATION_LEVEL.SecurityImpersonation, (int)TOKEN_TYPE.TokenPrimary,\n\t\t\t\t\tref phUserToken);\n\n\t\t\t\tCloseHandle(hImpersonationToken);\n\t\t\t}\n\t\t\treturn bResult;\n\t\t}\n\n\t\tpublic static bool StartProcessAsCurrentUser(string appPath, string cmdLine = null, string workDir = null, bool visible = true)\n\t\t{\n\t\t\tvar hUserToken = IntPtr.Zero;\n\t\t\tvar startInfo = new STARTUPINFO();\n\t\t\tvar procInfo = new PROCESS_INFORMATION();\n\t\t\tvar pEnv = IntPtr.Zero;\n\t\t\tint iResultOfCreateProcessAsUser;\n\t\t\t \n\t\t\tGetSessionUserToken(ref hUserToken);\n\t\t\tstartInfo.cb = Marshal.SizeOf(typeof(STARTUPINFO));\n\n\t\t\ttry\n\t\t\t{\n\t\t\t\tuint dwCreationFlags = CREATE_UNICODE_ENVIRONMENT | (uint)(visible ? CREATE_NEW_CONSOLE : CREATE_NO_WINDOW);\n\t\t\t\tstartInfo.wShowWindow = (short)(visible ? SW.SW_SHOW : SW.SW_HIDE);\n\t\t\t\tstartInfo.lpDesktop = "winsta0\\\\default";\n\n\t\t\t\tif (!CreateEnvironmentBlock(ref pEnv, hUserToken, false))\n\t\t\t\t{\n\t\t\t\t\tthrow new Exception("StartProcessAsCurrentUser: CreateEnvironmentBlock failed.");\n\t\t\t\t}\n\n\t\t\t\tif (!CreateProcessAsUser(hUserToken,\n\t\t\t\t\tappPath, // Application Name\n\t\t\t\t\tcmdLine, // Command Line\n\t\t\t\t\tIntPtr.Zero,\n\t\t\t\t\tIntPtr.Zero,\n\t\t\t\t\tfalse,\n\t\t\t\t\tdwCreationFlags,\n\t\t\t\t\tpEnv,\n\t\t\t\t\tworkDir, // Working directory\n\t\t\t\t\tref startInfo,\n\t\t\t\t\tout procInfo))\n\t\t\t\t{\n\t\t\t\t\tthrow new Exception("StartProcessAsCurrentUser: CreateProcessAsUser failed.\\n");\n\t\t\t\t}\n\n\t\t\t\tiResultOfCreateProcessAsUser = Marshal.GetLastWin32Error();\n\t\t\t}\n\t\t\tfinally\n\t\t\t{\n\t\t\t\tCloseHandle(hUserToken);\n\t\t\t\tif (pEnv != IntPtr.Zero)\n\t\t\t\t{\n\t\t\t\t\tDestroyEnvironmentBlock(pEnv);\n\t\t\t\t}\n\t\t\t\tCloseHandle(procInfo.hThread);\n\t\t\t\tCloseHandle(procInfo.hProcess);\n\t\t\t}\n\t\t\treturn true;\n\t\t}\n\t}\n}\n\n"@\n\nAdd-Type -ReferencedAssemblies 'System', 'System.Runtime.InteropServices' -TypeDefinition $Source -Language CSharp \n\nfunction GetOpenBrowserString {\n\tif ( Test-Path 'C:\\Program Files (x86)\\Google\\Chrome\\Application' ){\n\t\treturn 'C:\\\\Program Files (x86)\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe'\n\t}elseif ( Test-Path 'C:\\Program Files\\Google\\Chrome\\Application' ){\n\t\treturn 'C:\\\\Program Files\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe'\n\t}elseif ( Test-Path 'C:\\Program Files (x86)\\Microsoft\\Edge\\Application' ){\n\t\treturn 'C:\\\\Program Files (x86)\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe'\n\t}elseif ( Test-Path 'C:\\Program Files\\Microsoft\\Edge\\Application' ){\n\t\treturn 'C:\\\\Program Files\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe'\n\t}else{\n\t\treturn 'C:\\\\Program Files\\\\Internet Explorer\\\\iexplore.exe'\n\t}\n}\n\nfunction GetActiveUser($type) { $activeUserTable = $(query session); $activeUser = ''; $iCount = 1; for( ; $iCount -le $activeUserTable.length - 1; $iCount++ ){ $currentRow = $activeUserTable[$iCount] -replace '\\s\\s+', ','; if ( $currentRow -like '*Etkin*' -Or $currentRow -like '*Active*'){ $currentRowItems = $currentRow.split(','); if ( $type -eq "user" ){ $activeUser = $currentRowItems[1]; }elseif ( $type -eq "id" ){ $activeUser = $currentRowItems[2]; } break; } } return $activeUser; }\n \n$BROWSER = GetOpenBrowserString\n\n$toRun=". http://172.16.21.233/staticPages/reboot.html"\n\n[cekino.ProcessExtensions.ProcessExtensions]::StartProcessAsCurrentUser($BROWSER, $toRun)	2021-07-16 15:50:52.379	f	Bilgisayarı yeniden başlatır.	system	win_rebootComputer	\N	powerShell	11
715	$Source = @"\nusing System;  \nusing System.Runtime.InteropServices;\n\nnamespace cekino.ProcessExtensions  \n{\n\tpublic static class ProcessExtensions\n\t{\n\t\t#region Win32 Constants\n\n\t\tprivate const int CREATE_UNICODE_ENVIRONMENT = 0x00000400;\n\t\tprivate const int CREATE_NO_WINDOW = 0x08000000;\n\n\t\tprivate const int CREATE_NEW_CONSOLE = 0x00000010;\n\n\t\tprivate const uint INVALID_SESSION_ID = 0xFFFFFFFF;\n\t\tprivate static readonly IntPtr WTS_CURRENT_SERVER_HANDLE = IntPtr.Zero;\n\n\t\t#endregion\n\n\t\t#region DllImports\n\n\t\t[DllImport("advapi32.dll", EntryPoint = "CreateProcessAsUser", SetLastError = true, CharSet = CharSet.Ansi, CallingConvention = CallingConvention.StdCall)]\n\t\tprivate static extern bool CreateProcessAsUser(\n\t\t\tIntPtr hToken,\n\t\t\tString lpApplicationName,\n\t\t\tString lpCommandLine,\n\t\t\tIntPtr lpProcessAttributes,\n\t\t\tIntPtr lpThreadAttributes,\n\t\t\tbool bInheritHandle,\n\t\t\tuint dwCreationFlags,\n\t\t\tIntPtr lpEnvironment,\n\t\t\tString lpCurrentDirectory,\n\t\t\tref STARTUPINFO lpStartupInfo,\n\t\t\tout PROCESS_INFORMATION lpProcessInformation);\n\n\t\t[DllImport("advapi32.dll", EntryPoint = "DuplicateTokenEx")]\n\t\tprivate static extern bool DuplicateTokenEx(\n\t\t\tIntPtr ExistingTokenHandle,\n\t\t\tuint dwDesiredAccess,\n\t\t\tIntPtr lpThreadAttributes,\n\t\t\tint TokenType,\n\t\t\tint ImpersonationLevel,\n\t\t\tref IntPtr DuplicateTokenHandle);\n\n\t\t[DllImport("userenv.dll", SetLastError = true)]\n\t\tprivate static extern bool CreateEnvironmentBlock(ref IntPtr lpEnvironment, IntPtr hToken, bool bInherit);\n\n\t\t[DllImport("userenv.dll", SetLastError = true)]\n\t\t[return: MarshalAs(UnmanagedType.Bool)]\n\t\tprivate static extern bool DestroyEnvironmentBlock(IntPtr lpEnvironment);\n\n\t\t[DllImport("kernel32.dll", SetLastError = true)]\n\t\tprivate static extern bool CloseHandle(IntPtr hSnapshot);\n\n\t\t[DllImport("kernel32.dll")]\n\t\tprivate static extern uint WTSGetActiveConsoleSessionId();\n\n\t\t[DllImport("Wtsapi32.dll")]\n\t\tprivate static extern uint WTSQueryUserToken(uint SessionId, ref IntPtr phToken);\n\n\t\t[DllImport("wtsapi32.dll", SetLastError = true)]\n\t\tprivate static extern int WTSEnumerateSessions(\n\t\t\tIntPtr hServer,\n\t\t\tint Reserved,\n\t\t\tint Version,\n\t\t\tref IntPtr ppSessionInfo,\n\t\t\tref int pCount);\n\n\t\t#endregion\n\n\t\t#region Win32 Structs\n\n\t\tprivate enum SW\n\t\t{\n\t\t\tSW_HIDE = 0,\n\t\t\tSW_SHOWNORMAL = 1,\n\t\t\tSW_NORMAL = 1,\n\t\t\tSW_SHOWMINIMIZED = 2,\n\t\t\tSW_SHOWMAXIMIZED = 3,\n\t\t\tSW_MAXIMIZE = 3,\n\t\t\tSW_SHOWNOACTIVATE = 4,\n\t\t\tSW_SHOW = 5,\n\t\t\tSW_MINIMIZE = 6,\n\t\t\tSW_SHOWMINNOACTIVE = 7,\n\t\t\tSW_SHOWNA = 8,\n\t\t\tSW_RESTORE = 9,\n\t\t\tSW_SHOWDEFAULT = 10,\n\t\t\tSW_MAX = 10\n\t\t}\n\n\t\tprivate enum WTS_CONNECTSTATE_CLASS\n\t\t{\n\t\t\tWTSActive,\n\t\t\tWTSConnected,\n\t\t\tWTSConnectQuery,\n\t\t\tWTSShadow,\n\t\t\tWTSDisconnected,\n\t\t\tWTSIdle,\n\t\t\tWTSListen,\n\t\t\tWTSReset,\n\t\t\tWTSDown,\n\t\t\tWTSInit\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct PROCESS_INFORMATION\n\t\t{\n\t\t\tpublic IntPtr hProcess;\n\t\t\tpublic IntPtr hThread;\n\t\t\tpublic uint dwProcessId;\n\t\t\tpublic uint dwThreadId;\n\t\t}\n\n\t\tprivate enum SECURITY_IMPERSONATION_LEVEL\n\t\t{\n\t\t\tSecurityAnonymous = 0,\n\t\t\tSecurityIdentification = 1,\n\t\t\tSecurityImpersonation = 2,\n\t\t\tSecurityDelegation = 3,\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct STARTUPINFO\n\t\t{\n\t\t\tpublic int cb;\n\t\t\tpublic String lpReserved;\n\t\t\tpublic String lpDesktop;\n\t\t\tpublic String lpTitle;\n\t\t\tpublic uint dwX;\n\t\t\tpublic uint dwY;\n\t\t\tpublic uint dwXSize;\n\t\t\tpublic uint dwYSize;\n\t\t\tpublic uint dwXCountChars;\n\t\t\tpublic uint dwYCountChars;\n\t\t\tpublic uint dwFillAttribute;\n\t\t\tpublic uint dwFlags;\n\t\t\tpublic short wShowWindow;\n\t\t\tpublic short cbReserved2;\n\t\t\tpublic IntPtr lpReserved2;\n\t\t\tpublic IntPtr hStdInput;\n\t\t\tpublic IntPtr hStdOutput;\n\t\t\tpublic IntPtr hStdError;\n\t\t}\n\n\t\tprivate enum TOKEN_TYPE\n\t\t{\n\t\t\tTokenPrimary = 1,\n\t\t\tTokenImpersonation = 2\n\t\t}\n\n\t\t[StructLayout(LayoutKind.Sequential)]\n\t\tprivate struct WTS_SESSION_INFO\n\t\t{\n\t\t\tpublic readonly UInt32 SessionID;\n\n\t\t\t[MarshalAs(UnmanagedType.LPStr)]\n\t\t\tpublic readonly String pWinStationName;\n\n\t\t\tpublic readonly WTS_CONNECTSTATE_CLASS State;\n\t\t}\n\n\t\t#endregion\n\n\t\t// Gets the user token from the currently active session\n\t\tprivate static bool GetSessionUserToken(ref IntPtr phUserToken)\n\t\t{   \n\t\t\t//Console.WriteLine("GetSessionUserToken:");\n\t\t\tvar bResult = false;\n\t\t\tvar hImpersonationToken = IntPtr.Zero;\n\t\t\tvar activeSessionId = INVALID_SESSION_ID;\n\t\t\tvar pSessionInfo = IntPtr.Zero;\n\t\t\tvar sessionCount = 0;\n\n\t\t\t// Get a handle to the user access token for the current active session.\n\t\t\tif (WTSEnumerateSessions(WTS_CURRENT_SERVER_HANDLE, 0, 1, ref pSessionInfo, ref sessionCount) != 0)\n\t\t\t{\n\t\t\t\tvar arrayElementSize = Marshal.SizeOf(typeof(WTS_SESSION_INFO));\n\t\t\t\tvar current = pSessionInfo;\n\n\t\t\t\tfor (var i = 0; i < sessionCount; i++)\n\t\t\t\t{\n\t\t\t\t\tvar si = (WTS_SESSION_INFO)Marshal.PtrToStructure((IntPtr)current, typeof(WTS_SESSION_INFO));\n\t\t\t\t\tcurrent += arrayElementSize;\n\n\t\t\t\t\tif (si.State == WTS_CONNECTSTATE_CLASS.WTSActive)\n\t\t\t\t\t{\n\t\t\t\t\t\tactiveSessionId = si.SessionID;\n\t\t\t\t\t}\n\t\t\t\t}\n\t\t\t\t//Console.WriteLine(activeSessionId);\n\t\t\t}\n\n\t\t\t// If enumerating did not work, fall back to the old method\n\t\t\tif (activeSessionId == INVALID_SESSION_ID)\n\t\t\t{\n\t\t\t\tactiveSessionId = WTSGetActiveConsoleSessionId();\n\t\t\t}\n\n\t\t\tif (WTSQueryUserToken(activeSessionId, ref hImpersonationToken) != 0)\n\t\t\t{\n\t\t\t\t\n\t\t\t\t// Convert the impersonation token to a primary token\n\t\t\t\tbResult = DuplicateTokenEx(hImpersonationToken, 0, IntPtr.Zero,\n\t\t\t\t\t(int)SECURITY_IMPERSONATION_LEVEL.SecurityImpersonation, (int)TOKEN_TYPE.TokenPrimary,\n\t\t\t\t\tref phUserToken);\n\n\t\t\t\tCloseHandle(hImpersonationToken);\n\t\t\t}\n\t\t\treturn bResult;\n\t\t}\n\n\t\tpublic static bool StartProcessAsCurrentUser(string appPath, string cmdLine = null, string workDir = null, bool visible = true)\n\t\t{\n\t\t\t//Console.WriteLine("StartProcessAsCurrentUser:");\n\t\t\tvar hUserToken = IntPtr.Zero;\n\t\t\tvar startInfo = new STARTUPINFO();\n\t\t\tvar procInfo = new PROCESS_INFORMATION();\n\t\t\tvar pEnv = IntPtr.Zero;\n\t\t\tint iResultOfCreateProcessAsUser;\n\t\t\t \n\t\t\tGetSessionUserToken(ref hUserToken);\n\t\t\tstartInfo.cb = Marshal.SizeOf(typeof(STARTUPINFO));\n\n\t\t\ttry\n\t\t\t{\n\n\t\t\t\tuint dwCreationFlags = CREATE_UNICODE_ENVIRONMENT | (uint)(visible ? CREATE_NEW_CONSOLE : CREATE_NO_WINDOW);\n\t\t\t\tstartInfo.wShowWindow = (short)(visible ? SW.SW_SHOW : SW.SW_HIDE);\n\t\t\t\tstartInfo.lpDesktop = "winsta0\\\\default";\n\n\t\t\t\tif (!CreateEnvironmentBlock(ref pEnv, hUserToken, false))\n\t\t\t\t{\n\t\t\t\t\tthrow new Exception("StartProcessAsCurrentUser: CreateEnvironmentBlock failed.");\n\t\t\t\t}\n\n\t\t\t\tif (!CreateProcessAsUser(hUserToken,\n\t\t\t\t\tappPath, // Application Name\n\t\t\t\t\tcmdLine, // Command Line\n\t\t\t\t\tIntPtr.Zero,\n\t\t\t\t\tIntPtr.Zero,\n\t\t\t\t\tfalse,\n\t\t\t\t\tdwCreationFlags,\n\t\t\t\t\tpEnv,\n\t\t\t\t\tworkDir, // Working directory\n\t\t\t\t\tref startInfo,\n\t\t\t\t\tout procInfo))\n\t\t\t\t{\n\t\t\t\t\tthrow new Exception("StartProcessAsCurrentUser: CreateProcessAsUser failed.\\n");\n\t\t\t\t}\n\n\t\t\t\tiResultOfCreateProcessAsUser = Marshal.GetLastWin32Error();\n\t\t\t}\n\t\t\tfinally\n\t\t\t{\n\t\t\t\tCloseHandle(hUserToken);\n\t\t\t\tif (pEnv != IntPtr.Zero)\n\t\t\t\t{\n\t\t\t\t\tDestroyEnvironmentBlock(pEnv);\n\t\t\t\t}\n\t\t\t\tCloseHandle(procInfo.hThread);\n\t\t\t\tCloseHandle(procInfo.hProcess);\n\t\t\t}\n\t\t\treturn true;\n\t\t}\n\t}\n}\n"@\n\nAdd-Type -ReferencedAssemblies 'System', 'System.Runtime.InteropServices' -TypeDefinition $Source -Language CSharp\n\nfunction GetOpenBrowserString {\n \tif ( Test-Path 'C:\\Program Files (x86)\\Google\\Chrome\\Application' ){\n \t\treturn 'C:\\\\Program Files (x86)\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe'\n \t}elseif ( Test-Path 'C:\\Program Files\\Google\\Chrome\\Application' ){\n \t\treturn 'C:\\\\Program Files\\\\Google\\\\Chrome\\\\Application\\\\chrome.exe'\n \t}elseif ( Test-Path 'C:\\Program Files (x86)\\Microsoft\\Edge\\Application' ){\n \t\treturn 'C:\\\\Program Files (x86)\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe'\n \t}elseif ( Test-Path 'C:\\Program Files\\Microsoft\\Edge\\Application' ){\n \t\treturn 'C:\\\\Program Files\\\\Microsoft\\\\Edge\\\\Application\\\\msedge.exe'\n \t}else{\n \t\treturn 'C:\\\\Program Files\\\\Internet Explorer\\\\iexplore.exe'\n \t}\n}\n\nfunction GetActiveUser($type) { $activeUserTable = $(query session); $activeUser = ''; $iCount = 1; for( ; $iCount -le $activeUserTable.length - 1; $iCount++ ){ $currentRow = $activeUserTable[$iCount] -replace '\\s\\s+', ','; if ( $currentRow -like '*Etkin*' -Or $currentRow -like '*Active*'){ $currentRowItems = $currentRow.split(','); if ( $type -eq "user" ){ $activeUser = $currentRowItems[1]; }elseif ( $type -eq "id" ){ $activeUser = $currentRowItems[2]; } break; } } return $activeUser; }\n\nfunction installShared {\n    msiexec.exe /i C:\\ProgramData\\gardiyan_v2\\apps\\vnc_setupx64.msi /quiet /norestart /L*E $env:temp\\exampleLogVNC.log ADDLOCAL="Server" VIEWER_ASSOCIATE_VNC_EXTENSION=1 SERVER_REGISTER_AS_SERVICE=1 SERVER_ADD_FIREWALL_EXCEPTION=1 VIEWER_ADD_FIREWALL_EXCEPTION=1 SERVER_ALLOW_SAS=1 SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=d448c98b SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=d448c98b SET_RUNCONTROLINTERFACE=0 VALUE_OF_RUNCONTROLINTERFACE=0\n\topenShared\n}\n\nfunction openShared {\n    New-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name RunControlInterface -PropertyType Binary -Value (0)\n    New-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name ConnectToRdp -PropertyType Binary -Value (1)\n    $currentValue = [System.Text.Encoding]::ASCII.GetString([System.Text.Encoding]::Unicode.GetBytes($(Get-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server).Password))\n    $newValue = [System.Text.Encoding]::ASCII.GetString([System.Text.Encoding]::Unicode.GetBytes(($[winPassword])))\n    if ($currentValue -ne $newValue){\n\n        Remove-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name Password\n\t    New-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name Password -PropertyType Binary -Value ($[winPassword])\n\t    Remove-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name ControlPassword\n\t    New-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name ControlPassword -PropertyType Binary -Value ($[winPassword])\n\t    Stop-Process -Name tvnserver -Force\n\t    echo "Sign in, request screen popped up."\n    }\n    if(-not(Test-Path "C:\\ProgramData\\Gardiyan_v2"))\n    {\n        $BROWSER = GetOpenBrowserString\n\t    $toRun=". $[mainDomain]permission/#/$[logID]/$[user]"\n\t\t  \n\t[   cekino.ProcessExtensions.ProcessExtensions]::StartProcessAsCurrentUser($BROWSER, $toRun)\n    }\n    \n\t\n}\n\n$USERS = GetActiveUser("user");\nif ($USERS){\n    try{\n        Get-Process tvnserver -ErrorAction Stop\n\t\topenShared\n    } catch {\n        installShared\n    }\n}else{\n\t$istek = (Invoke-WebRequest http://172.16.21.233/client/rest/karcin-client/info/vnc/ -Method Post -ContentType 'application/json' -Body '{"method":"update","processor":"agentRemoteConnection","data":[{"id":1063,"sessionStatus":"noActiveUser"}]}' -UseBasicParsing)\n\techo "The connection cannot be made because the session is closed."\n}	2022-01-12 23:08:37.984	f		system	win_sharedConnectionUnauthorized	\N	powerShell	18
716	SESSIONS=$(loginctl list-sessions --no-legend)\n\nwhile read -r SESSION; do\n    SESSION_ID=$(echo "$SESSION" | awk '{print $1}')\n    USER=$(echo "$SESSION" | awk '{print $3}')\n    STATE=$(loginctl show-session "$SESSION_ID" -p State | awk -F= '{print $2}')\n    if [ "$STATE" = "active" ]; then\n        USERS="$USER"\n        break\n    fi\ndone <<< "$SESSIONS"\n\nif [ -z "$USERS" ]; then\n    echo "No active user session found"\n    exit 1\nfi\nDISPLAY_NUM=$(w -hs "$USER" | awk '{print $3}' | grep -Eo ":[0-9]+" | grep -Eo "[0-9]+")\n\nnextShared(){\n#    sudo sed -i '/^KillMode=none/ { s//KillMode=mixed/; :a; n; ba; }' /lib/systemd/system/plymouth-start.service\n    killall x11vnc\n    systemctl disable x11vnc.service\n    systemctl stop x11vnc.service\n    rm -rf /lib/systemd/system/x11vnc.service\n    apt-get install -y curl\n    mkdir -p /etc/x11vnc\n    x11vnc --storepasswd $[textPassword] /etc/x11vnc/vncpwd\n    x11vnc --storepasswd $[textPassword] /etc/x11vnc.pass\n    chown $USERS /etc/x11vnc /etc/x11vnc/vncpwd /etc/x11vnc.pass\n    chmod 700 /etc/x11vnc /etc/x11vnc/vncpwd /etc/x11vnc.pass\n    echo '[Unit]' >> /lib/systemd/system/x11vnc.service\n    echo 'Description=Start x11vnc at startup.' >> /lib/systemd/system/x11vnc.service\n    echo 'After=multi-user.target' >> /lib/systemd/system/x11vnc.service\n    echo '[Service]' >> /lib/systemd/system/x11vnc.service\n    echo 'Type=simple' >> /lib/systemd/system/x11vnc.service\n    echo 'User='"$USERS" >> /lib/systemd/system/x11vnc.service\n    echo 'ExecStart=/usr/bin/x11vnc -xkb -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared -display :'$DISPLAY_NUM'' >> /lib/systemd/system/x11vnc.service\n    echo '[Install]' >> /lib/systemd/system/x11vnc.service\n    echo 'WantedBy=multi-user.target' >> /lib/systemd/system/x11vnc.service\n    if ! sudo grep -q "^$USERS ALL=(ALL) NOPASSWD: /bin/systemctl start x11vnc.service$" /etc/sudoers; then\n  echo "$USERS ALL=(ALL) NOPASSWD: /bin/systemctl start x11vnc.service" | sudo tee -a /etc/sudoers >/dev/null\n    fi\n    systemctl daemon-reload\n    sudo -k\n    sudo systemctl start x11vnc.service\n\n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"sessionOpened"}]}'\n    nohup sudo -H -u $USERS bash -c 'export DISPLAY=:'$DISPLAY_NUM' && nohup xdg-open $[mainDomain]permission/#/$[logID]/$[user] </dev/null &>/dev/null &' </dev/null &>/dev/null &\n    echo "Sign in, request screen popped up."\n\n}\n\ninstallShared(){\n#    sudo sed -i '/^KillMode=none/ { s//KillMode=mixed/; :a; n; ba; }' /lib/systemd/system/plymouth-start.service\n    systemctl stop x11vnc.service\n    systemctl disabled x11vnc.service\n    rm -rf /lib/systemd/system/x11vnc.service\n    rm -rf /etc/x11vnc\n    systemctl reset-failed\n    systemctl daemon-reload\n    apt-get install -y curl\n    apt-get install -y x11vnc\n    mkdir -p /etc/x11vnc\n    x11vnc --storepasswd $[textPassword] /etc/x11vnc/vncpwd\n    x11vnc --storepasswd $[textPassword] /etc/x11vnc.pass\n    chown $USERS /etc/x11vnc /etc/x11vnc/vncpwd /etc/x11vnc.pass\n    chmod 700 /etc/x11vnc /etc/x11vnc/vncpwd /etc/x11vnc.pass\n    echo '[Unit]' >> /lib/systemd/system/x11vnc.service\n    echo 'Description=Start x11vnc at startup.' >> /lib/systemd/system/x11vnc.service\n    echo 'After=multi-user.target' >> /lib/systemd/system/x11vnc.service\n    echo '[Service]' >> /lib/systemd/system/x11vnc.service\n    echo 'Type=simple' >> /lib/systemd/system/x11vnc.service\n    echo 'User='"$USERS" >> /lib/systemd/system/x11vnc.service\n    echo 'ExecStart=/usr/bin/x11vnc -xkb -forever -noxdamage -repeat -rfbauth /etc/x11vnc/vncpwd -rfbport 5900 -shared -display :'$DISPLAY_NUM'' >> /lib/systemd/system/x11vnc.service\n    echo '[Install]' >> /lib/systemd/system/x11vnc.service\n    echo 'WantedBy=multi-user.target' >> /lib/systemd/system/x11vnc.service\n    systemctl enable x11vnc.service\n    if ! sudo grep -q "^$USERS ALL=(ALL) NOPASSWD: /bin/systemctl start x11vnc.service$" /etc/sudoers; then\n  echo "$USERS ALL=(ALL) NOPASSWD: /bin/systemctl start x11vnc.service" | sudo tee -a /etc/sudoers >/dev/null\nfi\n    systemctl daemon-reload\n    sudo -k\n    sudo systemctl start x11vnc.service\n    sleep 3\n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"sessionOpened"}]}'\n    nohup sudo -H -u $USERS bash -c 'export DISPLAY=:'$DISPLAY_NUM' && nohup xdg-open $[mainDomain]permission/#/$[logID]/$[user] </dev/null &>/dev/null &' </dev/null &>/dev/null &\n    echo "Sign in, request screen popped up."\n\n}\n\nif [ -z "$USERS" ]\nthen\n\n    curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"noActiveUser"}]}'\n   echo "The connection cannot be made because the session is closed."\n    \nelse\n\n    ADET=$(who | grep :0 | wc -l)\n\n    if [ "$ADET" -gt 1 ]\n    then\n        \n        curl -X POST -H "Accept: Application/json" -H "Content-Type: application/json" $[mainDomain]client/rest/karcin-client/info/vnc/ -d '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"multiActiveUser"}]}'\n        echo 'More than one active user exists on the client. Shared connection is not possible.';\n        \n    else\n\n        SERVICE_CONTROL=$(which x11vnc | wc -l)\n        if [ "$SERVICE_CONTROL" -eq 0 ]\n        then\n            # kurulu değil\n            installShared\n        else\n            # kurulu.\n            nextShared\n        fi\n\n    fi\n\nfi	2021-09-23 08:58:20.183	f	Paylaşımlı bağlantı betiğidir.	system	lin_sharedConnection	\N	bash	10
717	net user $[USERNAME] /delete	2024-03-14 10:22:04.07	f	Windows Local Useri Siler.	system	win_deleteLocalUser	\N	powerShell	1
718	import speedtest\nimport json\nimport ssl\n\nssl._create_default_https_context = ssl._create_unverified_context\n\ns = speedtest.Speedtest()\ns.get_best_server()\nping = s.results.ping\ndownload = s.download()\nupload = s.upload()\n\nobj = {"download": float("{:.2f}".format(download / 1048576)), "upload": float("{:.2f}".format(upload / 1048576)), "ping": str(ping)+" ms", "ip": s.config["client"]["ip"], "hostedBy": s.config["client"]["isp"]}\nprint(json.dumps(obj))	2021-07-15 10:03:41.23	f	İnternet hız testi yapar.	system	lin_internetSpeedTest	\N	python	7
719	printf '{"usbstor":%d,"usbaudio":%d,"usbprint":%d,"cdrom":%d,"webcam":%d}\\n' $(test -f "/etc/modprobe.d/usb-storage.conf" && (grep -q "/bin/true" "/etc/modprobe.d/usb-storage.conf" && echo 4 || echo 3) || echo 3) $(test -f "/etc/modprobe.d/snd-usb-audio.conf" && (grep -q "/dev/true" "/etc/modprobe.d/snd-usb-audio.conf" && echo 4 || echo 3) || echo 3) $(test -f "/etc/modprobe.d/usblp.conf" && (grep -q "/dev/true" "/etc/modprobe.d/usblp.conf" && echo 4 || echo 3) || echo 3) $(test -f "/etc/modprobe.d/cdrom.conf" && (grep -q "/dev/true" "/etc/modprobe.d/cdrom.conf" && echo 4 || echo 1) || echo 1) $(test -f "/etc/modprobe.d/uvcvideo.conf" && (grep -q "/dev/true" "/etc/modprobe.d/uvcvideo.conf" && echo 4 || echo 3) || echo 3)	2021-07-24 19:25:05.075	f	Linux donanım kısıtlarını kontrol eder.	system	lin_hardwareStatus	\N	bash	7
720	Get-CimInstance -Class Win32_UserProfile | Where-Object { $_.LocalPath.split(‘\\’)[-1] -eq "$[USERNAME]" } | Remove-CimInstance	2024-03-14 10:22:22.582	f	Windows Domain Useri Siler	system	win_deleteDomainUser	\N	powerShell	1
721	$ver=(Get-WmiObject Win32_OperatingSystem).caption; try{$usbstor=$(Get-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\USBSTOR\\" -Name "start" -ErrorAction Stop).Start}catch{$usbstor=4}; try{$usbaudio=$(Get-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\usbaudio\\" -Name "start" -ErrorAction Stop).Start} catch{$usbaudio=4}; try{$usbprint=$(Get-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\usbprint\\" -Name "start" -ErrorAction Stop).Start} catch{$usbprint=4}; try{$cdrom=$(Get-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\cdrom\\" -Name "start" -ErrorAction Stop).Start} catch{$cdrom=4};  if ($ver -Match "Windows 7"){ try{$bluetooth=$(Get-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\BTHPORT\\" -Name "start" -ErrorAction Stop).Start} catch{$bluetooth=4}} else { try{$bluetooth=$(Get-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\BluetoothUserService\\" -Name "start" -ErrorAction Stop).Start} catch{$bluetooth=4}}; try{$webcam=$(Get-ItemProperty -Path "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\usbvideo\\" -Name "start" -ErrorAction Stop).Start} catch{$webcam=4};$body=[ordered]@{usbstor= $usbstor;usbaudio=$usbaudio;usbprint=$usbprint;cdrom=$cdrom;bluetooth=$bluetooth;webcam=$webcam}|ConvertTo-Json; echo $body;	2021-07-15 19:01:45.067	f	Windows donanım kısıtlarını kontrol eder.	system	win_hardwareStatus	\N	powerShell	10
722	function Get-WorkerProcessId { (Get-Process -Name "gardiyan-worker-user" -ErrorAction SilentlyContinue).Id }; function Check-WorkerConnection { $workerProcessId = Get-WorkerProcessId; if ($workerProcessId -ne $null) { $connection = netstat -an | findstr :5318 | findstr "ESTABLISHED"; if ($connection) { return $true } } return $false }; $workerEstablishedConnection = Check-WorkerConnection; if ($workerEstablishedConnection) { "True" } else { schtasks /End /TN "WorkerUI" | Out-Null 2>&1; schtasks /Run /TN "WorkerUI" | Out-Null 2>&1; Start-Sleep -Seconds 10; $workerEstablishedConnection = Check-WorkerConnection; if ($workerEstablishedConnection) { "True" } else { "False" } }	2024-04-22 10:30:54.586	f	aktif kullanıcı bilgisini getirir	system	win_getActiveUser	\N	powerShell	4
723	if ((Get-WmiObject Win32_OperatingSystem).Caption -match "Windows 7") { Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\BTHPORT" -Name "Start" -Value 3; Start-Service bthserv } else { Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\Bluetooth*" -Name "start" -Value 3; Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\Bth*" -Name "start" -Value 3; sleep 3; Start-Service bthserv; Add-Type -AssemblyName System.Runtime.WindowsRuntime; $asTaskGeneric = ([System.WindowsRuntimeSystemExtensions].GetMethods() | ? { $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1' })[0]; Function Await($WinRtTask, $ResultType) { $asTask = $asTaskGeneric.MakeGenericMethod($ResultType); $netTask = $asTask.Invoke($null, @($WinRtTask)); $netTask.Wait(-1) | Out-Null; $netTask.Result }; [Windows.Devices.Radios.Radio,Windows.System.Devices,ContentType=WindowsRuntime] | Out-Null; [Windows.Devices.Radios.RadioAccessStatus,Windows.System.Devices,ContentType=WindowsRuntime] | Out-Null; Await ([Windows.Devices.Radios.Radio]::RequestAccessAsync()) ([Windows.Devices.Radios.RadioAccessStatus]) | Out-Null; $radios = Await ([Windows.Devices.Radios.Radio]::GetRadiosAsync()) ([System.Collections.Generic.IReadOnlyList[Windows.Devices.Radios.Radio]]); $bluetooth = $radios | ? { $_.Kind -eq 'Bluetooth' }; [Windows.Devices.Radios.RadioState,Windows.System.Devices,ContentType=WindowsRuntime] | Out-Null; Await ($bluetooth.SetStateAsync("Off")) ([Windows.Devices.Radios.RadioAccessStatus]) | Out-Null; sleep 3; Await ($bluetooth.SetStateAsync("On")) ([Windows.Devices.Radios.RadioAccessStatus]) | Out-Null }	2021-07-24 19:00:46.043	f	Donanım kısıt bilgisini günceller.	system	win_hsc_bluetooth_enable	\N	powerShell	6
724	function checkInstallVNC{\n    try{\n        Get-Process tvnserver -ErrorAction Stop\n    } catch {\n        installShared\n     }\n     CheckVncRegedit\n}\n\nfunction installShared {\n    $params = '/i', 'C:\\ProgramData\\gardiyan_v2\\apps\\vnc_setupx64.msi','/quiet','/norestart','/norestart', 'ADDLOCAL="Server"', 'VIEWER_ASSOCIATE_VNC_EXTENSION=1', 'SERVER_REGISTER_AS_SERVICE=1', 'SERVER_ADD_FIREWALL_EXCEPTION=1', 'VIEWER_ADD_FIREWALL_EXCEPTION=1', 'SERVER_ALLOW_SAS=1', 'SET_USEVNCAUTHENTICATION=1', 'VALUE_OF_USEVNCAUTHENTICATION=1', 'SET_PASSWORD=1', 'VALUE_OF_PASSWORD=d448c98b', 'SET_USECONTROLAUTHENTICATION=1', 'VALUE_OF_USECONTROLAUTHENTICATION=1', 'SET_CONTROLPASSWORD=1', 'VALUE_OF_CONTROLPASSWORD=d448c98b', 'SET_RUNCONTROLINTERFACE=0', 'VALUE_OF_RUNCONTROLINTERFACE=0'\n    $p = Start-Process 'msiexec.exe' -ArgumentList $params -NoNewWindow -Wait -PassThru\n    echo "vnc server kuruldu. Parametreler set edilecek."\n}\n\nfunction CheckVncRegedit {\n    if (-not (Test-Path HKLM:\\SOFTWARE\\TightVNC)){\n        regeditAdd\n        SetParameterVnc\n    }\n    else{\n        CheckPropsVnc\n    }\n}\n\n\nfunction regeditAdd {\n    New-Item -Path HKLM:\\SOFTWARE\\TightVNC\n    New-Item -Path HKLM:\\SOFTWARE\\TightVNC\\Server\n}\n\nfunction SetParameterVnc {\n    Remove-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name Password\n\tRemove-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name ControlPassword\n    Remove-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name RunControlInterface\n    Remove-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name ConnectToRdp\n    Remove-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name RfbPort\n\n    New-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name Password -PropertyType Binary -Value ($[winPassword])\n\tNew-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name ControlPassword -PropertyType Binary -Value ($[winPassword])\n    New-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name RunControlInterface -PropertyType Binary -Value (0)\n    New-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name ConnectToRdp -PropertyType DWORD -Value (1)\n    New-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server -Name RfbPort -Value ($[port]) -PropertyType DWORD\n    try {\n        Stop-Process -Name tvnserver -Force\n        Start-Sleep -s 5\n        echo "vnc server restart edildi"\n    }catch {}\n\n}\n\nfunction CheckPropsVnc {\n     $currentPort =  (Get-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server).RfbPort\n    $currentValue = [System.Text.Encoding]::ASCII.GetString([System.Text.Encoding]::Unicode.GetBytes($(Get-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server).Password))\n    $newValue = [System.Text.Encoding]::ASCII.GetString([System.Text.Encoding]::Unicode.GetBytes(($[winPassword])))\n    $newPort = $[port]\n    $connecttordp = $(Get-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server).ConnectToRdp\n    $runcontrol = $(Get-ItemProperty -Path HKLM:\\SOFTWARE\\TightVNC\\Server).RunControlInterface\n\n    if (($currentValue -ne $newValue ) -or ($newPort -ne $currentPort )){\n        echo "parametreler değiştiği için yeniden set edilecek..."  \n        SetParameterVnc      \n    }\n\n}\n\n\nfunction GetActiveUser($type) {\n    if(-not(Test-Path "C:\\ProgramData\\Gardiyan_v2")){\n        $activeUserTable = $(query session); $activeUser = ''; $iCount = 1; for( ; $iCount -le $activeUserTable.length - 1; $iCount++ ){ $currentRow = $activeUserTable[$iCount] -replace '\\s\\s+', ','; if ( $currentRow -like '*Etkin*' -Or $currentRow -like '*Active*'){ $currentRowItems = $currentRow.split(','); if ( $type -eq "user" ){ $activeUser = $currentRowItems[1]; }elseif ( $type -eq "id" ){ $activeUser = $currentRowItems[2]; } break; } } return $activeUser;\n    } else {\n        try {\n            return $(Get-Process gardiyan-worker-user -ErrorAction Stop).Id \n        } catch {\n            return\n        }\n    }\n}\n\n$USERS = GetActiveUser("user");\nif ($USERS){\n    checkInstallVNC\n}else{\n\t$istek = (Invoke-WebRequest $[mainDomain]client/rest/karcin-client/info/vnc/ -Method Post -ContentType 'application/json' -Body '{"method":"update","processor":"agentRemoteConnection","data":[{"id":$[logID],"sessionStatus":"noActiveUser"}]}' -UseBasicParsing)\n\techo "The connection cannot be made because the session is closed."\n}	2021-08-05 18:00:12.548	f	Paylaşımlı bağlantı betiğidir.	system	win_sharedConnection	\N	powerShell	35
725	if ((Get-WmiObject Win32_OperatingSystem).Caption -match "Windows 7") { Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\BTHPORT" -Name "Start" -Value 4; Start-Service bthserv } else { Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\Bluetooth*" -Name "start" -Value 4; Set-ItemProperty -Path "HKLM:\\\\SYSTEM\\\\CurrentControlSet\\\\Services\\\\Bth*" -Name "start" -Value 4; sleep 3; If ((Get-Service bthserv).Status -eq 'Stopped') { Start-Service bthserv }; Add-Type -AssemblyName System.Runtime.WindowsRuntime; $asTaskGeneric = ([System.WindowsRuntimeSystemExtensions].GetMethods() | ? { $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1' })[0]; Function Await($WinRtTask, $ResultType) { $asTask = $asTaskGeneric.MakeGenericMethod($ResultType); $netTask = $asTask.Invoke($null, @($WinRtTask)); $netTask.Wait(-1) | Out-Null; $netTask.Result }; [Windows.Devices.Radios.Radio,Windows.System.Devices,ContentType=WindowsRuntime] | Out-Null; [Windows.Devices.Radios.RadioAccessStatus,Windows.System.Devices,ContentType=WindowsRuntime] | Out-Null; Await ([Windows.Devices.Radios.Radio]::RequestAccessAsync()) ([Windows.Devices.Radios.RadioAccessStatus]) | Out-Null; $radios = Await ([Windows.Devices.Radios.Radio]::GetRadiosAsync()) ([System.Collections.Generic.IReadOnlyList[Windows.Devices.Radios.Radio]]); $bluetooth = $radios | ? { $_.Kind -eq 'Bluetooth' }; [Windows.Devices.Radios.RadioState,Windows.System.Devices,ContentType=WindowsRuntime] | Out-Null; Await ($bluetooth.SetStateAsync("Off")) ([Windows.Devices.Radios.RadioAccessStatus]) | Out-Null }	2021-07-24 18:58:52.705	f	Donanım kısıt bilgisini günceller.	system	win_hsc_bluetooth_disable	\N	powerShell	6
\.


--
-- Data for Name: kr_script_task_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_script_task_detail (script_task_detail_id, create_date, is_deleted, script_button_definition_id, script_id, task_id, version) FROM stdin;
\.


--
-- Data for Name: kr_system_exception; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_system_exception (system_exception_id, class_name, create_date, description, method_name) FROM stdin;
\.


--
-- Data for Name: kr_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_task (task_id, command_cls_id, create_date, cron_expression, is_deleted, details, general_type, is_mail_send, modify_date, parameter_map, version) FROM stdin;
46	EXECUTE_SCRIPT	2024-11-04 11:46:34.948	\N	f	Ağ Bağlantı Bilgisi	NORMAL	f	\N	\\x7b225343524950545f4c4142454c223a2241c49f204261c49f6c616e74c4b12042696c67697369222c225343524950545f47454e4552414c5f54595045223a224e4f524d414c222c225343524950545f46494c455f4944223a3633312c225343524950545f434f4e54454e5453223a22496e7374616c6c2d4d6f64756c65202d4e616d65205053446973636f7665727950726f746f636f6c20222c225343524950545f54595045223a2257494e444f5753227d	1
\.


--
-- Data for Name: kr_task_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_task_sequence (task_sequence_id, command_content, create_date, definition_owner, is_deleted, description, name, operating_system, version) FROM stdin;
\.


--
-- Data for Name: kr_task_sequence_command; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_task_sequence_command (task_sequence_command_id, command_content, command_owner, create_date, is_deleted, dn_list, dn_type, dn_type_detail, task_name, total, uid_list, version, task_sequence_id) FROM stdin;
\.


--
-- Data for Name: kr_task_sequence_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_task_sequence_detail (task_sequence_detail_id, create_date, is_deleted, dn, hostname, modify_date, reach_status, version, task_sequence_command_id, agent_id, uid) FROM stdin;
\.


--
-- Data for Name: kr_task_sequence_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_task_sequence_result (task_sequence_result_id, create_date, is_deleted, modify_date, place, reach_status_from_agent, required, response_data, response_status, task_sequence_type, uid, version, task_sequence_detail_id, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_usb_definition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_usb_definition (usb_definition_id, box_serial_number, brand, create_date, is_deleted, description, model, operator, serial_number, version) FROM stdin;
\.


--
-- Data for Name: kr_watchdog_playbook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_watchdog_playbook (watchdog_playbook_id, content, create_date, is_deleted, name, task_count, username, version) FROM stdin;
\.


--
-- Data for Name: kr_watchdog_playbook_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_watchdog_playbook_execution (watchdog_playbook_execution_id, create_date, is_deleted, execution_content, username, version, agent_collection_id, watchdog_playbook_id) FROM stdin;
\.


--
-- Data for Name: kr_watchdog_playbook_execution_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_watchdog_playbook_execution_detail (watchdog_playbook_execution_detail_id, create_date, is_deleted, version, agent_id, watchdog_playbook_execution_id) FROM stdin;
\.


--
-- Data for Name: kr_watchdog_playbook_execution_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_watchdog_playbook_execution_result (watchdog_playbook_execution_result_id, create_date, is_deleted, name, result, status, version, watchdog_playbook_execution_detail_id) FROM stdin;
\.


--
-- Data for Name: kr_watchdog_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_watchdog_task (watchdog_task_id, create_date, is_deleted, task, version) FROM stdin;
\.


--
-- Data for Name: template_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.template_parameters (template_parameters_id, createdate, is_deleted, parametercode, parametername, parametervalue, version) FROM stdin;
\.


--
-- Name: kr_agent_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_agent_id_seq', 22, true);


--
-- Name: kr_agent_collection_agent_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_collection_agent_collection_id_seq', 1, false);


--
-- Name: kr_agent_configuration_agent_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_configuration_agent_configuration_id_seq', 1, false);


--
-- Name: kr_agent_critical_process_agent_critical_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_critical_process_agent_critical_process_id_seq', 1, false);


--
-- Name: kr_agent_critical_record_agent_critical_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_critical_record_agent_critical_record_id_seq', 1, false);


--
-- Name: kr_agent_disk_usage_agent_disk_usage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_disk_usage_agent_disk_usage_id_seq', 1, false);


--
-- Name: kr_agent_event_log_agent_event_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_event_log_agent_event_log_id_seq', 1, false);


--
-- Name: kr_agent_event_log_detail_agent_event_log_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_event_log_detail_agent_event_log_detail_id_seq', 1, false);


--
-- Name: kr_agent_file_agent_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_file_agent_file_id_seq', 1, false);


--
-- Name: kr_agent_file_integrity_agent_file_integrity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_file_integrity_agent_file_integrity_id_seq', 1, false);


--
-- Name: kr_agent_file_tracking_agent_file_tracking_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_file_tracking_agent_file_tracking_seq', 1, false);


--
-- Name: kr_agent_folder_agent_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_folder_agent_folder_id_seq', 1, false);


--
-- Name: kr_agent_hardware_agent_hardware_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_hardware_agent_hardware_id_seq', 1, false);


--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_hardware_constraints_agent_hardware_constraints_id_seq', 1, false);


--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_la_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_hardware_constraints_agent_hardware_constraints_la_seq', 36, true);


--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_t_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_hardware_constraints_agent_hardware_constraints_t_seq1', 320, true);


--
-- Name: kr_agent_hardware_constraints_agent_hardware_constraints_ta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_hardware_constraints_agent_hardware_constraints_ta_seq', 57, true);


--
-- Name: kr_agent_hardware_history_agent_hardware_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_hardware_history_agent_hardware_history_id_seq', 1, false);


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
-- Name: kr_agent_message_agent_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_message_agent_message_id_seq', 4, true);


--
-- Name: kr_agent_message_detail_agent_message_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_message_detail_agent_message_detail_id_seq', 4, true);


--
-- Name: kr_agent_operating_system_agent_operating_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_operating_system_agent_operating_system_id_seq', 1, false);


--
-- Name: kr_agent_operation_history_agent_operation_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_operation_history_agent_operation_history_id_seq', 1, false);


--
-- Name: kr_agent_patch_agent_patch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_patch_agent_patch_id_seq', 1, false);


--
-- Name: kr_agent_policy_tracking_agent_policy_tracking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_policy_tracking_agent_policy_tracking_id_seq', 1, false);


--
-- Name: kr_agent_policy_tracking_deta_agent_policy_tracking_detail__seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_policy_tracking_deta_agent_policy_tracking_detail__seq', 1, false);


--
-- Name: kr_agent_port_alarm_agent_port_alarm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_port_alarm_agent_port_alarm_id_seq', 1, false);


--
-- Name: kr_agent_process_log_agent_process_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_process_log_agent_process_log_id_seq', 1, false);


--
-- Name: kr_agent_program_install_agent_program_install_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_install_agent_program_install_id_seq', 4, true);


--
-- Name: kr_agent_program_install_deta_agent_program_install_detail__seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_install_deta_agent_program_install_detail__seq', 4, true);


--
-- Name: kr_agent_program_install_resu_agent_program_install_result__seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_install_resu_agent_program_install_result__seq', 6, true);


--
-- Name: kr_agent_program_restriction_definitions_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_restriction_definitions_detail_id_seq', 1, false);


--
-- Name: kr_agent_program_restriction_definitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_restriction_definitions_id_seq', 1, false);


--
-- Name: kr_agent_program_restriction_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_restriction_detail_id_seq', 1, false);


--
-- Name: kr_agent_program_restriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_restriction_id_seq', 1, false);


--
-- Name: kr_agent_program_uninstall_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_uninstall_detail_id_seq', 1, false);


--
-- Name: kr_agent_program_uninstall_detail_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_uninstall_detail_results_id_seq', 1, false);


--
-- Name: kr_agent_program_uninstall_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_uninstall_id_seq', 1, false);


--
-- Name: kr_agent_program_use_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_program_use_status_id_seq', 1, false);


--
-- Name: kr_agent_quarantine_history_quarantine_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_quarantine_history_quarantine_history_id_seq', 1, false);


--
-- Name: kr_agent_remote_connection_agent_remote_connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_remote_connection_agent_remote_connection_id_seq', 1, false);


--
-- Name: kr_agent_remote_connection_se_agent_remote_connection_setti_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_remote_connection_se_agent_remote_connection_setti_seq', 1, false);


--
-- Name: kr_agent_scan_agent_scan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_scan_agent_scan_id_seq', 1, false);


--
-- Name: kr_agent_service_alarm_agent_service_alarm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_service_alarm_agent_service_alarm_id_seq', 1, false);


--
-- Name: kr_agent_session_agent_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_session_agent_session_id_seq', 1, false);


--
-- Name: kr_agent_software_agent_software_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_software_agent_software_id_seq', 1, false);


--
-- Name: kr_agent_software_metric_agent_software_metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_software_metric_agent_software_metric_id_seq', 1, false);


--
-- Name: kr_agent_usb_block_agent_usb_block_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_usb_block_agent_usb_block_id_seq', 1, false);


--
-- Name: kr_agent_usb_file_agent_usb_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_usb_file_agent_usb_file_id_seq', 1, false);


--
-- Name: kr_agent_usb_tracking_agent_usb_tracking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_usb_tracking_agent_usb_tracking_id_seq', 1, false);


--
-- Name: kr_agent_user_agent_software_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_user_agent_software_id_seq', 1, false);


--
-- Name: kr_agent_user_login_log_agent_user_login_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_user_login_log_agent_user_login_log_id_seq', 1, false);


--
-- Name: kr_agent_user_session_history_agent_user_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_user_session_history_agent_user_session_id_seq', 1, true);


--
-- Name: kr_agent_vulnerability_agent_vulnerability_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_vulnerability_agent_vulnerability_id_seq', 1, false);


--
-- Name: kr_agent_vulnerability_detail_agent_vulnerability_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_vulnerability_detail_agent_vulnerability_detail_id_seq', 1, false);


--
-- Name: kr_agent_vulnerability_host_agent_vulnerability_host_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_vulnerability_host_agent_vulnerability_host_id_seq', 1, false);


--
-- Name: kr_agent_vulnerability_networ_agent_vulnerability_network_i_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_vulnerability_networ_agent_vulnerability_network_i_seq', 11, true);


--
-- Name: kr_auto_agent_delete_history_auto_agent_delete_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_auto_agent_delete_history_auto_agent_delete_history_id_seq', 1, false);


--
-- Name: kr_auto_provision_auto_provision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_auto_provision_auto_provision_id_seq', 1, false);


--
-- Name: kr_auto_provision_detail_auto_provision_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_auto_provision_detail_auto_provision_detail_id_seq', 1, false);


--
-- Name: kr_city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_city_city_id_seq', 1, false);


--
-- Name: kr_command_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_command_command_id_seq', 46, true);


--
-- Name: kr_command_execution_command_execution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_command_execution_command_execution_id_seq', 46, true);


--
-- Name: kr_command_execution_result_command_execution_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_command_execution_result_command_execution_result_id_seq', 1, true);


--
-- Name: kr_country_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_country_country_id_seq', 1, false);


--
-- Name: kr_domain_subnet_match_domain_subnet_match_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_domain_subnet_match_domain_subnet_match_id_seq', 1, false);


--
-- Name: kr_email_job_email_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_email_job_email_job_id_seq', 1, false);


--
-- Name: kr_file_transfer_detail_file_transfer_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_file_transfer_detail_file_transfer_detail_id_seq', 1, false);


--
-- Name: kr_file_transfer_file_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_file_transfer_file_transfer_id_seq', 1, true);


--
-- Name: kr_file_transfer_schedule_file_transfer_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_file_transfer_schedule_file_transfer_schedule_id_seq', 1, false);


--
-- Name: kr_inventory_activity_inventory_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_inventory_activity_inventory_activity_id_seq', 1, false);


--
-- Name: kr_inventory_inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_inventory_inventory_id_seq', 1, false);


--
-- Name: kr_ldap_user_ldap_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_ldap_user_ldap_user_id_seq', 22, true);


--
-- Name: kr_ldap_user_policy_ldap_user_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_ldap_user_policy_ldap_user_policy_id_seq', 1, false);


--
-- Name: kr_ldap_user_property_ldap_user_property_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_ldap_user_property_ldap_user_property_id_seq', 657, true);


--
-- Name: kr_person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_person_person_id_seq', 1, false);


--
-- Name: kr_process_history_process_history_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_process_history_process_history_seq', 8, true);


--
-- Name: kr_program_file_program_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_program_file_program_file_id_seq', 4, true);


--
-- Name: kr_program_license_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_program_license_agent_id_seq', 1, false);


--
-- Name: kr_queue_class_configuration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_queue_class_configuration_id_seq', 42, true);


--
-- Name: kr_queue_error_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_queue_error_log_id_seq', 36, true);


--
-- Name: kr_rdp_recorder_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_rdp_recorder_history_id_seq', 1, false);


--
-- Name: kr_rdp_recorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_rdp_recorder_id_seq', 1, false);


--
-- Name: kr_rdp_recorder_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_rdp_recorder_list_id_seq', 1, false);


--
-- Name: kr_recording_timer_recording_timer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_recording_timer_recording_timer_id_seq', 1, false);


--
-- Name: kr_script_button_definition_script_button_definition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_script_button_definition_script_button_definition_id_seq', 1, false);


--
-- Name: kr_script_file_script_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_script_file_script_file_id_seq', 725, true);


--
-- Name: kr_script_task_detail_script_task_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_script_task_detail_script_task_detail_id_seq', 1, false);


--
-- Name: kr_system_exception_system_exception_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_system_exception_system_exception_id_seq', 1, false);


--
-- Name: kr_task_sequence_command_task_sequence_command_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_task_sequence_command_task_sequence_command_id_seq', 1, false);


--
-- Name: kr_task_sequence_detail_task_sequence_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_task_sequence_detail_task_sequence_detail_id_seq', 1, false);


--
-- Name: kr_task_sequence_result_task_sequence_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_task_sequence_result_task_sequence_result_id_seq', 1, false);


--
-- Name: kr_task_sequence_task_sequence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_task_sequence_task_sequence_id_seq', 1, false);


--
-- Name: kr_task_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_task_task_id_seq', 46, true);


--
-- Name: kr_usb_definition_usb_definition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_usb_definition_usb_definition_id_seq', 1, false);


--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_d_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_watchdog_playbook_executio_watchdog_playbook_execution_d_seq', 1, false);


--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_i_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_watchdog_playbook_executio_watchdog_playbook_execution_i_seq', 1, false);


--
-- Name: kr_watchdog_playbook_executio_watchdog_playbook_execution_r_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_watchdog_playbook_executio_watchdog_playbook_execution_r_seq', 1, false);


--
-- Name: kr_watchdog_playbook_watchdog_playbook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_watchdog_playbook_watchdog_playbook_id_seq', 1, false);


--
-- Name: kr_watchdog_task_watchdog_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_watchdog_task_watchdog_task_id_seq', 1, false);


--
-- Name: template_parameters_template_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.template_parameters_template_parameters_id_seq', 1, false);


--
-- Name: ofextcomponentconf ofextcomponentconf_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofextcomponentconf
    ADD CONSTRAINT ofextcomponentconf_pk PRIMARY KEY (subdomain);


--
-- Name: ofgroup ofgroup_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofgroup
    ADD CONSTRAINT ofgroup_pk PRIMARY KEY (groupname);


--
-- Name: ofgroupprop ofgroupprop_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofgroupprop
    ADD CONSTRAINT ofgroupprop_pk PRIMARY KEY (groupname, name);


--
-- Name: ofgroupuser ofgroupuser_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofgroupuser
    ADD CONSTRAINT ofgroupuser_pk PRIMARY KEY (groupname, username, administrator);


--
-- Name: ofid ofid_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofid
    ADD CONSTRAINT ofid_pk PRIMARY KEY (idtype);


--
-- Name: ofmucaffiliation ofmucaffiliation_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucaffiliation
    ADD CONSTRAINT ofmucaffiliation_pk PRIMARY KEY (roomid, jid);


--
-- Name: ofmucmember ofmucmember_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucmember
    ADD CONSTRAINT ofmucmember_pk PRIMARY KEY (roomid, jid);


--
-- Name: ofmucroom ofmucroom_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucroom
    ADD CONSTRAINT ofmucroom_pk PRIMARY KEY (serviceid, name);


--
-- Name: ofmucroomprop ofmucroomprop_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucroomprop
    ADD CONSTRAINT ofmucroomprop_pk PRIMARY KEY (roomid, name);


--
-- Name: ofmucservice ofmucservice_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucservice
    ADD CONSTRAINT ofmucservice_pk PRIMARY KEY (subdomain);


--
-- Name: ofmucserviceprop ofmucserviceprop_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofmucserviceprop
    ADD CONSTRAINT ofmucserviceprop_pk PRIMARY KEY (serviceid, name);


--
-- Name: ofoffline ofoffline_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofoffline
    ADD CONSTRAINT ofoffline_pk PRIMARY KEY (username, messageid);


--
-- Name: ofpresence ofpresence_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpresence
    ADD CONSTRAINT ofpresence_pk PRIMARY KEY (username);


--
-- Name: ofprivacylist ofprivacylist_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofprivacylist
    ADD CONSTRAINT ofprivacylist_pk PRIMARY KEY (username, name);


--
-- Name: ofproperty ofproperty_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofproperty
    ADD CONSTRAINT ofproperty_pk PRIMARY KEY (name);


--
-- Name: ofpubsubaffiliation ofpubsubaffiliation_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubaffiliation
    ADD CONSTRAINT ofpubsubaffiliation_pk PRIMARY KEY (serviceid, nodeid, jid);


--
-- Name: ofpubsubdefaultconf ofpubsubdefaultconf_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubdefaultconf
    ADD CONSTRAINT ofpubsubdefaultconf_pk PRIMARY KEY (serviceid, leaf);


--
-- Name: ofpubsubitem ofpubsubitem_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubitem
    ADD CONSTRAINT ofpubsubitem_pk PRIMARY KEY (serviceid, nodeid, id);


--
-- Name: ofpubsubnode ofpubsubnode_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubnode
    ADD CONSTRAINT ofpubsubnode_pk PRIMARY KEY (serviceid, nodeid);


--
-- Name: ofpubsubnodejids ofpubsubnodejids_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubnodejids
    ADD CONSTRAINT ofpubsubnodejids_pk PRIMARY KEY (serviceid, nodeid, jid);


--
-- Name: ofpubsubsubscription ofpubsubsubscription_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofpubsubsubscription
    ADD CONSTRAINT ofpubsubsubscription_pk PRIMARY KEY (serviceid, nodeid, id);


--
-- Name: ofremoteserverconf ofremoteserverconf_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofremoteserverconf
    ADD CONSTRAINT ofremoteserverconf_pk PRIMARY KEY (xmppdomain);


--
-- Name: ofroster ofroster_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofroster
    ADD CONSTRAINT ofroster_pk PRIMARY KEY (rosterid);


--
-- Name: ofrostergroups ofrostergroups_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofrostergroups
    ADD CONSTRAINT ofrostergroups_pk PRIMARY KEY (rosterid, rank);


--
-- Name: ofsaslauthorized ofsaslauthorized_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofsaslauthorized
    ADD CONSTRAINT ofsaslauthorized_pk PRIMARY KEY (username, principal);


--
-- Name: ofsecurityauditlog ofsecurityauditlog_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofsecurityauditlog
    ADD CONSTRAINT ofsecurityauditlog_pk PRIMARY KEY (msgid);


--
-- Name: ofuser ofuser_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofuser
    ADD CONSTRAINT ofuser_pk PRIMARY KEY (username);


--
-- Name: ofuserflag ofuserflag_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofuserflag
    ADD CONSTRAINT ofuserflag_pk PRIMARY KEY (username, name);


--
-- Name: ofuserprop ofuserprop_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofuserprop
    ADD CONSTRAINT ofuserprop_pk PRIMARY KEY (username, name);


--
-- Name: ofvcard ofvcard_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofvcard
    ADD CONSTRAINT ofvcard_pk PRIMARY KEY (username);


--
-- Name: ofversion ofversion_pk; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofversion
    ADD CONSTRAINT ofversion_pk PRIMARY KEY (name);


--
-- Name: userstatus pk_userstatus; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.userstatus
    ADD CONSTRAINT pk_userstatus PRIMARY KEY (username, resource);


--
-- Name: userstatushistory pk_userstatushistory; Type: CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.userstatushistory
    ADD CONSTRAINT pk_userstatushistory PRIMARY KEY (historyid);


--
-- Name: kr_agent_configuration kr_agent_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_configuration
    ADD CONSTRAINT kr_agent_configuration_pkey PRIMARY KEY (agent_configuration_id);


--
-- Name: kr_agent_program_restriction_definitions_detail kr_agent_program_restriction_definitions_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction_definitions_detail
    ADD CONSTRAINT kr_agent_program_restriction_definitions_detail_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_program_restriction_definitions kr_agent_program_restriction_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction_definitions
    ADD CONSTRAINT kr_agent_program_restriction_definitions_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_program_restriction_detail kr_agent_program_restriction_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction_detail
    ADD CONSTRAINT kr_agent_program_restriction_detail_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_program_restriction kr_agent_program_restriction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction
    ADD CONSTRAINT kr_agent_program_restriction_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_program_uninstall_detail kr_agent_program_uninstall_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall_detail
    ADD CONSTRAINT kr_agent_program_uninstall_detail_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_program_uninstall_detail_results kr_agent_program_uninstall_detail_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall_detail_results
    ADD CONSTRAINT kr_agent_program_uninstall_detail_results_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_program_uninstall kr_agent_program_uninstall_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall
    ADD CONSTRAINT kr_agent_program_uninstall_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_quarantine_history kr_agent_quarantine_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_quarantine_history
    ADD CONSTRAINT kr_agent_quarantine_history_pkey PRIMARY KEY (quarantine_history_id);


--
-- Name: kr_queue_class_configuration kr_queue_class_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_class_configuration
    ADD CONSTRAINT kr_queue_class_configuration_pkey PRIMARY KEY (id);


--
-- Name: kr_queue_error_log kr_queue_error_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_queue_error_log
    ADD CONSTRAINT kr_queue_error_log_pkey PRIMARY KEY (id);


--
-- Name: kr_rdp_recorder_history kr_rdp_recorder_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder_history
    ADD CONSTRAINT kr_rdp_recorder_history_pkey PRIMARY KEY (id);


--
-- Name: kr_rdp_recorder_list kr_rdp_recorder_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder_list
    ADD CONSTRAINT kr_rdp_recorder_list_pkey PRIMARY KEY (id);


--
-- Name: kr_rdp_recorder kr_rdp_recorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder
    ADD CONSTRAINT kr_rdp_recorder_pkey PRIMARY KEY (id);


--
-- Name: template_parameters template_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.template_parameters
    ADD CONSTRAINT template_parameters_pkey PRIMARY KEY (template_parameters_id);


--
-- Name: kr_command_execution u_kr_cctn_command_execution_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command_execution
    ADD CONSTRAINT u_kr_cctn_command_execution_id PRIMARY KEY (command_execution_id);


--
-- Name: kr_city u_kr_city_city_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_city
    ADD CONSTRAINT u_kr_city_city_id PRIMARY KEY (city_id);


--
-- Name: kr_command u_kr_cmnd_command_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command
    ADD CONSTRAINT u_kr_cmnd_command_id PRIMARY KEY (command_id);


--
-- Name: kr_command u_kr_cmnd_task_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command
    ADD CONSTRAINT u_kr_cmnd_task_id UNIQUE (task_id);


--
-- Name: kr_command_execution_result u_kr_cslt_command_execution_result_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command_execution_result
    ADD CONSTRAINT u_kr_cslt_command_execution_result_id PRIMARY KEY (command_execution_result_id);


--
-- Name: kr_country u_kr_ctry_country_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_country
    ADD CONSTRAINT u_kr_ctry_country_id PRIMARY KEY (country_id);


--
-- Name: kr_domain_subnet_match u_kr_dtch_domain_subnet_match_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_domain_subnet_match
    ADD CONSTRAINT u_kr_dtch_domain_subnet_match_id PRIMARY KEY (domain_subnet_match_id);


--
-- Name: kr_file_transfer_detail u_kr_fdtl_file_transfer_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_detail
    ADD CONSTRAINT u_kr_fdtl_file_transfer_detail_id PRIMARY KEY (file_transfer_detail_id);


--
-- Name: kr_file_transfer_schedule u_kr_fhdl_file_transfer_schedule_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_schedule
    ADD CONSTRAINT u_kr_fhdl_file_transfer_schedule_id PRIMARY KEY (file_transfer_schedule_id);


--
-- Name: kr_file_transfer u_kr_fsfr_file_transfer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer
    ADD CONSTRAINT u_kr_fsfr_file_transfer_id PRIMARY KEY (file_transfer_id);


--
-- Name: kr_agent_file u_kr_g_fl_agent_file_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_file
    ADD CONSTRAINT u_kr_g_fl_agent_file_id PRIMARY KEY (agent_file_id);


--
-- Name: kr_agent_usb_file u_kr_g_fl_agent_usb_file_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_file
    ADD CONSTRAINT u_kr_g_fl_agent_usb_file_id PRIMARY KEY (agent_usb_file_id);


--
-- Name: kr_agent_event_log u_kr_g_lg_agent_event_log_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_event_log
    ADD CONSTRAINT u_kr_g_lg_agent_event_log_id PRIMARY KEY (agent_event_log_id);


--
-- Name: kr_agent_process_log u_kr_g_lg_agent_process_log_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_process_log
    ADD CONSTRAINT u_kr_g_lg_agent_process_log_id PRIMARY KEY (agent_process_log_id);


--
-- Name: kr_agent_user_login_log u_kr_g_lg_agent_user_login_log_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_login_log
    ADD CONSTRAINT u_kr_g_lg_agent_user_login_log_id PRIMARY KEY (agent_user_login_log_id);


--
-- Name: kr_agent_disk_usage u_kr_g_sg_agent_disk_usage_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_disk_usage
    ADD CONSTRAINT u_kr_g_sg_agent_disk_usage_id PRIMARY KEY (agent_disk_usage_id);


--
-- Name: kr_agent_user u_kr_g_sr_agent_software_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user
    ADD CONSTRAINT u_kr_g_sr_agent_software_id PRIMARY KEY (agent_software_id);


--
-- Name: kr_agent_critical_record u_kr_gcrd_agent_critical_record_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_critical_record
    ADD CONSTRAINT u_kr_gcrd_agent_critical_record_id PRIMARY KEY (agent_critical_record_id);


--
-- Name: kr_agent_installation_cron u_kr_gcrn_agent_installation_cron_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_cron
    ADD CONSTRAINT u_kr_gcrn_agent_installation_cron_id PRIMARY KEY (agent_installation_cron_id);


--
-- Name: kr_agent_critical_process u_kr_gcss_agent_critical_process_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_critical_process
    ADD CONSTRAINT u_kr_gcss_agent_critical_process_id PRIMARY KEY (agent_critical_process_id);


--
-- Name: kr_agent_collection u_kr_gctn_agent_collection_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_collection
    ADD CONSTRAINT u_kr_gctn_agent_collection_id PRIMARY KEY (agent_collection_id);


--
-- Name: kr_agent_remote_connection u_kr_gctn_agent_remote_connection_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_remote_connection
    ADD CONSTRAINT u_kr_gctn_agent_remote_connection_id PRIMARY KEY (agent_remote_connection_id);


--
-- Name: kr_agent_event_log_detail u_kr_gdtl_agent_event_log_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_event_log_detail
    ADD CONSTRAINT u_kr_gdtl_agent_event_log_detail_id PRIMARY KEY (agent_event_log_detail_id);


--
-- Name: kr_agent_message_detail u_kr_gdtl_agent_message_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_message_detail
    ADD CONSTRAINT u_kr_gdtl_agent_message_detail_id PRIMARY KEY (agent_message_detail_id);


--
-- Name: kr_agent_policy_tracking_detail u_kr_gdtl_agent_policy_tracking_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_policy_tracking_detail
    ADD CONSTRAINT u_kr_gdtl_agent_policy_tracking_detail_id PRIMARY KEY (agent_policy_tracking_detail_id);


--
-- Name: kr_agent_program_install_detail u_kr_gdtl_agent_program_install_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_detail
    ADD CONSTRAINT u_kr_gdtl_agent_program_install_detail_id PRIMARY KEY (agent_program_install_detail_id);


--
-- Name: kr_agent_vulnerability_detail u_kr_gdtl_agent_vulnerability_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability_detail
    ADD CONSTRAINT u_kr_gdtl_agent_vulnerability_detail_id PRIMARY KEY (agent_vulnerability_detail_id);


--
-- Name: kr_agent_hardware u_kr_gdwr_agent_hardware_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware
    ADD CONSTRAINT u_kr_gdwr_agent_hardware_id PRIMARY KEY (agent_hardware_id);


--
-- Name: kr_agent u_kr_gent_agent_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent
    ADD CONSTRAINT u_kr_gent_agent_id PRIMARY KEY (agent_id);


--
-- Name: kr_agent u_kr_gent_hostname; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent
    ADD CONSTRAINT u_kr_gent_hostname UNIQUE (hostname, domain_name);


--
-- Name: kr_agent_vulnerability_host u_kr_ghst_agent_vulnerability_host_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability_host
    ADD CONSTRAINT u_kr_ghst_agent_vulnerability_host_id PRIMARY KEY (agent_vulnerability_host_id);


--
-- Name: kr_agent_file_tracking u_kr_gkng_agent_file_tracking; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_file_tracking
    ADD CONSTRAINT u_kr_gkng_agent_file_tracking PRIMARY KEY (agent_file_tracking);


--
-- Name: kr_agent_policy_tracking u_kr_gkng_agent_policy_tracking_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_policy_tracking
    ADD CONSTRAINT u_kr_gkng_agent_policy_tracking_id PRIMARY KEY (agent_policy_tracking_id);


--
-- Name: kr_agent_usb_tracking u_kr_gkng_agent_usb_tracking_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_tracking
    ADD CONSTRAINT u_kr_gkng_agent_usb_tracking_id PRIMARY KEY (agent_usb_tracking_id);


--
-- Name: kr_agent_usb_block u_kr_glck_agent_usb_block_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_block
    ADD CONSTRAINT u_kr_glck_agent_usb_block_id PRIMARY KEY (agent_usb_block_id);


--
-- Name: kr_agent_folder u_kr_gldr_agent_folder_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_folder
    ADD CONSTRAINT u_kr_gldr_agent_folder_id PRIMARY KEY (agent_folder_id);


--
-- Name: kr_agent_port_alarm u_kr_glrm_agent_port_alarm_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_port_alarm
    ADD CONSTRAINT u_kr_glrm_agent_port_alarm_id PRIMARY KEY (agent_port_alarm_id);


--
-- Name: kr_agent_service_alarm u_kr_glrm_agent_service_alarm_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_service_alarm
    ADD CONSTRAINT u_kr_glrm_agent_service_alarm_id PRIMARY KEY (agent_service_alarm_id);


--
-- Name: kr_agent_installation u_kr_gltn_agent_installation_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation
    ADD CONSTRAINT u_kr_gltn_agent_installation_id PRIMARY KEY (agent_installation_id);


--
-- Name: kr_agent_vulnerability u_kr_glty_agent_vulnerability_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability
    ADD CONSTRAINT u_kr_glty_agent_vulnerability_id PRIMARY KEY (agent_vulnerability_id);


--
-- Name: kr_agent_vulnerability_network_information u_kr_gmtn_agent_vulnerability_network_information_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability_network_information
    ADD CONSTRAINT u_kr_gmtn_agent_vulnerability_network_information_id PRIMARY KEY (agent_vulnerability_network_information_id);


--
-- Name: kr_agent_hardware_constraints u_kr_gnts_agent_hardware_constraints_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints
    ADD CONSTRAINT u_kr_gnts_agent_hardware_constraints_id PRIMARY KEY (agent_hardware_constraints_id);


--
-- Name: kr_agent_file_integrity u_kr_grty_agent_file_integrity_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_file_integrity
    ADD CONSTRAINT u_kr_grty_agent_file_integrity_id PRIMARY KEY (agent_file_integrity_id);


--
-- Name: kr_agent_scan u_kr_gscn_agent_scan_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_scan
    ADD CONSTRAINT u_kr_gscn_agent_scan_id PRIMARY KEY (agent_scan_id);


--
-- Name: kr_agent_hardware_constraints_task_result u_kr_gslt_agent_hardware_constraints_task_result_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints_task_result
    ADD CONSTRAINT u_kr_gslt_agent_hardware_constraints_task_result_id PRIMARY KEY (agent_hardware_constraints_task_result_id);


--
-- Name: kr_agent_program_install_result u_kr_gslt_agent_program_install_result_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_result
    ADD CONSTRAINT u_kr_gslt_agent_program_install_result_id PRIMARY KEY (agent_program_install_result_id);


--
-- Name: kr_agent_message u_kr_gssg_agent_message_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_message
    ADD CONSTRAINT u_kr_gssg_agent_message_id PRIMARY KEY (agent_message_id);


--
-- Name: kr_agent_session u_kr_gssn_agent_session_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_session
    ADD CONSTRAINT u_kr_gssn_agent_session_id PRIMARY KEY (agent_session_id);


--
-- Name: kr_agent_operating_system u_kr_gstm_agent_operating_system_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_operating_system
    ADD CONSTRAINT u_kr_gstm_agent_operating_system_id PRIMARY KEY (agent_operating_system_id);


--
-- Name: kr_agent_patch u_kr_gtch_agent_patch_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_patch
    ADD CONSTRAINT u_kr_gtch_agent_patch_id PRIMARY KEY (agent_patch_id);


--
-- Name: kr_agent_program_install u_kr_gtll_agent_program_install_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install
    ADD CONSTRAINT u_kr_gtll_agent_program_install_id PRIMARY KEY (agent_program_install_id);


--
-- Name: kr_agent_installation_details u_kr_gtls_agent_installation_details_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_installation_details
    ADD CONSTRAINT u_kr_gtls_agent_installation_details_id PRIMARY KEY (agent_installation_details_id);


--
-- Name: kr_agent_remote_connection_setting u_kr_gtng_agent_remote_connection_setting_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_remote_connection_setting
    ADD CONSTRAINT u_kr_gtng_agent_remote_connection_setting_id PRIMARY KEY (agent_remote_connection_setting_id);


--
-- Name: kr_agent_software_metric u_kr_gtrc_agent_software_metric_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_software_metric
    ADD CONSTRAINT u_kr_gtrc_agent_software_metric_id PRIMARY KEY (agent_software_metric_id);


--
-- Name: kr_agent_hardware_history u_kr_gtry_agent_hardware_history_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_history
    ADD CONSTRAINT u_kr_gtry_agent_hardware_history_id PRIMARY KEY (agent_hardware_history_id);


--
-- Name: kr_agent_operation_history u_kr_gtry_agent_operation_history_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_operation_history
    ADD CONSTRAINT u_kr_gtry_agent_operation_history_id PRIMARY KEY (agent_operation_history_id);


--
-- Name: kr_agent_user_session_history u_kr_gtry_agent_user_session_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_session_history
    ADD CONSTRAINT u_kr_gtry_agent_user_session_id PRIMARY KEY (agent_user_session_id);


--
-- Name: kr_agent_hardware_constraints_task u_kr_gtsk_agent_hardware_constraints_task_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints_task
    ADD CONSTRAINT u_kr_gtsk_agent_hardware_constraints_task_id PRIMARY KEY (agent_hardware_constraints_task_id);


--
-- Name: kr_agent_hardware_constraints_last_status u_kr_gtts_agent_hardware_constraints_last_status_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints_last_status
    ADD CONSTRAINT u_kr_gtts_agent_hardware_constraints_last_status_id PRIMARY KEY (agent_hardware_constraints_last_status_id);


--
-- Name: kr_agent_hardware_constraints_last_status u_kr_gtts_agent_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_constraints_last_status
    ADD CONSTRAINT u_kr_gtts_agent_id UNIQUE (agent_id, agent_hardware_constraints_id);


--
-- Name: kr_agent_program_use_status u_kr_gtts_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_use_status
    ADD CONSTRAINT u_kr_gtts_id PRIMARY KEY (id);


--
-- Name: kr_agent_software u_kr_gtwr_agent_software_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_software
    ADD CONSTRAINT u_kr_gtwr_agent_software_id PRIMARY KEY (agent_software_id);


--
-- Name: kr_ldap_user u_kr_l_sr_dn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user
    ADD CONSTRAINT u_kr_l_sr_dn UNIQUE (dn);


--
-- Name: kr_ldap_user u_kr_l_sr_ldap_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user
    ADD CONSTRAINT u_kr_l_sr_ldap_user_id PRIMARY KEY (ldap_user_id);


--
-- Name: kr_ldap_user_policy u_kr_llcy_ldap_user_policy_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user_policy
    ADD CONSTRAINT u_kr_llcy_ldap_user_policy_id PRIMARY KEY (ldap_user_policy_id);


--
-- Name: kr_ldap_user_property u_kr_lrty_ldap_user_property_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user_property
    ADD CONSTRAINT u_kr_lrty_ldap_user_property_id PRIMARY KEY (ldap_user_property_id);


--
-- Name: kr_email_job u_kr_m_jb_email_job_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_email_job
    ADD CONSTRAINT u_kr_m_jb_email_job_id PRIMARY KEY (email_job_id);


--
-- Name: kr_inventory u_kr_ntry_agent_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_inventory
    ADD CONSTRAINT u_kr_ntry_agent_id UNIQUE (agent_id);


--
-- Name: kr_inventory u_kr_ntry_inventory_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_inventory
    ADD CONSTRAINT u_kr_ntry_inventory_id PRIMARY KEY (inventory_id);


--
-- Name: kr_inventory_activity u_kr_nvty_inventory_activity_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_inventory_activity
    ADD CONSTRAINT u_kr_nvty_inventory_activity_id PRIMARY KEY (inventory_activity_id);


--
-- Name: kr_program_file u_kr_p_fl_program_file_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_program_file
    ADD CONSTRAINT u_kr_p_fl_program_file_id PRIMARY KEY (program_file_id);


--
-- Name: kr_program_license u_kr_pcns_agent_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_program_license
    ADD CONSTRAINT u_kr_pcns_agent_id PRIMARY KEY (agent_id);


--
-- Name: kr_person u_kr_prsn_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_person
    ADD CONSTRAINT u_kr_prsn_email UNIQUE (email);


--
-- Name: kr_person u_kr_prsn_identification_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_person
    ADD CONSTRAINT u_kr_prsn_identification_number UNIQUE (identification_number);


--
-- Name: kr_person u_kr_prsn_person_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_person
    ADD CONSTRAINT u_kr_prsn_person_id PRIMARY KEY (person_id);


--
-- Name: kr_person u_kr_prsn_phone; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_person
    ADD CONSTRAINT u_kr_prsn_phone UNIQUE (phone);


--
-- Name: kr_process_history u_kr_ptry_process_history; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_process_history
    ADD CONSTRAINT u_kr_ptry_process_history PRIMARY KEY (process_history);


--
-- Name: kr_recording_timer u_kr_rtmr_recording_timer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_recording_timer
    ADD CONSTRAINT u_kr_rtmr_recording_timer_id PRIMARY KEY (recording_timer_id);


--
-- Name: kr_script_file u_kr_s_fl_script_file_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_script_file
    ADD CONSTRAINT u_kr_s_fl_script_file_id PRIMARY KEY (script_file_id);


--
-- Name: kr_script_task_detail u_kr_sdtl_script_task_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_script_task_detail
    ADD CONSTRAINT u_kr_sdtl_script_task_detail_id PRIMARY KEY (script_task_detail_id);


--
-- Name: kr_script_button_definition u_kr_sntn_script_button_definition_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_script_button_definition
    ADD CONSTRAINT u_kr_sntn_script_button_definition_id PRIMARY KEY (script_button_definition_id);


--
-- Name: kr_usb_definition u_kr_sntn_usb_definition_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_usb_definition
    ADD CONSTRAINT u_kr_sntn_usb_definition_id PRIMARY KEY (usb_definition_id);


--
-- Name: kr_system_exception u_kr_sptn_system_exception_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_system_exception
    ADD CONSTRAINT u_kr_sptn_system_exception_id PRIMARY KEY (system_exception_id);


--
-- Name: kr_task u_kr_task_task_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task
    ADD CONSTRAINT u_kr_task_task_id PRIMARY KEY (task_id);


--
-- Name: kr_auto_provision_detail u_kr_tdtl_auto_provision_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision_detail
    ADD CONSTRAINT u_kr_tdtl_auto_provision_detail_id PRIMARY KEY (auto_provision_detail_id);


--
-- Name: kr_task_sequence_detail u_kr_tdtl_task_sequence_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_detail
    ADD CONSTRAINT u_kr_tdtl_task_sequence_detail_id PRIMARY KEY (task_sequence_detail_id);


--
-- Name: kr_task_sequence_command u_kr_tmnd_task_sequence_command_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_command
    ADD CONSTRAINT u_kr_tmnd_task_sequence_command_id PRIMARY KEY (task_sequence_command_id);


--
-- Name: kr_task_sequence u_kr_tqnc_task_sequence_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence
    ADD CONSTRAINT u_kr_tqnc_task_sequence_id PRIMARY KEY (task_sequence_id);


--
-- Name: kr_task_sequence_result u_kr_tslt_task_sequence_result_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_result
    ADD CONSTRAINT u_kr_tslt_task_sequence_result_id PRIMARY KEY (task_sequence_result_id);


--
-- Name: kr_auto_agent_delete_history u_kr_ttry_auto_agent_delete_history_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_agent_delete_history
    ADD CONSTRAINT u_kr_ttry_auto_agent_delete_history_id PRIMARY KEY (auto_agent_delete_history_id);


--
-- Name: kr_auto_provision u_kr_tvsn_auto_provision_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision
    ADD CONSTRAINT u_kr_tvsn_auto_provision_id PRIMARY KEY (auto_provision_id);


--
-- Name: kr_watchdog_playbook_execution u_kr_wctn_watchdog_playbook_execution_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution
    ADD CONSTRAINT u_kr_wctn_watchdog_playbook_execution_id PRIMARY KEY (watchdog_playbook_execution_id);


--
-- Name: kr_watchdog_playbook_execution_detail u_kr_wdtl_watchdog_playbook_execution_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution_detail
    ADD CONSTRAINT u_kr_wdtl_watchdog_playbook_execution_detail_id PRIMARY KEY (watchdog_playbook_execution_detail_id);


--
-- Name: kr_watchdog_playbook_execution_result u_kr_wslt_watchdog_playbook_execution_result_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution_result
    ADD CONSTRAINT u_kr_wslt_watchdog_playbook_execution_result_id PRIMARY KEY (watchdog_playbook_execution_result_id);


--
-- Name: kr_watchdog_task u_kr_wtsk_watchdog_task_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_task
    ADD CONSTRAINT u_kr_wtsk_watchdog_task_id PRIMARY KEY (watchdog_task_id);


--
-- Name: kr_watchdog_playbook u_kr_wybk_watchdog_playbook_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook
    ADD CONSTRAINT u_kr_wybk_watchdog_playbook_id PRIMARY KEY (watchdog_playbook_id);


--
-- Name: ofmucconversationlog_msg_id; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucconversationlog_msg_id ON openfire.ofmucconversationlog USING btree (messageid);


--
-- Name: ofmucconversationlog_roomtime_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucconversationlog_roomtime_idx ON openfire.ofmucconversationlog USING btree (roomid, logtime);


--
-- Name: ofmucconversationlog_time_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucconversationlog_time_idx ON openfire.ofmucconversationlog USING btree (logtime);


--
-- Name: ofmucroom_roomid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucroom_roomid_idx ON openfire.ofmucroom USING btree (roomid);


--
-- Name: ofmucroom_serviceid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucroom_serviceid_idx ON openfire.ofmucroom USING btree (serviceid);


--
-- Name: ofmucservice_serviceid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofmucservice_serviceid_idx ON openfire.ofmucservice USING btree (serviceid);


--
-- Name: ofprivacylist_default_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofprivacylist_default_idx ON openfire.ofprivacylist USING btree (username, isdefault);


--
-- Name: ofpubsubnodegroups_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofpubsubnodegroups_idx ON openfire.ofpubsubnodegroups USING btree (serviceid, nodeid);


--
-- Name: ofroster_jid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofroster_jid_idx ON openfire.ofroster USING btree (jid);


--
-- Name: ofroster_username_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofroster_username_idx ON openfire.ofroster USING btree (username);


--
-- Name: ofrostergroups_rosterid_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofrostergroups_rosterid_idx ON openfire.ofrostergroups USING btree (rosterid);


--
-- Name: ofsecurityauditlog_tstamp_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofsecurityauditlog_tstamp_idx ON openfire.ofsecurityauditlog USING btree (entrystamp);


--
-- Name: ofsecurityauditlog_uname_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofsecurityauditlog_uname_idx ON openfire.ofsecurityauditlog USING btree (username);


--
-- Name: ofuser_cdate_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofuser_cdate_idx ON openfire.ofuser USING btree (creationdate);


--
-- Name: ofuserflag_etime_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofuserflag_etime_idx ON openfire.ofuserflag USING btree (endtime);


--
-- Name: ofuserflag_stime_idx; Type: INDEX; Schema: openfire; Owner: postgres
--

CREATE INDEX ofuserflag_stime_idx ON openfire.ofuserflag USING btree (starttime);


--
-- Name: emre; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emre ON public.kr_command USING btree (dn_type);


--
-- Name: i_kr_cmnd_task; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_cmnd_task ON public.kr_command USING btree (task_id);


--
-- Name: i_kr_fsfr_task; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_fsfr_task ON public.kr_file_transfer USING btree (task_id);


--
-- Name: i_kr_gctn_agentcollection; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gctn_agentcollection ON public.kr_agent_collection USING btree (parent_id);


--
-- Name: i_kr_gkng_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gkng_agent ON public.kr_agent_file_tracking USING btree (agent_id);


--
-- Name: i_kr_gldr_parentfolder; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gldr_parentfolder ON public.kr_agent_folder USING btree (parent_id);


--
-- Name: i_kr_gmtn_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gmtn_agent ON public.kr_agent_vulnerability_network_information USING btree (agent_id);


--
-- Name: i_kr_gslt_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gslt_agent ON public.kr_agent_hardware_constraints_task_result USING btree (agent_id);


--
-- Name: i_kr_gslt_agenthardwareconstraints; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gslt_agenthardwareconstraints ON public.kr_agent_hardware_constraints_task_result USING btree (agent_hardware_constraints_id);


--
-- Name: i_kr_gslt_agenthardwareconstraintstask; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gslt_agenthardwareconstraintstask ON public.kr_agent_hardware_constraints_task_result USING btree (agent_hardware_constraints_task_id);


--
-- Name: i_kr_gtsk_agenthardwareconstraints; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gtsk_agenthardwareconstraints ON public.kr_agent_hardware_constraints_task USING btree (agent_hardware_constraints_id);


--
-- Name: i_kr_gtts_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gtts_agent ON public.kr_agent_hardware_constraints_last_status USING btree (agent_id);


--
-- Name: i_kr_gtts_agenthardwareconstraints; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gtts_agenthardwareconstraints ON public.kr_agent_hardware_constraints_last_status USING btree (agent_hardware_constraints_id);


--
-- Name: i_kr_ntry_lastinventoryactivity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_ntry_lastinventoryactivity ON public.kr_inventory USING btree (last_inventory_activity_id);


--
-- Name: i_kr_nvty_inventory; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_nvty_inventory ON public.kr_inventory_activity USING btree (inventory_id);


--
-- Name: i_kr_nvty_person; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_nvty_person ON public.kr_inventory_activity USING btree (person_id);


--
-- Name: i_kr_prsn_ldapuser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_prsn_ldapuser ON public.kr_person USING btree (ldap_user_id);


--
-- Name: i_kr_rlst_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_rlst_agent ON public.kr_rdp_recorder_list USING btree (agent_id);


--
-- Name: i_kr_rtry_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_rtry_agent ON public.kr_rdp_recorder_history USING btree (agent_id);


--
-- Name: i_kr_tmnd_tasksequence; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_tmnd_tasksequence ON public.kr_task_sequence_command USING btree (task_sequence_id);


--
-- Name: i_kr_ttry_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_ttry_agent ON public.kr_auto_agent_delete_history USING btree (agent_id);


--
-- Name: ofrostergroups ofrostergroups_rosterid_fk; Type: FK CONSTRAINT; Schema: openfire; Owner: postgres
--

ALTER TABLE ONLY openfire.ofrostergroups
    ADD CONSTRAINT ofrostergroups_rosterid_fk FOREIGN KEY (rosterid) REFERENCES openfire.ofroster(rosterid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: kr_agent_critical_process kr_agent_critical_process_agent_critical_record_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_critical_process
    ADD CONSTRAINT kr_agent_critical_process_agent_critical_record_id_fkey FOREIGN KEY (agent_critical_record_id) REFERENCES public.kr_agent_critical_record(agent_critical_record_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_critical_record kr_agent_critical_record_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_critical_record
    ADD CONSTRAINT kr_agent_critical_record_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_disk_usage kr_agent_disk_usage_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_disk_usage
    ADD CONSTRAINT kr_agent_disk_usage_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_event_log kr_agent_event_log_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_event_log
    ADD CONSTRAINT kr_agent_event_log_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_event_log_detail kr_agent_event_log_detail_agent_event_log_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_event_log_detail
    ADD CONSTRAINT kr_agent_event_log_detail_agent_event_log_id_fkey FOREIGN KEY (agent_event_log_id) REFERENCES public.kr_agent_event_log(agent_event_log_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_file_integrity kr_agent_file_integrity_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_file_integrity
    ADD CONSTRAINT kr_agent_file_integrity_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_hardware kr_agent_hardware_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware
    ADD CONSTRAINT kr_agent_hardware_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_hardware_history kr_agent_hardware_history_agent_hardware_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_hardware_history
    ADD CONSTRAINT kr_agent_hardware_history_agent_hardware_id_fkey FOREIGN KEY (agent_hardware_id) REFERENCES public.kr_agent_hardware(agent_hardware_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_message_detail kr_agent_message_detail_agent_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_message_detail
    ADD CONSTRAINT kr_agent_message_detail_agent_message_id_fkey FOREIGN KEY (agent_message_id) REFERENCES public.kr_agent_message(agent_message_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_operating_system kr_agent_operating_system_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_operating_system
    ADD CONSTRAINT kr_agent_operating_system_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_operation_history kr_agent_operation_history_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_operation_history
    ADD CONSTRAINT kr_agent_operation_history_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_patch kr_agent_patch_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_patch
    ADD CONSTRAINT kr_agent_patch_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_policy_tracking kr_agent_policy_tracking_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_policy_tracking
    ADD CONSTRAINT kr_agent_policy_tracking_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_policy_tracking_detail kr_agent_policy_tracking_detail_agent_policy_tracking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_policy_tracking_detail
    ADD CONSTRAINT kr_agent_policy_tracking_detail_agent_policy_tracking_id_fkey FOREIGN KEY (agent_policy_tracking_id) REFERENCES public.kr_agent_policy_tracking(agent_policy_tracking_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_port_alarm kr_agent_port_alarm_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_port_alarm
    ADD CONSTRAINT kr_agent_port_alarm_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_program_install_detail kr_agent_program_install_detail_agent_program_install_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_detail
    ADD CONSTRAINT kr_agent_program_install_detail_agent_program_install_id_fkey FOREIGN KEY (agent_program_install_id) REFERENCES public.kr_agent_program_install(agent_program_install_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_program_install_result kr_agent_program_install_resu_agent_program_install_detail_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_install_result
    ADD CONSTRAINT kr_agent_program_install_resu_agent_program_install_detail_fkey FOREIGN KEY (agent_program_install_detail_id) REFERENCES public.kr_agent_program_install_detail(agent_program_install_detail_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_program_restriction_detail kr_agent_program_restriction__agent_program_restriction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_restriction_detail
    ADD CONSTRAINT kr_agent_program_restriction__agent_program_restriction_id_fkey FOREIGN KEY (agent_program_restriction_id) REFERENCES public.kr_agent_program_restriction(id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_program_uninstall_detail_results kr_agent_program_uninstall_de_agent_program_uninstall_deta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall_detail_results
    ADD CONSTRAINT kr_agent_program_uninstall_de_agent_program_uninstall_deta_fkey FOREIGN KEY (agent_program_uninstall_detail_id) REFERENCES public.kr_agent_program_uninstall_detail(id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_program_uninstall_detail kr_agent_program_uninstall_deta_agent_program_uninstall_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall_detail
    ADD CONSTRAINT kr_agent_program_uninstall_deta_agent_program_uninstall_id_fkey FOREIGN KEY (agent_program_uninstall_id) REFERENCES public.kr_agent_program_uninstall(id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_program_uninstall_detail kr_agent_program_uninstall_detail_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_program_uninstall_detail
    ADD CONSTRAINT kr_agent_program_uninstall_detail_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_quarantine_history kr_agent_quarantine_history_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_quarantine_history
    ADD CONSTRAINT kr_agent_quarantine_history_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_remote_connection kr_agent_remote_connection_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_remote_connection
    ADD CONSTRAINT kr_agent_remote_connection_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_service_alarm kr_agent_service_alarm_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_service_alarm
    ADD CONSTRAINT kr_agent_service_alarm_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_session kr_agent_session_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_session
    ADD CONSTRAINT kr_agent_session_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_software kr_agent_software_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_software
    ADD CONSTRAINT kr_agent_software_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_software_metric kr_agent_software_metric_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_software_metric
    ADD CONSTRAINT kr_agent_software_metric_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_usb_block kr_agent_usb_block_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_block
    ADD CONSTRAINT kr_agent_usb_block_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_usb_file kr_agent_usb_file_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_file
    ADD CONSTRAINT kr_agent_usb_file_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_usb_tracking kr_agent_usb_tracking_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_usb_tracking
    ADD CONSTRAINT kr_agent_usb_tracking_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_user kr_agent_user_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user
    ADD CONSTRAINT kr_agent_user_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_user_login_log kr_agent_user_login_log_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_login_log
    ADD CONSTRAINT kr_agent_user_login_log_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON UPDATE SET DEFAULT ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_user_session_history kr_agent_user_session_history_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_session_history
    ADD CONSTRAINT kr_agent_user_session_history_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON UPDATE SET DEFAULT ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_vulnerability kr_agent_vulnerability_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability
    ADD CONSTRAINT kr_agent_vulnerability_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_vulnerability_detail kr_agent_vulnerability_detail_agent_vulnerability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability_detail
    ADD CONSTRAINT kr_agent_vulnerability_detail_agent_vulnerability_id_fkey FOREIGN KEY (agent_vulnerability_id) REFERENCES public.kr_agent_vulnerability(agent_vulnerability_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_vulnerability_host kr_agent_vulnerability_host_agent_vulnerability_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_vulnerability_host
    ADD CONSTRAINT kr_agent_vulnerability_host_agent_vulnerability_id_fkey FOREIGN KEY (agent_vulnerability_id) REFERENCES public.kr_agent_vulnerability(agent_vulnerability_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_auto_provision_detail kr_auto_provision_detail_agent_program_install_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision_detail
    ADD CONSTRAINT kr_auto_provision_detail_agent_program_install_detail_id_fkey FOREIGN KEY (agent_program_install_detail_id) REFERENCES public.kr_agent_program_install_detail(agent_program_install_detail_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_auto_provision_detail kr_auto_provision_detail_auto_provision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision_detail
    ADD CONSTRAINT kr_auto_provision_detail_auto_provision_id_fkey FOREIGN KEY (auto_provision_id) REFERENCES public.kr_auto_provision(auto_provision_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_auto_provision_detail kr_auto_provision_detail_command_execution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision_detail
    ADD CONSTRAINT kr_auto_provision_detail_command_execution_id_fkey FOREIGN KEY (command_execution_id) REFERENCES public.kr_command_execution(command_execution_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_auto_provision kr_auto_provision_program_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision
    ADD CONSTRAINT kr_auto_provision_program_file_id_fkey FOREIGN KEY (program_file_id) REFERENCES public.kr_program_file(program_file_id) ON UPDATE SET DEFAULT ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_auto_provision kr_auto_provision_script_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_auto_provision
    ADD CONSTRAINT kr_auto_provision_script_file_id_fkey FOREIGN KEY (script_file_id) REFERENCES public.kr_script_file(script_file_id) ON UPDATE SET DEFAULT ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_city kr_city_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_city
    ADD CONSTRAINT kr_city_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.kr_country(country_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_command_execution kr_command_execution_command_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command_execution
    ADD CONSTRAINT kr_command_execution_command_id_fkey FOREIGN KEY (command_id) REFERENCES public.kr_command(command_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_command_execution_result kr_command_execution_result_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command_execution_result
    ADD CONSTRAINT kr_command_execution_result_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_command_execution_result kr_command_execution_result_command_execution_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_command_execution_result
    ADD CONSTRAINT kr_command_execution_result_command_execution_id_fkey FOREIGN KEY (command_execution_id) REFERENCES public.kr_command_execution(command_execution_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_email_job kr_email_job_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_email_job
    ADD CONSTRAINT kr_email_job_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_file_transfer_detail kr_file_transfer_detail_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_detail
    ADD CONSTRAINT kr_file_transfer_detail_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_file_transfer_detail kr_file_transfer_detail_file_transfer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_detail
    ADD CONSTRAINT kr_file_transfer_detail_file_transfer_id_fkey FOREIGN KEY (file_transfer_id) REFERENCES public.kr_file_transfer(file_transfer_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_file_transfer_schedule kr_file_transfer_schedule_file_transfer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_schedule
    ADD CONSTRAINT kr_file_transfer_schedule_file_transfer_id_fkey FOREIGN KEY (file_transfer_id) REFERENCES public.kr_file_transfer(file_transfer_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_inventory kr_inventory_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_inventory
    ADD CONSTRAINT kr_inventory_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_ldap_user_policy kr_ldap_user_policy_ldapuser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user_policy
    ADD CONSTRAINT kr_ldap_user_policy_ldapuser_fkey FOREIGN KEY (ldapuser) REFERENCES public.kr_ldap_user(ldap_user_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_ldap_user_policy kr_ldap_user_policy_policy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user_policy
    ADD CONSTRAINT kr_ldap_user_policy_policy_id_fkey FOREIGN KEY (policy_id) REFERENCES public.kr_script_file(script_file_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_ldap_user_property kr_ldap_user_property_ldap_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_ldap_user_property
    ADD CONSTRAINT kr_ldap_user_property_ldap_user_id_fkey FOREIGN KEY (ldap_user_id) REFERENCES public.kr_ldap_user(ldap_user_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_rdp_recorder kr_rdp_recorder_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder
    ADD CONSTRAINT kr_rdp_recorder_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) DEFERRABLE;


--
-- Name: kr_rdp_recorder_history kr_rdp_recorder_history_rdp_recorder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder_history
    ADD CONSTRAINT kr_rdp_recorder_history_rdp_recorder_id_fkey FOREIGN KEY (rdp_recorder_id) REFERENCES public.kr_rdp_recorder(id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_recording_timer kr_recording_timer_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_recording_timer
    ADD CONSTRAINT kr_recording_timer_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_script_button_definition kr_script_button_definition_script_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_script_button_definition
    ADD CONSTRAINT kr_script_button_definition_script_id_fkey FOREIGN KEY (script_id) REFERENCES public.kr_script_file(script_file_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_task_sequence_detail kr_task_sequence_detail_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_detail
    ADD CONSTRAINT kr_task_sequence_detail_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_task_sequence_detail kr_task_sequence_detail_task_sequence_command_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_detail
    ADD CONSTRAINT kr_task_sequence_detail_task_sequence_command_id_fkey FOREIGN KEY (task_sequence_command_id) REFERENCES public.kr_task_sequence_command(task_sequence_command_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_task_sequence_result kr_task_sequence_result_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_result
    ADD CONSTRAINT kr_task_sequence_result_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_task_sequence_result kr_task_sequence_result_task_sequence_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_task_sequence_result
    ADD CONSTRAINT kr_task_sequence_result_task_sequence_detail_id_fkey FOREIGN KEY (task_sequence_detail_id) REFERENCES public.kr_task_sequence_detail(task_sequence_detail_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_watchdog_playbook_execution_result kr_watchdog_playbook_executi_watchdog_playbook_execution__fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution_result
    ADD CONSTRAINT kr_watchdog_playbook_executi_watchdog_playbook_execution__fkey1 FOREIGN KEY (watchdog_playbook_execution_detail_id) REFERENCES public.kr_watchdog_playbook_execution_detail(watchdog_playbook_execution_detail_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_watchdog_playbook_execution_detail kr_watchdog_playbook_executio_watchdog_playbook_execution__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution_detail
    ADD CONSTRAINT kr_watchdog_playbook_executio_watchdog_playbook_execution__fkey FOREIGN KEY (watchdog_playbook_execution_id) REFERENCES public.kr_watchdog_playbook_execution(watchdog_playbook_execution_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_watchdog_playbook_execution kr_watchdog_playbook_execution_agent_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution
    ADD CONSTRAINT kr_watchdog_playbook_execution_agent_collection_id_fkey FOREIGN KEY (agent_collection_id) REFERENCES public.kr_agent_collection(agent_collection_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_watchdog_playbook_execution_detail kr_watchdog_playbook_execution_detail_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution_detail
    ADD CONSTRAINT kr_watchdog_playbook_execution_detail_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_watchdog_playbook_execution kr_watchdog_playbook_execution_watchdog_playbook_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_watchdog_playbook_execution
    ADD CONSTRAINT kr_watchdog_playbook_execution_watchdog_playbook_id_fkey FOREIGN KEY (watchdog_playbook_id) REFERENCES public.kr_watchdog_playbook(watchdog_playbook_id) ON DELETE CASCADE DEFERRABLE;


--
-- PostgreSQL database dump complete
--


