--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-1.pgdg120+1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-1.pgdg120+1)
\c karcin_pam
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
-- Name: kr_agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent (
    agent_id bigint NOT NULL,
    agent_version character varying(255),
    client_agent_id bigint,
    client_status boolean,
    create_date timestamp without time zone,
    is_deleted boolean,
    description text,
    dn character varying(255),
    domain_name character varying(255),
    domain_status boolean,
    hostname character varying(255),
    ip_address character varying(255),
    jid character varying(255),
    license_status boolean,
    modify_date timestamp without time zone,
    operating_system character varying(255),
    password character varying(255),
    protocol character varying(255),
    rdp_port character varying(255),
    service_version character varying(255),
    ssh_port character varying(255),
    tags text,
    telnet_port character varying(255),
    trusted_status integer,
    username character varying(255),
    vnc_port character varying(255),
    version bigint,
    folder_id bigint
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
-- Name: kr_agent_auth_management_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_auth_management_user (
    agent_auth_management_user_id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    external_user boolean,
    institution_name character varying(255),
    modify_date timestamp without time zone,
    operator character varying(255),
    remote_connection_permission character varying(255),
    username character varying(255),
    version bigint,
    agent_id bigint
);


ALTER TABLE public.kr_agent_auth_management_user OWNER TO postgres;

--
-- Name: kr_agent_auth_management_user_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_auth_management_user_detail (
    agent_auth_management_user_detail_id bigint NOT NULL,
    authorization_status boolean,
    connection_count bigint,
    unlimited_connection_limit boolean,
    connection_limit_count bigint,
    createdate timestamp without time zone,
    is_deleted boolean,
    duration_limit character varying(255),
    duration_type character varying(20),
    end_date timestamp without time zone,
    file_transfer_authotization boolean,
    mail_sending boolean,
    modify_date timestamp without time zone,
    operator character varying(255),
    protocol character varying(20),
    start_date timestamp without time zone,
    unlimitedrequest boolean,
    verification boolean,
    version bigint,
    agent_auth_management_user_id bigint,
    case_user_id bigint,
    connection_request_id bigint,
    external_user_request_code_id bigint
);


ALTER TABLE public.kr_agent_auth_management_user_detail OWNER TO postgres;

--
-- Name: kr_agent_auth_management_user_agent_auth_management_user_de_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_auth_management_user_agent_auth_management_user_de_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_auth_management_user_agent_auth_management_user_de_seq OWNER TO postgres;

--
-- Name: kr_agent_auth_management_user_agent_auth_management_user_de_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_auth_management_user_agent_auth_management_user_de_seq OWNED BY public.kr_agent_auth_management_user_detail.agent_auth_management_user_detail_id;


--
-- Name: kr_agent_auth_management_user_agent_auth_management_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_auth_management_user_agent_auth_management_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_auth_management_user_agent_auth_management_user_id_seq OWNER TO postgres;

--
-- Name: kr_agent_auth_management_user_agent_auth_management_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_auth_management_user_agent_auth_management_user_id_seq OWNED BY public.kr_agent_auth_management_user.agent_auth_management_user_id;


--
-- Name: kr_agent_authorization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_authorization (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    externaluser boolean,
    operator character varying(255),
    status boolean,
    username character varying(255),
    version bigint,
    agent_id bigint
);


ALTER TABLE public.kr_agent_authorization OWNER TO postgres;

--
-- Name: kr_agent_authorization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_authorization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_authorization_id_seq OWNER TO postgres;

--
-- Name: kr_agent_authorization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_authorization_id_seq OWNED BY public.kr_agent_authorization.id;


--
-- Name: kr_agent_case_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_case_user (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    version bigint,
    agent_id bigint,
    case_user_id bigint
);


ALTER TABLE public.kr_agent_case_user OWNER TO postgres;

--
-- Name: kr_agent_case_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_case_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_case_user_id_seq OWNER TO postgres;

--
-- Name: kr_agent_case_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_case_user_id_seq OWNED BY public.kr_agent_case_user.id;


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
-- Name: kr_agent_remote_connection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_remote_connection (
    agent_remote_connection_id bigint NOT NULL,
    connection_username character varying(255),
    create_date timestamp without time zone NOT NULL,
    is_deleted boolean,
    end_date timestamp without time zone,
    guacamole_id character varying(255),
    history_type character varying(20),
    identifier character varying(255),
    record_name character varying(255),
    session_status character varying(255),
    status character varying(255),
    token character varying(255),
    remote_connection_type character varying(20),
    username character varying(255),
    version bigint,
    agent_id bigint
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
-- Name: kr_agent_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_session (
    agent_session_id bigint NOT NULL,
    client_record_id bigint,
    create_date timestamp without time zone,
    is_deleted boolean,
    login_date timestamp without time zone,
    logoff_date timestamp without time zone,
    version bigint,
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
-- Name: kr_agent_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_status (
    agent_status_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    last_online_date timestamp without time zone,
    last_response_time double precision,
    lost_average bigint,
    is_online boolean,
    status character varying(255),
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_status OWNER TO postgres;

--
-- Name: kr_agent_status_agent_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_status_agent_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_status_agent_status_id_seq OWNER TO postgres;

--
-- Name: kr_agent_status_agent_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_status_agent_status_id_seq OWNED BY public.kr_agent_status.agent_status_id;


--
-- Name: kr_agent_status_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_status_history (
    agent_status_history_id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    offline_date timestamp without time zone,
    online_date timestamp without time zone,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_agent_status_history OWNER TO postgres;

--
-- Name: kr_agent_status_history_agent_status_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_status_history_agent_status_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_status_history_agent_status_history_id_seq OWNER TO postgres;

--
-- Name: kr_agent_status_history_agent_status_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_status_history_agent_status_history_id_seq OWNED BY public.kr_agent_status_history.agent_status_history_id;


--
-- Name: kr_agent_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_user (
    agent_user_id bigint NOT NULL,
    agent_send_date timestamp without time zone,
    caseuser boolean,
    client_record_id bigint,
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
-- Name: kr_agent_user_agent_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_agent_user_agent_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_agent_user_agent_user_id_seq OWNER TO postgres;

--
-- Name: kr_agent_user_agent_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_agent_user_agent_user_id_seq OWNED BY public.kr_agent_user.agent_user_id;


--
-- Name: kr_agent_user_session_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_agent_user_session_history (
    agent_user_session_id bigint NOT NULL,
    client_record_id bigint,
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
-- Name: kr_case_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_case_user (
    case_user_id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    name character varying(255),
    operator character varying(255),
    protocol character varying(255),
    sessionuser boolean,
    status boolean,
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_case_user OWNER TO postgres;

--
-- Name: kr_case_user_case_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_case_user_case_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_case_user_case_user_id_seq OWNER TO postgres;

--
-- Name: kr_case_user_case_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_case_user_case_user_id_seq OWNED BY public.kr_case_user.case_user_id;


--
-- Name: kr_collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_collection (
    id bigint NOT NULL,
    collection_type character varying(20),
    create_date timestamp without time zone,
    is_deleted boolean,
    description character varying(255),
    filters text,
    name character varying(255),
    version bigint,
    parent_id bigint
);


ALTER TABLE public.kr_collection OWNER TO postgres;

--
-- Name: kr_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_collection_id_seq OWNER TO postgres;

--
-- Name: kr_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_collection_id_seq OWNED BY public.kr_collection.id;


--
-- Name: kr_connection_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_connection_request (
    connection_request_id bigint NOT NULL,
    accept_date timestamp without time zone,
    unlimited_connection_limit boolean,
    connection_limit_count bigint,
    status character varying(20),
    createdate timestamp without time zone,
    is_deleted boolean,
    description character varying(1000),
    duration_limit character varying(255),
    duration_type character varying(20),
    email character varying(255),
    email_verification boolean,
    end_date timestamp without time zone,
    file_transfer_authotization boolean,
    institutionname character varying(255),
    modify_date timestamp without time zone,
    operator character varying(255),
    protocol character varying(255),
    reject_date timestamp without time zone,
    reject_description character varying(1000),
    right_of_entry character varying(255),
    sms_verification boolean,
    start_date timestamp without time zone,
    unlimitedrequest boolean,
    verification_status boolean,
    version bigint,
    agent_id bigint,
    case_user_id bigint
);


ALTER TABLE public.kr_connection_request OWNER TO postgres;

--
-- Name: kr_connection_request_connection_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_connection_request_connection_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_connection_request_connection_request_id_seq OWNER TO postgres;

--
-- Name: kr_connection_request_connection_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_connection_request_connection_request_id_seq OWNED BY public.kr_connection_request.connection_request_id;


--
-- Name: kr_connection_request_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_connection_request_detail (
    connection_request_detail_id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    modify_date timestamp without time zone,
    operator character varying(255),
    protocol character varying(255),
    version bigint,
    connection_request_id bigint,
    agent_id bigint
);


ALTER TABLE public.kr_connection_request_detail OWNER TO postgres;

--
-- Name: kr_connection_request_detail_connection_request_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_connection_request_detail_connection_request_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_connection_request_detail_connection_request_detail_id_seq OWNER TO postgres;

--
-- Name: kr_connection_request_detail_connection_request_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_connection_request_detail_connection_request_detail_id_seq OWNED BY public.kr_connection_request_detail.connection_request_detail_id;


--
-- Name: kr_external_user_request_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_external_user_request_code (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    request_code character varying(255),
    user0 character varying(255),
    version bigint,
    agent_auth_management_user_detail_id bigint,
    connection_request_id bigint
);


ALTER TABLE public.kr_external_user_request_code OWNER TO postgres;

--
-- Name: kr_external_user_request_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_external_user_request_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_external_user_request_code_id_seq OWNER TO postgres;

--
-- Name: kr_external_user_request_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_external_user_request_code_id_seq OWNED BY public.kr_external_user_request_code.id;


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
    version bigint
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
    agent_id bigint NOT NULL,
    file_transfer_id bigint
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
-- Name: kr_log_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_log_operations (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    log_type character varying(20),
    message text,
    operator character varying(255),
    status character varying(255),
    version bigint,
    agent_id bigint
);


ALTER TABLE public.kr_log_operations OWNER TO postgres;

--
-- Name: kr_log_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_log_operations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_log_operations_id_seq OWNER TO postgres;

--
-- Name: kr_log_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_log_operations_id_seq OWNED BY public.kr_log_operations.id;


--
-- Name: kr_pam_general_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_pam_general_history (
    pam_general_history_id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    history_type character varying(20),
    value text,
    version bigint
);


ALTER TABLE public.kr_pam_general_history OWNER TO postgres;

--
-- Name: kr_pam_general_history_pam_general_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_pam_general_history_pam_general_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_pam_general_history_pam_general_history_id_seq OWNER TO postgres;

--
-- Name: kr_pam_general_history_pam_general_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_pam_general_history_pam_general_history_id_seq OWNED BY public.kr_pam_general_history.pam_general_history_id;


--
-- Name: kr_password_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_password_history (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    password character varying(255),
    is_periodic boolean,
    username character varying(255),
    version bigint,
    case_user_id bigint
);


ALTER TABLE public.kr_password_history OWNER TO postgres;

--
-- Name: kr_password_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_password_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_password_history_id_seq OWNER TO postgres;

--
-- Name: kr_password_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_password_history_id_seq OWNED BY public.kr_password_history.id;


--
-- Name: kr_periodic_password_definition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_periodic_password_definition (
    periodic_password_definition_id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    operator character varying(255),
    period character varying(255),
    version bigint
);


ALTER TABLE public.kr_periodic_password_definition OWNER TO postgres;

--
-- Name: kr_periodic_password_definiti_periodic_password_definition__seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_periodic_password_definiti_periodic_password_definition__seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_periodic_password_definiti_periodic_password_definition__seq OWNER TO postgres;

--
-- Name: kr_periodic_password_definiti_periodic_password_definition__seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_periodic_password_definiti_periodic_password_definition__seq OWNED BY public.kr_periodic_password_definition.periodic_password_definition_id;


--
-- Name: kr_periodic_password_definition_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_periodic_password_definition_detail (
    periodic_password_definition_detail_id bigint NOT NULL,
    createdate timestamp without time zone,
    is_deleted boolean,
    last_modify_date timestamp without time zone,
    operator character varying(255),
    period character varying(255),
    version bigint,
    case_user_id bigint NOT NULL,
    periodic_password_definition_id bigint NOT NULL
);


ALTER TABLE public.kr_periodic_password_definition_detail OWNER TO postgres;

--
-- Name: kr_periodic_password_definiti_periodic_password_definition_seq1; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_periodic_password_definiti_periodic_password_definition_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_periodic_password_definiti_periodic_password_definition_seq1 OWNER TO postgres;

--
-- Name: kr_periodic_password_definiti_periodic_password_definition_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_periodic_password_definiti_periodic_password_definition_seq1 OWNED BY public.kr_periodic_password_definition_detail.periodic_password_definition_detail_id;


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
-- Name: kr_user_authorization_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_authorization_log (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    log_type character varying(20),
    operator character varying(255),
    username character varying(255),
    version bigint,
    agent_id bigint,
    agent_auth_user_management_detail_id bigint,
    case_user_id bigint
);


ALTER TABLE public.kr_user_authorization_log OWNER TO postgres;

--
-- Name: kr_user_authorization_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_user_authorization_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_user_authorization_log_id_seq OWNER TO postgres;

--
-- Name: kr_user_authorization_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_user_authorization_log_id_seq OWNED BY public.kr_user_authorization_log.id;


--
-- Name: kr_user_process_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_process_report (
    id bigint NOT NULL,
    approve boolean,
    approve_date timestamp without time zone,
    approve_operator character varying(255),
    create_date timestamp without time zone,
    is_deleted boolean,
    mail_status boolean,
    message text,
    operator character varying(255),
    reject_date timestamp without time zone,
    reject_description character varying(1000),
    send_mail boolean,
    version bigint,
    agent_id bigint NOT NULL
);


ALTER TABLE public.kr_user_process_report OWNER TO postgres;

--
-- Name: kr_user_process_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_user_process_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_user_process_report_id_seq OWNER TO postgres;

--
-- Name: kr_user_process_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_user_process_report_id_seq OWNED BY public.kr_user_process_report.id;


--
-- Name: kr_user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_session (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    login_date timestamp without time zone,
    logoff_date timestamp without time zone,
    name character varying(255),
    online boolean,
    surname character varying(255),
    username character varying(255),
    version bigint
);


ALTER TABLE public.kr_user_session OWNER TO postgres;

--
-- Name: kr_user_session_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kr_user_session_history (
    id bigint NOT NULL,
    create_date timestamp without time zone,
    is_deleted boolean,
    login_date timestamp without time zone,
    logoff_date timestamp without time zone,
    name character varying(255),
    surname character varying(255),
    username character varying(255),
    version bigint,
    user_session_id bigint NOT NULL
);


ALTER TABLE public.kr_user_session_history OWNER TO postgres;

--
-- Name: kr_user_session_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_user_session_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_user_session_history_id_seq OWNER TO postgres;

--
-- Name: kr_user_session_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_user_session_history_id_seq OWNED BY public.kr_user_session_history.id;


--
-- Name: kr_user_session_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kr_user_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kr_user_session_id_seq OWNER TO postgres;

--
-- Name: kr_user_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kr_user_session_id_seq OWNED BY public.kr_user_session.id;


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
-- Name: kr_agent agent_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent ALTER COLUMN agent_id SET DEFAULT nextval('public.kr_agent_agent_id_seq'::regclass);


--
-- Name: kr_agent_auth_management_user agent_auth_management_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_auth_management_user ALTER COLUMN agent_auth_management_user_id SET DEFAULT nextval('public.kr_agent_auth_management_user_agent_auth_management_user_id_seq'::regclass);


--
-- Name: kr_agent_auth_management_user_detail agent_auth_management_user_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_auth_management_user_detail ALTER COLUMN agent_auth_management_user_detail_id SET DEFAULT nextval('public.kr_agent_auth_management_user_agent_auth_management_user_de_seq'::regclass);


--
-- Name: kr_agent_authorization id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_authorization ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_authorization_id_seq'::regclass);


--
-- Name: kr_agent_case_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_case_user ALTER COLUMN id SET DEFAULT nextval('public.kr_agent_case_user_id_seq'::regclass);


--
-- Name: kr_agent_folder agent_folder_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_folder ALTER COLUMN agent_folder_id SET DEFAULT nextval('public.kr_agent_folder_agent_folder_id_seq'::regclass);


--
-- Name: kr_agent_operating_system agent_operating_system_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_operating_system ALTER COLUMN agent_operating_system_id SET DEFAULT nextval('public.kr_agent_operating_system_agent_operating_system_id_seq'::regclass);


--
-- Name: kr_agent_remote_connection agent_remote_connection_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_remote_connection ALTER COLUMN agent_remote_connection_id SET DEFAULT nextval('public.kr_agent_remote_connection_agent_remote_connection_id_seq'::regclass);


--
-- Name: kr_agent_session agent_session_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_session ALTER COLUMN agent_session_id SET DEFAULT nextval('public.kr_agent_session_agent_session_id_seq'::regclass);


--
-- Name: kr_agent_status agent_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_status ALTER COLUMN agent_status_id SET DEFAULT nextval('public.kr_agent_status_agent_status_id_seq'::regclass);


--
-- Name: kr_agent_status_history agent_status_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_status_history ALTER COLUMN agent_status_history_id SET DEFAULT nextval('public.kr_agent_status_history_agent_status_history_id_seq'::regclass);


--
-- Name: kr_agent_user agent_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user ALTER COLUMN agent_user_id SET DEFAULT nextval('public.kr_agent_user_agent_user_id_seq'::regclass);


--
-- Name: kr_agent_user_session_history agent_user_session_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_session_history ALTER COLUMN agent_user_session_id SET DEFAULT nextval('public.kr_agent_user_session_history_agent_user_session_id_seq'::regclass);


--
-- Name: kr_case_user case_user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_case_user ALTER COLUMN case_user_id SET DEFAULT nextval('public.kr_case_user_case_user_id_seq'::regclass);


--
-- Name: kr_collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_collection ALTER COLUMN id SET DEFAULT nextval('public.kr_collection_id_seq'::regclass);


--
-- Name: kr_connection_request connection_request_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_connection_request ALTER COLUMN connection_request_id SET DEFAULT nextval('public.kr_connection_request_connection_request_id_seq'::regclass);


--
-- Name: kr_connection_request_detail connection_request_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_connection_request_detail ALTER COLUMN connection_request_detail_id SET DEFAULT nextval('public.kr_connection_request_detail_connection_request_detail_id_seq'::regclass);


--
-- Name: kr_external_user_request_code id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_external_user_request_code ALTER COLUMN id SET DEFAULT nextval('public.kr_external_user_request_code_id_seq'::regclass);


--
-- Name: kr_file_transfer file_transfer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer ALTER COLUMN file_transfer_id SET DEFAULT nextval('public.kr_file_transfer_file_transfer_id_seq'::regclass);


--
-- Name: kr_file_transfer_detail file_transfer_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_detail ALTER COLUMN file_transfer_detail_id SET DEFAULT nextval('public.kr_file_transfer_detail_file_transfer_detail_id_seq'::regclass);


--
-- Name: kr_log_operations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_log_operations ALTER COLUMN id SET DEFAULT nextval('public.kr_log_operations_id_seq'::regclass);


--
-- Name: kr_pam_general_history pam_general_history_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pam_general_history ALTER COLUMN pam_general_history_id SET DEFAULT nextval('public.kr_pam_general_history_pam_general_history_id_seq'::regclass);


--
-- Name: kr_password_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_password_history ALTER COLUMN id SET DEFAULT nextval('public.kr_password_history_id_seq'::regclass);


--
-- Name: kr_periodic_password_definition periodic_password_definition_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_periodic_password_definition ALTER COLUMN periodic_password_definition_id SET DEFAULT nextval('public.kr_periodic_password_definiti_periodic_password_definition__seq'::regclass);


--
-- Name: kr_periodic_password_definition_detail periodic_password_definition_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_periodic_password_definition_detail ALTER COLUMN periodic_password_definition_detail_id SET DEFAULT nextval('public.kr_periodic_password_definiti_periodic_password_definition_seq1'::regclass);


--
-- Name: kr_rdp_recorder id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder ALTER COLUMN id SET DEFAULT nextval('public.kr_rdp_recorder_id_seq'::regclass);


--
-- Name: kr_rdp_recorder_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder_history ALTER COLUMN id SET DEFAULT nextval('public.kr_rdp_recorder_history_id_seq'::regclass);


--
-- Name: kr_user_authorization_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_authorization_log ALTER COLUMN id SET DEFAULT nextval('public.kr_user_authorization_log_id_seq'::regclass);


--
-- Name: kr_user_process_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_process_report ALTER COLUMN id SET DEFAULT nextval('public.kr_user_process_report_id_seq'::regclass);


--
-- Name: kr_user_session id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_session ALTER COLUMN id SET DEFAULT nextval('public.kr_user_session_id_seq'::regclass);


--
-- Name: kr_user_session_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_session_history ALTER COLUMN id SET DEFAULT nextval('public.kr_user_session_history_id_seq'::regclass);


--
-- Data for Name: kr_agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent (agent_id, agent_version, client_agent_id, client_status, create_date, is_deleted, description, dn, domain_name, domain_status, hostname, ip_address, jid, license_status, modify_date, operating_system, password, protocol, rdp_port, service_version, ssh_port, tags, telnet_port, trusted_status, username, vnc_port, version, folder_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_auth_management_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_auth_management_user (agent_auth_management_user_id, createdate, is_deleted, external_user, institution_name, modify_date, operator, remote_connection_permission, username, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_auth_management_user_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_auth_management_user_detail (agent_auth_management_user_detail_id, authorization_status, connection_count, unlimited_connection_limit, connection_limit_count, createdate, is_deleted, duration_limit, duration_type, end_date, file_transfer_authotization, mail_sending, modify_date, operator, protocol, start_date, unlimitedrequest, verification, version, agent_auth_management_user_id, case_user_id, connection_request_id, external_user_request_code_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_authorization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_authorization (id, create_date, is_deleted, description, externaluser, operator, status, username, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_case_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_case_user (id, create_date, is_deleted, version, agent_id, case_user_id) FROM stdin;
1	2024-05-25 19:39:51.207	t	2	1	2
2	2024-05-25 19:42:32.415	t	2	2	1
\.


--
-- Data for Name: kr_agent_folder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_folder (agent_folder_id, create_date, is_deleted, details, folder_type, name, parent_id_tree, version, parent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_operating_system; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_operating_system (agent_operating_system_id, agent_send_date, console_version, create_date, is_deleted, os_arch, os_build_number, os_installed_date, os_name, os_version, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_remote_connection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_remote_connection (agent_remote_connection_id, connection_username, create_date, is_deleted, end_date, guacamole_id, history_type, identifier, record_name, session_status, status, token, remote_connection_type, username, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_session (agent_session_id, client_record_id, create_date, is_deleted, login_date, logoff_date, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_status (agent_status_id, create_date, is_deleted, last_online_date, last_response_time, lost_average, is_online, status, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_status_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_status_history (agent_status_history_id, create_date, is_deleted, offline_date, online_date, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_user (agent_user_id, agent_send_date, caseuser, client_record_id, create_date, is_deleted, display_name, folder, name, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_agent_user_session_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_agent_user_session_history (agent_user_session_id, client_record_id, create_date, is_deleted, session_event, username, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_case_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_case_user (case_user_id, createdate, is_deleted, modify_date, name, operator, protocol, sessionuser, status, username, version) FROM stdin;
2	2024-05-25 19:39:35.912	t	\N	gardiyan-win	admin	2,3	\N	f	cekino	2
1	2024-05-25 19:39:11.293	t	\N	gardiyan-user	admin	1	\N	f	gardiyan	2
\.


--
-- Data for Name: kr_collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_collection (id, collection_type, create_date, is_deleted, description, filters, name, version, parent_id) FROM stdin;
\.


--
-- Data for Name: kr_connection_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_connection_request (connection_request_id, accept_date, unlimited_connection_limit, connection_limit_count, status, createdate, is_deleted, description, duration_limit, duration_type, email, email_verification, end_date, file_transfer_authotization, institutionname, modify_date, operator, protocol, reject_date, reject_description, right_of_entry, sms_verification, start_date, unlimitedrequest, verification_status, version, agent_id, case_user_id) FROM stdin;
\.


--
-- Data for Name: kr_connection_request_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_connection_request_detail (connection_request_detail_id, createdate, is_deleted, modify_date, operator, protocol, version, connection_request_id, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_external_user_request_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_external_user_request_code (id, create_date, is_deleted, request_code, user0, version, agent_auth_management_user_detail_id, connection_request_id) FROM stdin;
\.


--
-- Data for Name: kr_file_transfer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_file_transfer (file_transfer_id, agent_path, create_date, is_deleted, dn, dn_detail, dn_type, file_path, file_size, file_transfer_type, file_name, modify_date, operator, original_file_name, status, task_name, version) FROM stdin;
\.


--
-- Data for Name: kr_file_transfer_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_file_transfer_detail (file_transfer_detail_id, create_date, is_deleted, message, resend_count, resend_date, status, version, agent_id, file_transfer_id) FROM stdin;
\.


--
-- Data for Name: kr_log_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_log_operations (id, create_date, is_deleted, log_type, message, operator, status, version, agent_id) FROM stdin;
1	2024-05-25 19:39:11.328	f	createCaseUser	gardiyan-user	admin	added	1	\N
2	2024-05-25 19:39:35.939	f	createCaseUser	gardiyan-win	admin	added	1	\N
3	2024-05-25 19:40:00.401	f	authorizationYes	username: admin, caseUser: 	admin	authorizationYes	1	1
4	2024-05-25 19:40:37.979	f	fileList		admin	listed	1	1
5	2024-05-25 19:42:39.401	f	authorizationYes	username: admin, caseUser: 	admin	authorizationYes	1	2
6	2024-05-25 19:44:15.721	f	joinConnection	connectSession ssh	admin	joinConnection	1	2
\.


--
-- Data for Name: kr_pam_general_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_pam_general_history (pam_general_history_id, createdate, is_deleted, history_type, value, version) FROM stdin;
\.


--
-- Data for Name: kr_password_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_password_history (id, create_date, is_deleted, password, is_periodic, username, version, case_user_id) FROM stdin;
\.


--
-- Data for Name: kr_periodic_password_definition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_periodic_password_definition (periodic_password_definition_id, createdate, is_deleted, operator, period, version) FROM stdin;
\.


--
-- Data for Name: kr_periodic_password_definition_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_periodic_password_definition_detail (periodic_password_definition_detail_id, createdate, is_deleted, last_modify_date, operator, period, version, case_user_id, periodic_password_definition_id) FROM stdin;
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
-- Data for Name: kr_user_authorization_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_authorization_log (id, create_date, is_deleted, log_type, operator, username, version, agent_id, agent_auth_user_management_detail_id, case_user_id) FROM stdin;
1	2024-05-25 19:40:15.255	f	authorizationYes	\N	admin	1	1	1	2
2	2024-05-25 19:42:50.775	f	authorizationYes	\N	admin	1	2	2	1
\.


--
-- Data for Name: kr_user_process_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_process_report (id, approve, approve_date, approve_operator, create_date, is_deleted, mail_status, message, operator, reject_date, reject_description, send_mail, version, agent_id) FROM stdin;
\.


--
-- Data for Name: kr_user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_session (id, create_date, is_deleted, login_date, logoff_date, name, online, surname, username, version) FROM stdin;
3	2024-05-18 14:54:04.616	f	\N	2024-05-18 14:54:04.595	undefined	f	undefined	undefined	1
2	2024-05-18 14:54:03.797	f	2024-05-25 19:36:46.092	2024-05-25 19:36:46.13	undefined	f	undefined	undefined	3
1	2024-04-27 18:53:27.546	f	2024-05-25 19:51:31.333	2024-05-25 19:51:35.26	admin	f	admin	admin	45
\.


--
-- Data for Name: kr_user_session_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kr_user_session_history (id, create_date, is_deleted, login_date, logoff_date, name, surname, username, version, user_session_id) FROM stdin;
1	2024-04-27 18:53:27.796	f	2024-04-27 18:53:27.519	2024-04-27 18:53:27.752	admin	admin	admin	1	1
2	2024-04-27 18:54:15.617	f	2024-04-27 18:53:28.553	2024-04-27 18:54:15.597	admin	admin	admin	1	1
3	2024-04-27 18:54:19.911	f	2024-04-27 18:54:19.652	2024-04-27 18:54:19.826	admin	admin	admin	1	1
4	2024-04-27 18:54:30.528	f	2024-04-27 18:54:20.197	2024-04-27 18:54:30.51	admin	admin	admin	1	1
5	2024-04-27 22:31:18.47	f	2024-04-27 22:31:10.128	2024-04-27 22:31:18.448	admin	admin	admin	1	1
6	2024-04-27 22:31:37.214	f	2024-04-27 22:31:19.465	2024-04-27 22:31:37.199	admin	admin	admin	1	1
7	2024-05-18 14:49:43.389	f	2024-05-18 14:47:51.025	2024-05-18 14:49:43.339	admin	admin	admin	1	1
8	2024-05-18 14:53:43.732	f	2024-05-18 14:52:49.879	2024-05-18 14:53:43.704	admin	admin	admin	1	1
9	2024-05-18 14:54:01.755	f	2024-05-18 14:53:46.128	2024-05-18 14:54:01.729	admin	admin	admin	1	1
10	2024-05-18 14:57:58.693	f	2024-05-18 14:57:31.187	2024-05-18 14:57:58.681	admin	admin	admin	1	1
11	2024-05-25 19:32:06.441	f	2024-05-25 19:31:53.375	2024-05-25 19:32:06.419	admin	admin	admin	1	1
12	2024-05-25 19:32:32.492	f	2024-05-25 19:32:08.948	2024-05-25 19:32:32.468	admin	admin	admin	1	1
13	2024-05-25 19:33:17.172	f	2024-05-25 19:32:33.697	2024-05-25 19:33:17.149	admin	admin	admin	1	1
14	2024-05-25 19:36:42.66	f	2024-05-25 19:36:25.617	2024-05-25 19:36:42.637	admin	admin	admin	1	1
15	2024-05-25 19:36:46.153	f	2024-05-25 19:36:46.092	2024-05-25 19:36:46.13	undefined	undefined	undefined	1	2
16	2024-05-25 19:41:43.599	f	2024-05-25 19:40:49.484	2024-05-25 19:41:43.579	admin	admin	admin	1	1
17	2024-05-25 19:44:30.368	f	2024-05-25 19:44:15.556	2024-05-25 19:44:30.358	admin	admin	admin	1	1
18	2024-05-25 19:44:39.192	f	2024-05-25 19:44:15.556	2024-05-25 19:44:39.171	admin	admin	admin	1	1
19	2024-05-25 19:44:42.689	f	2024-05-25 19:44:15.556	2024-05-25 19:44:42.669	admin	admin	admin	1	1
20	2024-05-25 19:51:30.337	f	2024-05-25 19:46:56.111	2024-05-25 19:51:30.31	admin	admin	admin	1	1
21	2024-05-25 19:51:35.297	f	2024-05-25 19:51:31.333	2024-05-25 19:51:35.26	admin	admin	admin	1	1
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
-- Name: kr_agent_agent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_agent_id_seq', 2, true);


--
-- Name: kr_agent_auth_management_user_agent_auth_management_user_de_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_auth_management_user_agent_auth_management_user_de_seq', 2, true);


--
-- Name: kr_agent_auth_management_user_agent_auth_management_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_auth_management_user_agent_auth_management_user_id_seq', 2, true);


--
-- Name: kr_agent_authorization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_authorization_id_seq', 1, false);


--
-- Name: kr_agent_case_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_case_user_id_seq', 2, true);


--
-- Name: kr_agent_folder_agent_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_folder_agent_folder_id_seq', 1, false);


--
-- Name: kr_agent_operating_system_agent_operating_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_operating_system_agent_operating_system_id_seq', 1, false);


--
-- Name: kr_agent_remote_connection_agent_remote_connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_remote_connection_agent_remote_connection_id_seq', 2, true);


--
-- Name: kr_agent_session_agent_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_session_agent_session_id_seq', 1, false);


--
-- Name: kr_agent_status_agent_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_status_agent_status_id_seq', 3, true);


--
-- Name: kr_agent_status_history_agent_status_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_status_history_agent_status_history_id_seq', 1, false);


--
-- Name: kr_agent_user_agent_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_user_agent_user_id_seq', 2, true);


--
-- Name: kr_agent_user_session_history_agent_user_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_agent_user_session_history_agent_user_session_id_seq', 4, true);


--
-- Name: kr_case_user_case_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_case_user_case_user_id_seq', 2, true);


--
-- Name: kr_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_collection_id_seq', 1, false);


--
-- Name: kr_connection_request_connection_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_connection_request_connection_request_id_seq', 1, false);


--
-- Name: kr_connection_request_detail_connection_request_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_connection_request_detail_connection_request_detail_id_seq', 1, false);


--
-- Name: kr_external_user_request_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_external_user_request_code_id_seq', 1, false);


--
-- Name: kr_file_transfer_detail_file_transfer_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_file_transfer_detail_file_transfer_detail_id_seq', 1, false);


--
-- Name: kr_file_transfer_file_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_file_transfer_file_transfer_id_seq', 1, false);


--
-- Name: kr_log_operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_log_operations_id_seq', 6, true);


--
-- Name: kr_pam_general_history_pam_general_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_pam_general_history_pam_general_history_id_seq', 1, false);


--
-- Name: kr_password_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_password_history_id_seq', 1, false);


--
-- Name: kr_periodic_password_definiti_periodic_password_definition__seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_periodic_password_definiti_periodic_password_definition__seq', 1, false);


--
-- Name: kr_periodic_password_definiti_periodic_password_definition_seq1; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_periodic_password_definiti_periodic_password_definition_seq1', 1, false);


--
-- Name: kr_rdp_recorder_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_rdp_recorder_history_id_seq', 1, false);


--
-- Name: kr_rdp_recorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_rdp_recorder_id_seq', 1, false);


--
-- Name: kr_user_authorization_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_user_authorization_log_id_seq', 2, true);


--
-- Name: kr_user_process_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_user_process_report_id_seq', 1, false);


--
-- Name: kr_user_session_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_user_session_history_id_seq', 21, true);


--
-- Name: kr_user_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kr_user_session_id_seq', 3, true);


--
-- Name: kr_agent_authorization kr_agent_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_authorization
    ADD CONSTRAINT kr_agent_authorization_pkey PRIMARY KEY (id);


--
-- Name: kr_agent_case_user kr_agent_case_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_case_user
    ADD CONSTRAINT kr_agent_case_user_pkey PRIMARY KEY (id);


--
-- Name: kr_collection kr_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_collection
    ADD CONSTRAINT kr_collection_pkey PRIMARY KEY (id);


--
-- Name: kr_external_user_request_code kr_external_user_request_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_external_user_request_code
    ADD CONSTRAINT kr_external_user_request_code_pkey PRIMARY KEY (id);


--
-- Name: kr_log_operations kr_log_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_log_operations
    ADD CONSTRAINT kr_log_operations_pkey PRIMARY KEY (id);


--
-- Name: kr_password_history kr_password_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_password_history
    ADD CONSTRAINT kr_password_history_pkey PRIMARY KEY (id);


--
-- Name: kr_rdp_recorder_history kr_rdp_recorder_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder_history
    ADD CONSTRAINT kr_rdp_recorder_history_pkey PRIMARY KEY (id);


--
-- Name: kr_rdp_recorder kr_rdp_recorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_rdp_recorder
    ADD CONSTRAINT kr_rdp_recorder_pkey PRIMARY KEY (id);


--
-- Name: kr_user_authorization_log kr_user_authorization_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_authorization_log
    ADD CONSTRAINT kr_user_authorization_log_pkey PRIMARY KEY (id);


--
-- Name: kr_user_process_report kr_user_process_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_process_report
    ADD CONSTRAINT kr_user_process_report_pkey PRIMARY KEY (id);


--
-- Name: kr_user_session_history kr_user_session_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_session_history
    ADD CONSTRAINT kr_user_session_history_pkey PRIMARY KEY (id);


--
-- Name: kr_user_session kr_user_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_session
    ADD CONSTRAINT kr_user_session_pkey PRIMARY KEY (id);


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
-- Name: kr_case_user u_kr_c_sr_case_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_case_user
    ADD CONSTRAINT u_kr_c_sr_case_user_id PRIMARY KEY (case_user_id);


--
-- Name: kr_connection_request_detail u_kr_cdtl_connection_request_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_connection_request_detail
    ADD CONSTRAINT u_kr_cdtl_connection_request_detail_id PRIMARY KEY (connection_request_detail_id);


--
-- Name: kr_connection_request u_kr_cqst_connection_request_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_connection_request
    ADD CONSTRAINT u_kr_cqst_connection_request_id PRIMARY KEY (connection_request_id);


--
-- Name: kr_file_transfer_detail u_kr_fdtl_file_transfer_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer_detail
    ADD CONSTRAINT u_kr_fdtl_file_transfer_detail_id PRIMARY KEY (file_transfer_detail_id);


--
-- Name: kr_file_transfer u_kr_fsfr_file_transfer_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_file_transfer
    ADD CONSTRAINT u_kr_fsfr_file_transfer_id PRIMARY KEY (file_transfer_id);


--
-- Name: kr_agent_auth_management_user u_kr_g_sr_agent_auth_management_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_auth_management_user
    ADD CONSTRAINT u_kr_g_sr_agent_auth_management_user_id PRIMARY KEY (agent_auth_management_user_id);


--
-- Name: kr_agent_user u_kr_g_sr_agent_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user
    ADD CONSTRAINT u_kr_g_sr_agent_user_id PRIMARY KEY (agent_user_id);


--
-- Name: kr_agent_remote_connection u_kr_gctn_agent_remote_connection_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_remote_connection
    ADD CONSTRAINT u_kr_gctn_agent_remote_connection_id PRIMARY KEY (agent_remote_connection_id);


--
-- Name: kr_agent_auth_management_user_detail u_kr_gdtl_agent_auth_management_user_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_auth_management_user_detail
    ADD CONSTRAINT u_kr_gdtl_agent_auth_management_user_detail_id PRIMARY KEY (agent_auth_management_user_detail_id);


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
-- Name: kr_agent_folder u_kr_gldr_agent_folder_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_folder
    ADD CONSTRAINT u_kr_gldr_agent_folder_id PRIMARY KEY (agent_folder_id);


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
-- Name: kr_agent_status_history u_kr_gtry_agent_status_history_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_status_history
    ADD CONSTRAINT u_kr_gtry_agent_status_history_id PRIMARY KEY (agent_status_history_id);


--
-- Name: kr_agent_user_session_history u_kr_gtry_agent_user_session_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_session_history
    ADD CONSTRAINT u_kr_gtry_agent_user_session_id PRIMARY KEY (agent_user_session_id);


--
-- Name: kr_agent_status u_kr_gtts_agent_status_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_status
    ADD CONSTRAINT u_kr_gtts_agent_status_id PRIMARY KEY (agent_status_id);


--
-- Name: kr_periodic_password_definition_detail u_kr_pdtl_periodic_password_definition_detail_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_periodic_password_definition_detail
    ADD CONSTRAINT u_kr_pdtl_periodic_password_definition_detail_id PRIMARY KEY (periodic_password_definition_detail_id);


--
-- Name: kr_periodic_password_definition u_kr_pntn_periodic_password_definition_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_periodic_password_definition
    ADD CONSTRAINT u_kr_pntn_periodic_password_definition_id PRIMARY KEY (periodic_password_definition_id);


--
-- Name: kr_pam_general_history u_kr_ptry_pam_general_history_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_pam_general_history
    ADD CONSTRAINT u_kr_ptry_pam_general_history_id PRIMARY KEY (pam_general_history_id);


--
-- Name: i_kr_cctn_collection; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_cctn_collection ON public.kr_collection USING btree (parent_id);


--
-- Name: i_kr_cqst_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_cqst_agent ON public.kr_connection_request USING btree (agent_id);


--
-- Name: i_kr_cqst_caseuser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_cqst_caseuser ON public.kr_connection_request USING btree (case_user_id);


--
-- Name: i_kr_g_sr_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_g_sr_agent ON public.kr_agent_case_user USING btree (agent_id);


--
-- Name: i_kr_g_sr_caseuser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_g_sr_caseuser ON public.kr_agent_case_user USING btree (case_user_id);


--
-- Name: i_kr_gdtl_connectionrequest; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gdtl_connectionrequest ON public.kr_agent_auth_management_user_detail USING btree (connection_request_id);


--
-- Name: i_kr_gdtl_externaluserrequestcode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gdtl_externaluserrequestcode ON public.kr_agent_auth_management_user_detail USING btree (external_user_request_code_id);


--
-- Name: i_kr_gent_agentfolder; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gent_agentfolder ON public.kr_agent USING btree (folder_id);


--
-- Name: i_kr_gldr_parentfolder; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gldr_parentfolder ON public.kr_agent_folder USING btree (parent_id);


--
-- Name: i_kr_gztn_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_gztn_agent ON public.kr_agent_authorization USING btree (agent_id);


--
-- Name: i_kr_ltns_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_ltns_agent ON public.kr_log_operations USING btree (agent_id);


--
-- Name: i_kr_ptry_caseuser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_ptry_caseuser ON public.kr_password_history USING btree (case_user_id);


--
-- Name: i_kr_rtry_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_rtry_agent ON public.kr_rdp_recorder_history USING btree (agent_id);


--
-- Name: i_kr_s_lg_agent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_s_lg_agent ON public.kr_user_authorization_log USING btree (agent_id);


--
-- Name: i_kr_s_lg_agentauthmanagementuserdetail; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_s_lg_agentauthmanagementuserdetail ON public.kr_user_authorization_log USING btree (agent_auth_user_management_detail_id);


--
-- Name: i_kr_s_lg_caseuser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_s_lg_caseuser ON public.kr_user_authorization_log USING btree (case_user_id);


--
-- Name: i_kr_x_cd_agentauthmanagementuserdetail; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_x_cd_agentauthmanagementuserdetail ON public.kr_external_user_request_code USING btree (agent_auth_management_user_detail_id);


--
-- Name: i_kr_x_cd_connectionrequest; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i_kr_x_cd_connectionrequest ON public.kr_external_user_request_code USING btree (connection_request_id);


--
-- Name: kr_agent_auth_management_user_detail kr_agent_auth_management_user_agent_auth_management_user_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_auth_management_user_detail
    ADD CONSTRAINT kr_agent_auth_management_user_agent_auth_management_user_i_fkey FOREIGN KEY (agent_auth_management_user_id) REFERENCES public.kr_agent_auth_management_user(agent_auth_management_user_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_auth_management_user kr_agent_auth_management_user_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_auth_management_user
    ADD CONSTRAINT kr_agent_auth_management_user_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_auth_management_user_detail kr_agent_auth_management_user_detail_case_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_auth_management_user_detail
    ADD CONSTRAINT kr_agent_auth_management_user_detail_case_user_id_fkey FOREIGN KEY (case_user_id) REFERENCES public.kr_case_user(case_user_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_operating_system kr_agent_operating_system_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_operating_system
    ADD CONSTRAINT kr_agent_operating_system_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_remote_connection kr_agent_remote_connection_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_remote_connection
    ADD CONSTRAINT kr_agent_remote_connection_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_session kr_agent_session_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_session
    ADD CONSTRAINT kr_agent_session_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_status kr_agent_status_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_status
    ADD CONSTRAINT kr_agent_status_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_status_history kr_agent_status_history_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_status_history
    ADD CONSTRAINT kr_agent_status_history_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_user kr_agent_user_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user
    ADD CONSTRAINT kr_agent_user_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_agent_user_session_history kr_agent_user_session_history_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_agent_user_session_history
    ADD CONSTRAINT kr_agent_user_session_history_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON UPDATE SET DEFAULT ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_connection_request_detail kr_connection_request_detail_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_connection_request_detail
    ADD CONSTRAINT kr_connection_request_detail_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_connection_request_detail kr_connection_request_detail_connection_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_connection_request_detail
    ADD CONSTRAINT kr_connection_request_detail_connection_request_id_fkey FOREIGN KEY (connection_request_id) REFERENCES public.kr_connection_request(connection_request_id) ON DELETE CASCADE DEFERRABLE;


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
-- Name: kr_periodic_password_definition_detail kr_periodic_password_definiti_periodic_password_definition_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_periodic_password_definition_detail
    ADD CONSTRAINT kr_periodic_password_definiti_periodic_password_definition_fkey FOREIGN KEY (periodic_password_definition_id) REFERENCES public.kr_periodic_password_definition(periodic_password_definition_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_periodic_password_definition_detail kr_periodic_password_definition_detail_case_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_periodic_password_definition_detail
    ADD CONSTRAINT kr_periodic_password_definition_detail_case_user_id_fkey FOREIGN KEY (case_user_id) REFERENCES public.kr_case_user(case_user_id) ON DELETE CASCADE DEFERRABLE;


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
-- Name: kr_user_process_report kr_user_process_report_agent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_process_report
    ADD CONSTRAINT kr_user_process_report_agent_id_fkey FOREIGN KEY (agent_id) REFERENCES public.kr_agent(agent_id) ON DELETE CASCADE DEFERRABLE;


--
-- Name: kr_user_session_history kr_user_session_history_user_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kr_user_session_history
    ADD CONSTRAINT kr_user_session_history_user_session_id_fkey FOREIGN KEY (user_session_id) REFERENCES public.kr_user_session(id) ON DELETE CASCADE DEFERRABLE;


--
-- PostgreSQL database dump complete
--

