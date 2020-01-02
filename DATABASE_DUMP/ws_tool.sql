--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

-- Started on 2019-05-09 13:07:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2970 (class 1262 OID 16395)
-- Name: wstool; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE wstool WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE wstool OWNER TO root;

\connect wstool

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 198 (class 1259 OID 16426)
-- Name: agency_app_service_authentication_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.agency_app_service_authentication_seq
    START WITH 1128
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.agency_app_service_authentication_seq OWNER TO root;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 16428)
-- Name: agency_app_service_authentication; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.agency_app_service_authentication (
    agency_app_service_authentication_id bigint DEFAULT nextval('public.agency_app_service_authentication_seq'::regclass) NOT NULL,
    authentication_type_key_id integer NOT NULL,
    authentication_type_id integer NOT NULL,
    service_id integer NOT NULL,
    authentication_type_key_value character varying(250) NOT NULL,
    status integer NOT NULL,
    is_deleted integer,
    created_dt_tm timestamp without time zone NOT NULL,
    modified_dt_tm timestamp without time zone
);


ALTER TABLE public.agency_app_service_authentication OWNER TO root;

--
-- TOC entry 200 (class 1259 OID 16432)
-- Name: agency_application_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.agency_application_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.agency_application_seq OWNER TO root;

--
-- TOC entry 201 (class 1259 OID 16434)
-- Name: agency_application; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.agency_application (
    application_id bigint DEFAULT nextval('public.agency_application_seq'::regclass) NOT NULL,
    agency_id integer NOT NULL,
    application_name character varying(50) NOT NULL,
    application_descp character varying(250) NOT NULL,
    period_days integer NOT NULL,
    status integer NOT NULL,
    is_deleted integer,
    created_dt_tm timestamp without time zone NOT NULL,
    modified_dt_tm timestamp without time zone
);


ALTER TABLE public.agency_application OWNER TO root;

--
-- TOC entry 202 (class 1259 OID 16438)
-- Name: agency_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.agency_id_seq
    START WITH 208
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.agency_id_seq OWNER TO root;

--
-- TOC entry 203 (class 1259 OID 16440)
-- Name: agency_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.agency_info (
    agency_id bigint DEFAULT nextval('public.agency_id_seq'::regclass) NOT NULL,
    agency_name character(250) NOT NULL,
    agency_code character(20) NOT NULL,
    status integer,
    is_deleted integer,
    created_dt_tm timestamp without time zone,
    modified_dt_tm timestamp without time zone
);


ALTER TABLE public.agency_info OWNER TO root;

--
-- TOC entry 204 (class 1259 OID 16444)
-- Name: agency_service_reg_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.agency_service_reg_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.agency_service_reg_seq OWNER TO root;

--
-- TOC entry 205 (class 1259 OID 16446)
-- Name: agency_service_reg; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.agency_service_reg (
    registration_id bigint DEFAULT nextval('public.agency_service_reg_seq'::regclass) NOT NULL,
    agency_id integer NOT NULL,
    service_id integer NOT NULL,
    registration_date date,
    expiration_date date,
    status integer,
    is_deleted integer,
    created_dt_tm timestamp without time zone,
    modified_dt_tm timestamp without time zone
);


ALTER TABLE public.agency_service_reg OWNER TO root;

--
-- TOC entry 206 (class 1259 OID 16450)
-- Name: authentication_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authentication_type (
    authentication_type_id integer NOT NULL,
    authentication_name character varying(100) NOT NULL,
    authentication_desc character varying(250) NOT NULL,
    status integer NOT NULL,
    is_deleted integer,
    created_dt_tm timestamp without time zone NOT NULL,
    modified_dt_tm timestamp without time zone
);


ALTER TABLE public.authentication_type OWNER TO root;

--
-- TOC entry 207 (class 1259 OID 16453)
-- Name: authentication_type_key; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.authentication_type_key (
    authentication_type_key_id integer NOT NULL,
    authentication_type_id integer NOT NULL,
    authentication_key_name character varying(150) NOT NULL,
    authentication_key_datatype character varying(30) NOT NULL,
    status integer NOT NULL,
    is_deleted integer,
    created_dt_tm timestamp without time zone NOT NULL,
    modified_dt_tm timestamp without time zone
);


ALTER TABLE public.authentication_type_key OWNER TO root;

--
-- TOC entry 208 (class 1259 OID 16456)
-- Name: config_properties; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.config_properties (
    config_property_id integer NOT NULL,
    property_name character varying(255),
    property_value character varying(255)
);


ALTER TABLE public.config_properties OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 16533)
-- Name: configuration; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.configuration (
    configuration_id bigint NOT NULL,
    configuration_name character varying(255),
    configuration_value character varying(255)
);


ALTER TABLE public.configuration OWNER TO root;

--
-- TOC entry 209 (class 1259 OID 16462)
-- Name: cons_agency_application_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.cons_agency_application_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.cons_agency_application_seq OWNER TO root;

--
-- TOC entry 210 (class 1259 OID 16464)
-- Name: cons_agency_app_servicereg; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.cons_agency_app_servicereg (
    cons_agency_app_servicereg_id bigint DEFAULT nextval('public.cons_agency_application_seq'::regclass) NOT NULL,
    application_id integer NOT NULL,
    agency_id integer NOT NULL,
    service_id integer NOT NULL,
    agency_allowed_info_id integer NOT NULL,
    service_reg_date timestamp without time zone NOT NULL,
    service_reg_expiry_date timestamp without time zone,
    agency_app_auth_code text NOT NULL,
    agency_app_auth_key text NOT NULL,
    status integer NOT NULL,
    is_deleted integer,
    created_dt_tm timestamp without time zone NOT NULL,
    modified_dt_tm timestamp without time zone,
    agency_app_auth_private_key text
);


ALTER TABLE public.cons_agency_app_servicereg OWNER TO root;

--
-- TOC entry 211 (class 1259 OID 16471)
-- Name: dependency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dependency (
    dependency_id bigint NOT NULL,
    artifact_id character varying(255),
    group_id character varying(255),
    version character varying(255),
    description character varying(1000)
);


ALTER TABLE public.dependency OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16477)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 10000
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO root;

--
-- TOC entry 213 (class 1259 OID 16479)
-- Name: imt_data_tracking_tracking_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.imt_data_tracking_tracking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imt_data_tracking_tracking_id_seq OWNER TO root;

--
-- TOC entry 214 (class 1259 OID 16481)
-- Name: information_detail; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.information_detail (
    info_id integer NOT NULL,
    info_type character(50) NOT NULL,
    info_sub_type character(50) NOT NULL,
    information_name character(50),
    status integer,
    is_deleted integer,
    created_dt_tm timestamp without time zone,
    modified_dt_tm timestamp without time zone
);


ALTER TABLE public.information_detail OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 16616)
-- Name: mail_server_setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mail_server_setting (
    mail_server_setting_id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    smtp_host character varying(255) NOT NULL,
    smtp_port integer NOT NULL,
    from_address character varying(255) NOT NULL,
    is_active boolean
);


ALTER TABLE public.mail_server_setting OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16484)
-- Name: method_datatype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.method_datatype (
    id integer NOT NULL,
    data_type character varying(255)
);


ALTER TABLE public.method_datatype OWNER TO root;

--
-- TOC entry 216 (class 1259 OID 16487)
-- Name: method_validation_rule; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.method_validation_rule (
    id integer NOT NULL,
    validation_name character varying(255)
);


ALTER TABLE public.method_validation_rule OWNER TO root;

--
-- TOC entry 225 (class 1259 OID 16527)
-- Name: project_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_details (
    project_id integer NOT NULL,
    project_name character varying(255),
    user_id integer,
    ws_data character varying(10000)
);


ALTER TABLE public.project_details OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16490)
-- Name: provider_agency_app_servicereg; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.provider_agency_app_servicereg (
    provider_agency_app_servicereg_id integer NOT NULL,
    application_id integer NOT NULL,
    agency_id integer NOT NULL,
    service_id integer NOT NULL,
    service_reg_date timestamp without time zone NOT NULL,
    service_reg_expiry_date timestamp without time zone,
    agency_app_service_authentication_id integer NOT NULL,
    status integer NOT NULL,
    is_deleted integer,
    created_dt_tm timestamp without time zone NOT NULL,
    modified_dt_tm timestamp without time zone
);


ALTER TABLE public.provider_agency_app_servicereg OWNER TO root;

--
-- TOC entry 227 (class 1259 OID 16605)
-- Name: role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying(255)
);


ALTER TABLE public.role OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 16493)
-- Name: server_location; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.server_location (
    server_location_id integer NOT NULL,
    server_name character varying(255),
    server_path character varying(255)
);


ALTER TABLE public.server_location OWNER TO root;

--
-- TOC entry 219 (class 1259 OID 16499)
-- Name: service_catalog; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.service_catalog (
    service_id integer NOT NULL,
    service_catalog_number character(20),
    description character(100),
    end_point_url character(100),
    agency_id integer NOT NULL,
    info_id integer NOT NULL,
    status integer NOT NULL,
    is_deleted integer,
    created_dt_tm timestamp without time zone,
    modified_dt_tm timestamp without time zone,
    service_name character(50),
    version character(20),
    expiration_date timestamp without time zone
);


ALTER TABLE public.service_catalog OWNER TO root;

--
-- TOC entry 220 (class 1259 OID 16502)
-- Name: service_details_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.service_details_seq
    START WITH 1092
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


ALTER TABLE public.service_details_seq OWNER TO root;

--
-- TOC entry 221 (class 1259 OID 16505)
-- Name: service_details; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.service_details (
    service_id bigint DEFAULT nextval('public.service_details_seq'::regclass) NOT NULL,
    service_name character varying(50) NOT NULL,
    service_version character varying(30) NOT NULL,
    service_desc character varying(250),
    end_point_url character varying(250) NOT NULL,
    service_type character varying(10) NOT NULL,
    camel_route_url character varying(250),
    compression_enabled numeric(1,0),
    compression_method character varying(200),
    pagination_enabled numeric(1,0),
    encryption_method character varying(200),
    status integer NOT NULL,
    is_deleted integer,
    created_dt_tm timestamp without time zone,
    modified_dt_tm timestamp without time zone,
    service_catalog_number character(20),
    expiration_date timestamp without time zone,
    info_id integer,
    fk_service_id bigint,
    is_bulk character(5),
    is_internal_service character(5)
);


ALTER TABLE public.service_details OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 16512)
-- Name: v_agency_info; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW public.v_agency_info AS
 SELECT agency_info.agency_id,
    agency_info.agency_code,
    agency_info.agency_name,
    agency_info.status,
    agency_info.created_dt_tm,
    agency_info.modified_dt_tm
   FROM public.agency_info
  WHERE ((agency_info.status = 1) AND (agency_info.is_deleted <> 1));


ALTER TABLE public.v_agency_info OWNER TO root;

--
-- TOC entry 223 (class 1259 OID 16516)
-- Name: v_service_details; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW public.v_service_details AS
 SELECT service_details.service_id,
    ( SELECT DISTINCT provider_agency_app_servicereg.agency_id
           FROM public.provider_agency_app_servicereg
          WHERE (provider_agency_app_servicereg.service_id = service_details.service_id)) AS agency_id,
    ( SELECT agency_info.agency_code
           FROM public.agency_info
          WHERE (agency_info.agency_id = ( SELECT DISTINCT provider_agency_app_servicereg.agency_id
                   FROM public.provider_agency_app_servicereg
                  WHERE (provider_agency_app_servicereg.service_id = service_details.service_id)))) AS agency_code,
    service_details.service_name,
    service_details.service_version,
    service_details.service_desc,
    service_details.end_point_url,
    service_details.service_type,
    service_details.camel_route_url,
    service_details.compression_enabled,
    service_details.compression_method,
    service_details.pagination_enabled,
    service_details.encryption_method,
    service_details.status,
    service_details.is_deleted,
    service_details.created_dt_tm,
    service_details.modified_dt_tm,
    service_details.service_catalog_number,
    service_details.expiration_date,
    service_details.info_id
   FROM public.service_details
  WHERE ((service_details.status = 1) AND (service_details.is_deleted <> 1));


ALTER TABLE public.v_service_details OWNER TO root;

--
-- TOC entry 224 (class 1259 OID 16521)
-- Name: ws_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.ws_user (
    user_id integer NOT NULL,
    first_name character varying(255),
    is_active boolean,
    last_name character varying(255),
    password character varying(255) NOT NULL,
    user_name character varying(255),
    ws_data character varying(10000) COLLATE pg_catalog."C",
    svn_url character varying(1000),
    role_id integer,
    email character varying,
    flag boolean DEFAULT false NOT NULL
);


ALTER TABLE public.ws_user OWNER TO root;

--
-- TOC entry 2937 (class 0 OID 16428)
-- Dependencies: 199
-- Data for Name: agency_app_service_authentication; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2939 (class 0 OID 16434)
-- Dependencies: 201
-- Data for Name: agency_application; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2941 (class 0 OID 16440)
-- Dependencies: 203
-- Data for Name: agency_info; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (265, 'TestAgencyName3                                                                                                                                                                                                                                           ', '103453              ', 1, 0, '2017-10-04 14:11:07.384', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (266, 'Jabatan Suka Hati                                                                                                                                                                                                                                         ', '89801               ', 1, 0, '2017-10-05 16:00:21.477', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (267, 'MampuTestAgency                                                                                                                                                                                                                                           ', '103453              ', 1, 0, '2017-10-06 12:14:51.437', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (250, 'HPMK Portal                                                                                                                                                                                                                                               ', '909090              ', 1, 0, '2017-09-18 11:01:48.388', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (277, 'Akademi Sains Malaysia (ASM)                                                                                                                                                                                                                              ', '139402              ', 1, 0, '2017-11-21 17:32:13.28', '2017-12-04 16:01:37.787');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (269, 'Perbadanan Tabung Pendidikan Tinggi Nasional (PTPTN)                                                                                                                                                                                                      ', '136425              ', 1, 0, '2017-10-12 15:11:16.876', '2017-12-04 16:01:02.156');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (276, 'testCensofAgency                                                                                                                                                                                                                                          ', '1014044             ', 0, 0, '2017-11-01 10:44:46.827', '2017-11-01 10:45:16.064');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (271, 'Agensi Nuklear Malaysia (NUKLEAR MALAYSIA)                                                                                                                                                                                                                ', '139102              ', 1, 0, '2017-10-25 12:22:08.406', '2017-12-04 16:01:16.527');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (279, 'MINISTRY TEST A                                                                                                                                                                                                                                           ', '808                 ', 1, 0, '2017-12-04 15:50:20.717', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (280, 'DEPARTMENT TEST A                                                                                                                                                                                                                                         ', '808111              ', 1, 0, '2017-12-04 15:51:08.321', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (272, 'Agensi Penguatkuasaan Maritim Malaysia                                                                                                                                                                                                                    ', '101141              ', 1, 0, '2017-10-25 22:02:04.543', '2017-12-04 15:56:53.172');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (263, 'Suruhanjaya Perkhidmatan Awam                                                                                                                                                                                                                             ', '101106              ', 1, 0, '2017-09-26 17:04:22.17', '2017-12-07 15:34:51.256');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (205, 'Jabatan Perkhidmatan Awam                                                                                                                                                                                                                                 ', '101108              ', 1, 0, '2017-07-05 00:00:00', '2017-12-07 15:34:52.004');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (206, 'Jabatan Perangkaan Malaysia                                                                                                                                                                                                                               ', '101109              ', 1, 0, '2017-08-20 00:00:00', '2017-12-07 15:34:52.524');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (264, 'Unit Pemodenan Tadbiran & Perancangan Pengurusan Malaysia (MAMPU)                                                                                                                                                                                         ', '101115              ', 1, 0, '2017-09-26 17:29:20.926', '2017-12-07 15:34:54.204');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (207, 'Suruhanjaya Pengangkutan Awam Darat (SPAD)                                                                                                                                                                                                                ', '101404              ', 1, 0, '2017-08-29 00:00:00', '2017-12-04 15:57:16.27');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (270, 'Agensi Angkasa Negara (AAN)                                                                                                                                                                                                                               ', '139108              ', 1, 0, '2017-10-19 17:21:26.471', '2017-12-04 16:01:32.191');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (181, 'Jabatan Kebajikan Masyarakat Malaysia                                                                                                                                                                                                                     ', '143102              ', 1, 0, '2017-07-05 00:00:00', '2017-12-04 16:02:42.702');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (204, 'Jabatan Pendaftaran Negara (JPN)                                                                                                                                                                                                                          ', '146101              ', 1, 0, '2017-07-05 00:00:00', '2017-12-04 16:03:34.779');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (278, 'Suruhanjaya Pilihan Raya Malaysia (SPR)                                                                                                                                                                                                                   ', '101105              ', 1, 0, '2017-12-04 15:48:52.83', '2017-12-07 15:34:50.962');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (281, 'Jabatan Perdana Menteri                                                                                                                                                                                                                                   ', '101                 ', 1, 0, '2017-12-04 15:53:21.339', '2017-12-07 15:34:28.78');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (282, 'Kementerian Kewangan                                                                                                                                                                                                                                      ', '103                 ', 1, 0, '2017-12-04 15:53:22.7', '2017-12-07 15:34:29.084');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (258, 'Unit Pemodenan Tadbiran & Perancangan Pengurusan Malaysia (MAMPU)                                                                                                                                                                                         ', '102109              ', 1, 0, '2017-09-19 16:50:49.327', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (274, 'Jabatan Perangkaan Malaysia                                                                                                                                                                                                                               ', '101404              ', 1, 0, '2017-10-31 17:24:12.12', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (275, 'testAgencyName1                                                                                                                                                                                                                                           ', '1014045             ', 1, 0, '2017-10-31 17:28:22.793', NULL);
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (287, 'Kementerian Perumahan Dan Kerajaan Tempatan                                                                                                                                                                                                               ', '116                 ', 1, 0, '2017-12-04 15:53:30.669', '2017-12-07 15:34:30.578');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (288, 'Kementerian Pertahanan                                                                                                                                                                                                                                    ', '117                 ', 1, 0, '2017-12-04 15:53:31.902', '2017-12-07 15:34:30.929');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (289, 'Kementerian Luar Negeri                                                                                                                                                                                                                                   ', '119                 ', 1, 0, '2017-12-04 15:53:33.133', '2017-12-07 15:34:31.194');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (290, 'Kementerian Belia Dan Sukan                                                                                                                                                                                                                               ', '121                 ', 1, 0, '2017-12-04 15:53:35.706', '2017-12-07 15:34:31.456');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (268, 'Kementerian Kesihatan Malaysia                                                                                                                                                                                                                            ', '123                 ', 1, 0, '2017-10-09 14:22:49.419', '2017-12-07 15:34:31.718');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (291, 'Kementerian Perusahaan, Perladangan dan Komoditi                                                                                                                                                                                                          ', '132                 ', 1, 0, '2017-12-04 15:53:46.129', '2017-12-07 15:34:32.224');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (292, 'Kementerian Pertanian dan Industri Asas Tani                                                                                                                                                                                                              ', '134                 ', 1, 0, '2017-12-04 15:53:48.689', '2017-12-07 15:34:32.571');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (293, 'Kementerian Pelajaran Malaysia                                                                                                                                                                                                                            ', '135                 ', 1, 0, '2017-12-04 15:53:50.617', '2017-12-07 15:34:32.874');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (294, 'Kementerian Pengajian Tinggi                                                                                                                                                                                                                              ', '136                 ', 1, 0, '2017-12-04 15:53:51.841', '2017-12-07 15:34:33.145');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (295, 'Kementerian Pelancongan                                                                                                                                                                                                                                   ', '138                 ', 1, 0, '2017-12-04 15:53:53.053', '2017-12-07 15:34:33.444');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (296, 'Kementerian Sains, Teknologi Dan Inovasi                                                                                                                                                                                                                  ', '139                 ', 1, 0, '2017-12-04 15:53:58.283', '2017-12-07 15:34:33.733');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (297, 'Kementerian Kemajuan Luar Bandar dan Wilayah                                                                                                                                                                                                              ', '140                 ', 1, 0, '2017-12-04 15:53:59.781', '2017-12-07 15:34:34.057');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (298, 'Kementerian Sumber Asli dan Alam Sekitar                                                                                                                                                                                                                  ', '141                 ', 1, 0, '2017-12-04 15:54:01.062', '2017-12-07 15:34:34.324');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (285, 'Kementerian Perdagangan Antarabangsa Dan Industri                                                                                                                                                                                                         ', '108                 ', 1, 0, '2017-12-04 15:53:28.216', '2017-12-07 15:34:30.012');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (286, 'Kementerian Sumber Manusia                                                                                                                                                                                                                                ', '114                 ', 1, 0, '2017-12-04 15:53:29.48', '2017-12-07 15:34:30.296');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (284, 'Kementerian Kerja Raya                                                                                                                                                                                                                                    ', '105                 ', 1, 0, '2017-12-04 15:53:26.828', '2017-12-07 15:34:29.717');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (299, 'Kementerian Pembangunan Wanita, Keluarga dan Masyarakat                                                                                                                                                                                                   ', '143                 ', 1, 0, '2017-12-04 15:54:02.164', '2017-12-07 15:34:34.58');
INSERT INTO public.agency_info (agency_id, agency_name, agency_code, status, is_deleted, created_dt_tm, modified_dt_tm) VALUES (283, 'Kementerian Pengangkutan                                                                                                                                                                                                                                  ', '104                 ', 1, 0, '2017-12-04 15:53:24.777', '2017-12-29 11:53:24.883');


--
-- TOC entry 2943 (class 0 OID 16446)
-- Dependencies: 205
-- Data for Name: agency_service_reg; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2944 (class 0 OID 16450)
-- Dependencies: 206
-- Data for Name: authentication_type; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2945 (class 0 OID 16453)
-- Dependencies: 207
-- Data for Name: authentication_type_key; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2946 (class 0 OID 16456)
-- Dependencies: 208
-- Data for Name: config_properties; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2962 (class 0 OID 16533)
-- Dependencies: 226
-- Data for Name: configuration; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (1, 'osgi bundle file location', 'E:/softwares/jboss-fuse-6.3.0.redhat-187/Backup-war-files');
INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (4, 'template path', 'E:/Censof Project/CWD/Template/');
INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (3, 'new project path', 'E:/Censof Project/CWD/New Project/');
INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (2, 'project template path', 'E:/Censof Project/CWD/Project Template/');
INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (5, 'wsdlconfig path', 'E:/Censof Project/CWD/OSGI Bundles/');
INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (8, 'new server path', 'E:/Censof Project/Softwares/Jboss/jboss-fuse-karaf-6.3.0.redhat-187/jboss-fuse-6.3.0.redhat-187/instances/');
INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (9, 'testng project', 'E:/Censof Project/CWD/TestNG/');
INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (823, 'jbossFuse', 'E:/Censof Project/Softwares/jboss-fuse-karaf-6.3.0.redhat-187/jboss-fuse-6.3.0.redhat-187/bin/');
INSERT INTO public.configuration (configuration_id, configuration_name, configuration_value) VALUES (6, 'project sonar server', 'http://127.0.0.1:9000');


--
-- TOC entry 2948 (class 0 OID 16464)
-- Dependencies: 210
-- Data for Name: cons_agency_app_servicereg; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (50, 50, 250, 64, 1, '2017-08-29 15:31:54.986', '2017-08-29 15:31:54.986', 'b10da042-05d4-49c1-bf8b-c7a930edb767', 'TXaVaab1CicoDbNZ4XeopqLZOCycyzyTEGt4xxSZaVw2A9TdFVjKHkhvseHn+J6uKUwsll1LJ8cLn9SPN3vSPQ==', 1, 0, '2017-08-29 15:31:54.986', '2017-08-29 15:31:54.986', 'JosR1LMQK3mUkIv+sQuUPyOjyG8+J52OteOCCtMlJJcyIoRCj+GHOoeNsWmHI90pgoHomywBdWAz1skqzU0+mQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (50, 50, 250, 65, 1, '2018-02-07 11:59:06.314', '2018-02-07 11:59:06.314', 'b10da042-05d4-49c1-bf8b-c7a930edb767', 'TXaVaab1CicoDbNZ4XeopqLZOCycyzyTEGt4xxSZaVw2A9TdFVjKHkhvseHn+J6uKUwsll1LJ8cLn9SPN3vSPQ==', 1, 0, '2018-02-07 11:59:06.314', '2018-02-07 11:59:06.314', 'JosR1LMQK3mUkIv+sQuUPyOjyG8+J52OteOCCtMlJJcyIoRCj+GHOoeNsWmHI90pgoHomywBdWAz1skqzU0+mQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (50, 50, 250, 67, 1, '2018-02-07 11:59:06.314', '2018-02-07 11:59:06.314', 'b10da042-05d4-49c1-bf8b-c7a930edb767', 'TXaVaab1CicoDbNZ4XeopqLZOCycyzyTEGt4xxSZaVw2A9TdFVjKHkhvseHn+J6uKUwsll1LJ8cLn9SPN3vSPQ==', 1, 0, '2018-02-07 11:59:06.314', '2018-02-07 11:59:06.314', 'JosR1LMQK3mUkIv+sQuUPyOjyG8+J52OteOCCtMlJJcyIoRCj+GHOoeNsWmHI90pgoHomywBdWAz1skqzU0+mQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (9, 15, 181, 33, 3, '2017-08-30 10:43:23.662', NULL, 'fd18b9cb-c5ff-486d-91c7-576aeeb27f20', 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKrQH1GR9s55E1+FawwfK0QucAsw9/61J8ZLKKOT4xn7euQuzW3vjULdurMJ0q0tmd9zMphj0sCKP/JfeVy9wFMCAwEAAQ==', 1, 0, '2017-08-30 10:43:23.662', '2017-12-04 16:02:42.702', 'n3MddVhPvL/R1KQzRN1i7+mDGQQh5mcY0rkzxZ8gVWBZD213by5MdAZ0Sd2/jBn/l8XrfcN+c7aM77c1vqOlpA==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (46, 52, 250, 35, 1, '2017-09-18 12:56:28.905', NULL, 'b16d4ef6-78cf-4388-bae6-c05626f3c326', 'F0+T1DcNlD/3g+hWiRHEqFMawS1lXDTmrtcSsaT/JSOWLurS7YDZGm2XGwz3QznazxV0l+SVm2gY4HcUlKB8/A==', 1, 0, '2017-09-18 12:56:28.905', NULL, 'Av1rp1TErNt5zbOZbDF0GEkhHtWKyk+y096x2xccPGw5h80zS7DHXQMk5LLeT8ZOdUlITi/je7xB7hS/p5f5Vg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (30, 36, 206, 36, 3, '2017-09-14 15:28:29.889', NULL, '34b4de5b-37a1-40e5-9478-60b3db0b4d94', 'gRI0JRVTxBRPCN3WEaDVaVcMsCc4b+9MvBL15Pv3wfrhOTYIvDsIIwtpC/uiLXenKnf2nkxaPH24pyWtOwwtlg==', 1, 0, '2017-09-14 15:28:29.889', '2017-12-07 15:34:52.524', 'Q7levH2kuRaKynW836hMJQI9CzsL4pyAJoRSN5knFBDGyp9DQiQ75vZhiPXenuZuYdu6SQgzLmf4bQcCoggiKg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (15, 21, 207, 36, 4, '2017-09-05 16:59:23.56', NULL, '24e649bf-74cc-4b77-a945-122cd8c1732c', 'huviWFXt3/a74/lCnZMpgfEaV/0+hoTQxi3sFJrbc58bHjl/3YgxNGIsoFFgtE4STwZJh/C1A7kSqfhQGr+/Cg==', 1, 0, '2017-09-05 16:59:23.56', '2017-12-04 15:57:16.27', 'mGeCGALxJ3b3WHgxTsLvCZ1B6qiMU0xnarRX9kR7y5XDqxWM9laIEElvpj9s0l8sWhZ95h2QCymJz1uT9IBULQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (28, 34, 206, 36, 3, '2017-09-14 14:52:28.251', NULL, '15aa6ac3-571e-4f56-9c9c-f0ad1b742b43', 'bGVaop0vLY5w7owYtwPH7FEK0Yd2vPxGkY5DwmtZmbjOlcQPX34JR03FVbe5xO7wYWeoCtiNjWG3FSZ+7sRlPA==', 1, 0, '2017-09-14 14:52:28.251', '2017-12-07 15:34:52.524', 'XejwYUTXlqZ/Njmxdy8I+0B2b+AIZMiGQlRrgbNA5KMJc9LX82LIyTOJ8ZtlVI3X/DzZZgjW0O5or03q2zzADg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (7, 13, 205, 36, 3, '2017-08-29 16:00:22.613', NULL, '680e07fa-1489-4a4a-b0d6-9c31fc2c7b3d', 'Clg7Yje/zD5gT2hNCywM+uHhI5XjlfKnnPmmGp/Vq8oBbNmJ6FMwxV/Pj54r19abtFC4/ExnAWKytgFpt2xsYQ==', 1, 0, '2017-08-29 16:00:22.617', '2017-12-07 15:34:52.004', 'GXR7/JCjUA8ZkW5C1P+XotOp2IVrrh71uXZ9lmsNJjSu+Npf7jZPmhHegez5Es64nD1w3pkKZQI3Di+LZhRXIw==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (4, 10, 206, 36, 3, '2017-08-29 15:23:51.553', NULL, '39dd3f9f-f84f-4575-92db-10128768ffd8', 'eEL9koqemTIxpR80gmRoPhup9Xxtao/sISDwzZ+odkhAxG4cO5/5rmre7w5052tXKdX239wmlsKFef8Rsa9f6w==', 1, 0, '2017-08-29 15:23:51.561', '2017-12-07 15:34:52.524', NULL);
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (5, 11, 206, 36, 3, '2017-08-29 15:31:12.347', NULL, '18162c1b-4659-4d75-924e-8c9ba2b37251', 'PqdzGr0cM5xt3g5Jf+ZKUcw9gpaD7cGGVkI0BLdAK6zZutz8NFmt0YEBk88lTuBPE7KWWFW9ncsL6FsPewi3xQ==', 1, 0, '2017-08-29 15:31:12.354', '2017-12-07 15:34:52.524', 'cKU9yqI9fB2upKJbapBNM9pRSYPU+LD3azy8sAGSkXgopy/OSKpuNIjNz3qEwzM066XGydJoDkRaVprR6rIJpw==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (29, 35, 206, 36, 3, '2017-09-14 15:27:52.94', NULL, '8c2d32bc-b58c-4a1d-915c-56fe4e51d41f', 'IMufA82Udu/3p8fsbTMY76RVeUtIAwl/UosLsNCBINALfUj5CpdeMy2f4gnYWVdtn6b4qQ3p4hR9IZBLF/A3Jg==', 1, 0, '2017-09-14 15:27:52.949', '2017-12-07 15:34:52.524', 'pIQ62msfumoinl6c/Xp2szJZm/lxYxc7/tn7y8wfQnTyla9ht4hWOM/CyGyS2D5c+91wZtFAx21XkpNWN7bCvg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (31, 37, 206, 36, 3, '2017-09-14 17:45:37.193', NULL, '7944e87c-59c4-4b51-857b-d827cfb5ef98', 'Xo77Sx5s4GVVMnbpvPrUWzi3N0SUx2uN/EfiDJWg9vE5udv8HKP/07SYLeTt8WombmO1fqRjrUlebghG+YDPTA==', 1, 0, '2017-09-14 17:45:37.193', '2017-12-07 15:34:52.524', 'bJt+WxWi3LeKjxzGgi/pWUDDUfG9a7GhulgZ4mxFpD5wacyJRWMaVQDtEU2hNVPUV45qbN/LrNHcHSLpmO5mBg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (32, 38, 206, 36, 3, '2017-09-15 11:10:15.681', NULL, 'f8be2efd-a6e5-4953-ab01-fa7a37d2288e', 'ALEP8OVlyZ0c5pzku6/NgqIzXWpdjjsYdoUBPlDEp2+5Nys5ELPBpispGKp9+0ukD6Zbn3Ak9WQQZ28sEUh0NQ==', 1, 0, '2017-09-15 11:10:15.681', '2017-12-07 15:34:52.524', 'ivsuolF8m4bZn4N+3TpCIPWWQTL/IZ7keOBl3TvoBhkfL25TJRXcKdSS2RNnMyASYJDGd0l6joFtIKfRV+woFA==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (33, 39, 206, 36, 3, '2017-09-15 11:23:26.675', NULL, '2370f19d-2dff-4438-b0e0-e31457086cfb', 'B+FlNSM6todK9qoyVCMCCk/x/zgPmkFsj/RbKM+0eAIkJVUNowDxPtnk2gvn13yrI8bNA7XpOUqxYnvyiTzivw==', 1, 0, '2017-09-15 11:23:26.675', '2017-12-07 15:34:52.524', 'IiP763fOgYwiXcAPLe87LExO2iduXaXsHFz/Ke8D1w2LTOFx9MKGlVgm6a6wDOYvDpG5Vr93n1uRi78/QsuGbQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (10, 16, 206, 36, 3, '2017-08-30 15:54:29.701', NULL, '2fe9472c-dd9b-496d-83b0-3f34d880fc1b', 'xY9E4EXvDgYmYsFJB4KHQKB0YVwA39zrjzOvpJK9N+DzQjk3voxv65r6w+Yxwi0juGQFrRtxTMPwv2UpKyjbCw==', 1, 0, '2017-08-30 15:54:29.701', '2017-12-07 15:34:52.524', 'eDzpEZzkQcQ2kizw+w8Qh/H3XInUXXKWquIQ4ls2ArzkFCxWAuo+O2XMZ0PzQi6YWgP0zwHjklMqxYQDKlJY2g==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (11, 17, 206, 36, 3, '2017-08-30 16:23:15.219', NULL, '081cacc6-8e3d-4d90-8740-29b388a2efb6', 'BBsGsWi1YIqQ/FHEOx7bBhqc4LuizCMQ8ROxHGwjGJxtzmzuQme/mfQPuSo/JaIGPiA6RP81cioyaqw22nkr4A==', 1, 0, '2017-08-30 16:23:15.219', '2017-12-07 15:34:52.524', 'EX7qLY178ZO3J9vPtOsrwD60g3Amt+5L3iHqoyCliMgGuooiJdqtg86zP3AuP98xafZVEbd7k51eyzf7nQDoYQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (12, 18, 206, 36, 3, '2017-08-30 16:24:11.658', NULL, '54c7db0a-8d95-405f-a384-5dc8b7bd4254', 'C4B/hroRguMG0g0dToePlNUb/6M1AkhcqSObFuZJshBClq2SO8VcepP8Lgw+9d8PRthTXCNCL3rmghVjCbQkrQ==', 1, 0, '2017-08-30 16:24:11.658', '2017-12-07 15:34:52.524', 'LEGYXyYBvDatl32MEhKsiz5w65oSXoLFpIr0hmNpBvHwBBsGtSkJjbzcRdVrK0g1QB1rJY1VTtxwklyJwh1Uhg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (13, 19, 206, 36, 3, '2017-09-05 10:04:26.023', NULL, '8ad71aa1-ee1f-490f-a45a-1f1b10f666e2', 'dsgBaE+KkhLN68tTToS5P5qACOtAXdtvbDY1Ou5EEsOXUQ8IEStZqDTZtYg/mSzfwUcjQOTO8861zdDl65S5Eg==', 1, 0, '2017-09-05 10:04:26.023', '2017-12-07 15:34:52.524', 'CAFfOEAODL0baZcje96eoaThi/Hu42mHm58MUfG25+Ie6cRvyi3H/N2T5uaNs38+lO+Ow6hdCI1SJKxQSMzCtA==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (14, 20, 206, 36, 3, '2017-09-05 12:21:18.414', NULL, '8093d39a-8055-4e8d-906b-0a57135428d1', 'VCP13LcdoDX1e3DTaHnaMXAqn3plRalKsC9psW6cTUobYLJnGgUEl3IXuSQje4oHVAwiUTr20vnumND1Og7GoA==', 1, 0, '2017-09-05 12:21:18.414', '2017-12-07 15:34:52.524', 'kvc1e2NB4Z9OjmoMnSYTXkPAg2JwpwZ2b2QZoGlVS9XILQkQ7uW5QU5vBgS1u5Kajr8slRLJ4a3v0T7G1SXdTw==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (18, 24, 206, 36, 3, '2017-09-12 16:41:59.885', NULL, '9acbcd76-137e-4c3e-a916-9937386d919f', 'IxCJCd+kM6YmTHR7TWORhve0iuAyXczy7JzdLn0Zm5IiYXS197/W8TzzG8PY2yalPUAwEwkoUusYqchVFrPn7w==', 1, 0, '2017-09-12 16:41:59.885', '2017-12-07 15:34:52.524', 'Df8u2zyX7Zn0WZTHFDwhhAU0AszZdAte1Y4QCJdfqkDw7Jo415tfnyzFWnMDvHHPftx9n2y7O2DGE7/vJC30HQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (19, 25, 206, 36, 3, '2017-09-13 16:06:55.682', NULL, '3b30c34b-9ba3-4772-8949-a624c7c1bd94', 'bx7Cg7xD0Nt21jqGSMI0T3SJ9dO/PoLxjJd679gN6fgpy5/Vux+yNTrpEidJys2NSKcGOATMiSA0zcuGKR9QiQ==', 1, 0, '2017-09-13 16:06:55.682', '2017-12-07 15:34:52.524', 'DSUJQIidcfA9VT2nXVNWdrSuzjz3/EQphC0xwfC0wsRcAML/7GGUi4SJaxsXjc00mvv9fQZQBM+gUHEMv1Ixeg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (20, 26, 206, 36, 3, '2017-09-13 16:07:44.137', NULL, '8b9c5ed8-38c7-44d6-9ebf-efa3258de114', 'PmYeTmXvlEIE8pdVTrylgmug5VO0spzb/jj2Prlw8k3cuxG0ZX96j+sdMNypeDyH+WJ8T/whJOoENg3eBuuxzQ==', 1, 0, '2017-09-13 16:07:44.137', '2017-12-07 15:34:52.524', 'XEUZW3YC0jY4EWcx4V9dofF5Rt7p//Y9vFFGUuGkW8TfeuXiOk7A/F+r5lPLlch17HK7+ZH+a/iMpcEGRtWDSA==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (21, 27, 206, 36, 3, '2017-09-13 16:08:31.4', NULL, 'f99ed313-b25a-4d66-aab3-e89690ba2c58', 'PJrqD93n42p3xvE1LXQmcai4akpb6WDLlt+MtuO3YGzCUi09l5+8XV5ZrXJgtP5m8zDdgFS6PEs4Fjq1tgfuaQ==', 1, 0, '2017-09-13 16:08:31.4', '2017-12-07 15:34:52.524', 'lGMAyjZHn1y6ot+KW6UKvkjF3ZmUNNv4OvLE1xE1L2W3X3hWZGpE6Cd4XkbgLlfe++PhhuBHCGSb7laNYoeDEg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (22, 28, 206, 36, 3, '2017-09-13 16:09:36.091', NULL, '90c18af0-0bbc-41fe-9890-a5c8e7c579c6', 'ox2Un8MGDGVLlW9/9KpfelYSfww+0TQGTtybU2xQG1Cg69+irwckj+HCeEHw6yI6iff8pHBg9EhvlIm1lfMZ6w==', 1, 0, '2017-09-13 16:09:36.091', '2017-12-07 15:34:52.524', 'fdtCakbZBRQS51lTYCKtKuNBI8vRlXcuE1Y8UyRJCdIt9KQYxSPHHx3os7Xc97S+YdDLPE7YiMe6dFpoZ+gstg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (23, 29, 206, 36, 3, '2017-09-14 14:13:31.616', NULL, 'b0df7629-5209-40bf-9e21-a849cc6bee77', 'bxJOYBUsxLhGQ5kpgzM9CNjyG1qGMomr8IbiUaoN5AEEEPxaXyTNhofLu4lH9nKhrKskwwUVMTq0V8Uf4MGU0Q==', 1, 0, '2017-09-14 14:13:31.624', '2017-12-07 15:34:52.524', 'K7w1R7trcEJmBl8YSd9UwB/Hok489ZpDX1j3yEz3NNop5vy3F99cmKyQ1Kt2o7CMImY9uX03YDU8UDOwYFxllQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (24, 30, 206, 36, 3, '2017-09-14 14:13:50.929', NULL, 'cc064aa2-3a5b-44fb-a419-f904813c3e91', 'YJXFWjN3Q4wMu5/p1C5/vic41jlEfBuxInfuN2BKWgrm6FdpgysZrvgo8DbYquGGQVNQIb+v/SgWQRd1ab7tbw==', 1, 0, '2017-09-14 14:13:50.929', '2017-12-07 15:34:52.524', 'RBvfe69Fnbp6048uEnl28UcRrZrz5O1UosmPHvasssQwcebU8ZGi/eejXc3nfbS9qweUg3RZ7FfiPDRJP1GWWA==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (6, 12, 206, 36, 3, '2017-08-29 15:31:54.986', NULL, '820a1136-f95c-42c1-b984-8573d7f00e28', 'DNipIqiElc7ATZYjKar8I/8E5L6KbEwdB0H+6nz3XyychlwJQ+4rvjYL7CK9mx+44j3ivIE0104XlmilufEDQg==', 1, 0, '2017-08-29 15:31:54.986', '2017-12-07 15:34:52.524', 'SnxBoVHuf2CNiLF4q+hasX3a6wR635yzfQamULhTwnru28tepbIzSLnB4XipgMeMOhSMJLBKBHbNZ8EIWOLXWA==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (8, 14, 206, 36, 3, '2017-08-29 17:03:35.501', NULL, 'e5a173b7-a851-48ef-bfbf-0381c0a53f4d', 'GrctTo1qMQptgSczdqyxWuMQTqoWyArB6ev8XvQHWeDwL0JyoXsgGw2ml2Yohp6LyXDvE+RpyPrYDlOe+Hqgmw==', 1, 0, '2017-08-29 17:03:35.501', '2017-12-07 15:34:52.524', 'D7mWVh3T13gTwfkg83NqJKp4jPfx3At3lTsCaotOLL5HY7VA/XK6wfo2Gvv799lAjc4h3WESD3Ckzqz+myGN8A==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (25, 31, 206, 36, 3, '2017-09-14 14:18:05.98', NULL, 'ba65f634-cfc7-4024-af84-61748e3f4b32', 'kT3TVsNVUrxkwmlm59LQSpUQyhS+oDbbizV3+Xu0V26Cm2Y1JXhiqucswABDNhU/15DNXz3CXUwCydpC2fiEtA==', 1, 0, '2017-09-14 14:18:05.98', '2017-12-07 15:34:52.524', 'sdG47WQxLckK0LbR869hZdvzekwAGrGFxDbNZBB69guDYGyon9et+uzm5mEf3RszCdb4cBO6QniwZMdKMsg4iA==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (26, 32, 206, 36, 3, '2017-09-14 14:25:41.688', NULL, 'dff92f65-f6d6-4df0-89ed-af34c85cecc7', 'PtHxmTrId6/B3R/zaHaP7LI1GbT9fmnLfnqBNdN6uFDiYICo0CdmbdT3XwbYLKRozoWFm5//7YNhEy25pKBolg==', 1, 0, '2017-09-14 14:25:41.688', '2017-12-07 15:34:52.524', 'SffgLS0CFlUYqDYNHU1XPq9hee1x64wKZy/Z4oODKeKnAod2+PX1L0tfEHf7xh+wB0cfYkoU3tYG/KUxDF6mGw==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (27, 33, 206, 36, 3, '2017-09-14 14:52:16.816', NULL, 'ebe41d2f-ad07-441b-a111-8f9e9707faea', 'LWNqHFXMOGL/g2jDYavoNev4MfM9O2YKunD8GqssW6/QcpNMjIQrn6CHxwh+ngfcWSoTPAU7eRce/V2+9DSF9w==', 1, 0, '2017-09-14 14:52:16.816', '2017-12-07 15:34:52.524', 'UcjEJw3f+nfnPh9a55v/oqZwShB1oOc0XiiXkp50GevLMNl9+MVQEv6TxNShThGgN8iky5aussvgtX721qcQoQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (34, 40, 206, 36, 3, '2017-09-15 11:37:36.577', NULL, '813d2b87-fb49-4b88-9991-ed2e47980a1e', 'HokHFL/tq3pe2kWPI4ZCBuJLyLzFdWxKISLaRID5ddCol/pgMME6LP2hyyyu+hgWsd2BTS2EDuPga9b3KHi1dA==', 1, 0, '2017-09-15 11:37:36.577', '2017-12-07 15:34:52.524', 'WW4RF8m+U7dscngHEDBtWTnOEL9aOQiA5x6g90HQayaYHKu+EjIRFORln2KlwrU2gOhBK043PARKl0/zhPRFhw==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (35, 41, 206, 36, 3, '2017-09-15 14:04:55.798', NULL, '4f553809-3bf6-44cf-84d2-8074d7b6db89', 'OffSrotFk5AgCkP3A3i/D1ugZpXyZcDLFJGKpsj3oL8OKtw1KYyISYsK5nG3Lw49svkfTlC3mTNqU1vdJEX4tQ==', 1, 0, '2017-09-15 14:04:55.798', '2017-12-07 15:34:52.524', 'UL+y9QGl/HyZn+IjxZMnXl+706uszLsfktpnRSYui1eSFu/LmwA5hXDpQxVxWcbqogoCJbBTJ3UMKnBDv6LIiw==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (36, 42, 206, 36, 3, '2017-09-18 11:48:04.89', NULL, '3fb6aaab-1ab2-4fcf-8692-1ce0ebcc3ef9', 'Jb8nWFZjxl8HLKz9Z31/Nvn5wkA+FLVBAdCqz58YEzn/WxmhrWru6hgM9krfQtrMT0v2Q4cY8krHrNF8fN8Ckg==', 1, 0, '2017-09-18 11:48:04.89', '2017-12-07 15:34:52.524', 'fFm3tmwatN1MWowNSUD0VdqMtjrWuR4QjQTPMeDY72iYTyhD9ipwfQYsL2pWrCx8nJ/bebv28lRZRwGhs3Vopg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (42, 48, 250, 37, 1, '2017-09-18 12:46:53.456', NULL, '18e5590c-989d-494a-94f6-f02d0d859379', 'plKj90EhK4qR+JNTEahvunQJoFAnezYhFxjZuVAK4HGIk745nnHgOW+wc8BSys6quxBC5+FQ71jYCWUryfL+nA==', 1, 0, '2017-09-18 12:46:53.472', NULL, 'Rs/+ESCNpAny4hrxL0lMEPUhTU8fM5SguySC8ThVsghvQWCcBhK59F+05SrhU7fR5ipkx5YofWDu/ku2fBU41Q==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (43, 49, 250, 37, 1, '2017-09-18 12:47:14.567', NULL, 'b10da042-05d4-49c1-bf8b-c7a930edb767', 'TXaVaab1CicoDbNZ4XeopqLZOCycyzyTEGt4xxSZaVw2A9TdFVjKHkhvseHn+J6uKUwsll1LJ8cLn9SPN3vSPQ==', 1, 0, '2017-09-18 12:47:14.567', NULL, 'JosR1LMQK3mUkIv+sQuUPyOjyG8+J52OteOCCtMlJJcyIoRCj+GHOoeNsWmHI90pgoHomywBdWAz1skqzU0+mQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (44, 50, 250, 37, 1, '2017-09-18 12:48:12.58', NULL, '59062f29-6371-4a65-859b-d4bd47d4f31d', 'KL/7ooU7ZRV7S2sgKUhPbhbbGcnlchXijqfDG5A8Lw1lEy/Iz2IimhYk8kPyaV991DGgcK53GVbz3avDNL1+xw==', 1, 0, '2017-09-18 12:48:12.58', NULL, 'nF9+fXKMMEn8P9zOFtdkpQQjIIA4Yhj3l2tmzpUykFa+43FObA0rGKDXjyg2BkB40yd4tCZ9szpWpOXblfMB2A==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (47, 53, 250, 37, 1, '2017-09-18 13:00:40.599', NULL, '41a5d6a2-8aea-4e7b-a685-43b4c20585d5', 'xizhLA8l1JYIyM1CW5cSv7dRIr4PNXJatFY/y9KLU0RCalfEvQLeIkck9tdJMH2xm5rvdVSLxOJ0vtAA6xVgGQ==', 1, 0, '2017-09-18 13:00:40.608', NULL, 'B13AJQQDj/jZg0sVLFYChYGPP2r1vSsOqttimL0qpnzqnHlCMnsSfFzoZvvUCHkFwPh3HvIfOMKizQETzDpElg==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (48, 54, 250, 37, 1, '2017-09-18 13:08:44.939', NULL, '89d1b762-d582-43bd-b520-f94e875270de', 'fogEXNao+YqhiZsYlJIhnoKYNPnezbVBXmkYZvN/TamzvFStvn1iLypqhf6BfT6gYTcUtICwYOW8ROewP7r5kQ==', 1, 0, '2017-09-18 13:08:44.942', NULL, 'CDbhWIi3f8rEEKUdNoq77iNp2k9Lr3cRuyRWt6YvuyiQKFMxTt8uTVeRbXHTQFzgu/4ZMpGCzJHGclXHbCYfAQ==');
INSERT INTO public.cons_agency_app_servicereg (cons_agency_app_servicereg_id, application_id, agency_id, service_id, agency_allowed_info_id, service_reg_date, service_reg_expiry_date, agency_app_auth_code, agency_app_auth_key, status, is_deleted, created_dt_tm, modified_dt_tm, agency_app_auth_private_key) VALUES (49, 55, 250, 37, 1, '2017-09-18 13:12:33.942', NULL, '1792f164-b8ce-4347-8802-41eb8e2d5b85', 'lJ3dxovIlYKfhuh5UzMN0hWMXJC3fWMhpMGJy0bLuseH+DhXYzj8wnrZOE9Vi2G9wzjWmaTZ3hXfPsceiukMwA==', 1, 0, '2017-09-18 13:12:33.947', NULL, 'aVabVlOFRoIrbXPG/fUNNc/KzPmZSGq/jmQoHPwSB9pM04ZUmy1oTt6Y1IOuWScaL33Fy5VosJ/GGt/UD1LFXg==');


--
-- TOC entry 2949 (class 0 OID 16471)
-- Dependencies: 211
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (14, 'jackson-jaxrs-json-provider', 'com.fasterxml.jackson.jaxrs', '2.4.3', 'Functionality to handle JSON input/output for JAX-RS implementations (like Jersey and RESTeasy) using standard Jackson data binding.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (15, 'commons-lang3', 'org.apache.commons', '3.1', 'Provides highly reusable static utility methods, chiefly concerned with adding value to the java.lang classes.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (16, 'slf4j-api', 'org.slf4j', '1.7.10', 'Core logging interfaces.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (17, 'slf4j-log4j12', 'org.slf4j', '1.7.10', 'SLF4J ship with a module called log4j-over-slf4j. It allows log4j users to migrate existing applications to SLF4J without changing a single line of code but simply by replacing the log4j.jar file with log4j-over-slf4j.jar.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (18, 'log4j', 'log4j', '1.2.17', 'Log4j is an open source project based on the work of many authors. It allows the developer to control which log statements are output with arbitrary granularity. It is fully configurable at runtime using external configuration files.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (19, 'javax.ws.rs-api', 'javax.ws.rs', '2.0', 'High-level interfaces and annotations used to create RESTful service resources.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (20, 'commons-dbcp', 'commons-dbcp', '1.3', 'Database Connection Pool API.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (21, 'hibernate-validator', 'org.hibernate', '5.0.3.Final', 'Hibernate Validator allows to express and validate application constraints. The default metadata source are annotations, with the ability to override and extend through the use of XML.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (22, 'spring-jdbc', 'org.springframework', '3.2.12.RELEASE', 'This is the central class in the JDBC core package. It simplifies the use of JDBC and helps to avoid common errors. It executes core JDBC workflow, leaving application code to provide SQL and extract results.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (23, 'servlet-api', 'javax.servlet', '2.5', 'Packages. javax.servlet. The javax.servlet package contains a number of classes and interfaces that describe and define the contracts between a servlet class and the runtime environment provided for an instance of such a class by a conforming servlet container.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (24, 'validation-api', 'javax.validation', '1.1.0.Final', 'Validating user input is, of course, a super common requirement in most applications, and the Java Bean Validation framework has become the de-facto standard for handling this kind of logic.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (25, 'jackson-core-asl', 'org.codehaus.jackson', '1.9.12', 'Jackson is a high-performance JSON processor (parser, generator)');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (26, 'jedis', 'redis.clients', '2.9.0', 'Jedis is a blazingly small and sane Redis java client.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (27, 'jackson-jaxrs', 'org.codehaus.jackson', '1.9.0', 'Jackson-based JAX-RS provider that can automatically serialize and deserialize resources for JSON content type (MediaType).');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (29, 'mssql-jdbc', 'com.microsoft.sqlserver', '6.3.6.jre7-preview', 'MS SQL database related classes will be available in this jar file');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (30, 'mysql-connector-java', 'mysql', '5.1.6', 'My SQL database related classes will be available in this jar file');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (3, 'camel-blueprint', 'org.apache.camel', '2.15.1', 'A custom XML namespace for Blueprint has been created to let you leverage the nice XML dialect. Given Blueprint custom namespaces are not standardized yet, this namespace can only be used on the Apache Aries Blueprint implementation, which is the one used by Apache Karaf.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (4, 'camel-cxf', 'org.apache.camel', '2.15.1', 'the CXF Bean Component allows you to factor out how message payloads are received from their processing as a RESTful or SOAP web service.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (5, 'camel-jackson', 'org.apache.camel', '2.15.1', 'JSON is a Data Format to marshal and unmarshal Java objects to and from JSON.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (6, 'camel-xmljson', 'org.apache.camel', '2.15.1', 'Camel format provides the capability to convert from XML to JSON and viceversa directly, without stepping through intermediate POJOs.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (7, 'camel-http', 'org.apache.camel', '2.15.1', 'The http: component provides HTTP based endpoints for consuming external HTTP resources (as a client to call external servers using HTTP).');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (8, 'camel-jsonpath', 'org.apache.camel', '2.15.1', 'Camel supports JSonPath to allow using Expression or Predicate on JSON messages.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (9, 'camel-bean-validator', 'org.apache.camel', '2.15.1', 'The Validation component performs bean validation of the message body using the Java Bean Validation API (JSR 303). Camel uses the reference implementation, which is Hibernate Validator.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (10, 'camel-spring', 'org.apache.camel', '2.15.1', 'Camel uses Spring Transactions as the default transaction handling in components like JMS and JPA and supports a powerful version of Spring Remoting which can use powerful routing between the client and server side along with using all of the available Components for the transport');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (11, 'camel-jms', 'org.apache.camel', '2.15.1', 'This component allows messages to be sent to (or consumed from) a JMS Queue or Topic. It uses Springs JMS support for declarative transactions, including Spring JmsTemplate for sending and a MessageListenerContainer for consuming.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (1, 'camel-jasypt', 'org.apache.camel', '2.15.1', 'Jasypt is a simplified encryption library which makes encryption and decryption easy. Camel integrates with Jasypt to allow sensitive information in Properties files to be encrypted111.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (2, 'camel-core', 'org.apache.camel', '2.15.1', 'Camel-core is the basic module of apache camel. It contains the public API and the Java DSL and several implementation packages.');
INSERT INTO public.dependency (dependency_id, artifact_id, group_id, version, description) VALUES (12, 'jaxb-api', 'javax.xml.bind', '2.1', 'Provides a runtime binding framework for client applications including unmarshalling, marshalling, and validation capabilities.');


--
-- TOC entry 2952 (class 0 OID 16481)
-- Dependencies: 214
-- Data for Name: information_detail; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2964 (class 0 OID 16616)
-- Dependencies: 228
-- Data for Name: mail_server_setting; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2953 (class 0 OID 16484)
-- Dependencies: 215
-- Data for Name: method_datatype; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.method_datatype (id, data_type) VALUES (2, 'Integer');
INSERT INTO public.method_datatype (id, data_type) VALUES (1, 'String');
INSERT INTO public.method_datatype (id, data_type) VALUES (4, 'Double');
INSERT INTO public.method_datatype (id, data_type) VALUES (3, 'Long');
INSERT INTO public.method_datatype (id, data_type) VALUES (6, 'Boolean');
INSERT INTO public.method_datatype (id, data_type) VALUES (5, 'Float');
INSERT INTO public.method_datatype (id, data_type) VALUES (8, 'Time');
INSERT INTO public.method_datatype (id, data_type) VALUES (7, 'Date');


--
-- TOC entry 2954 (class 0 OID 16487)
-- Dependencies: 216
-- Data for Name: method_validation_rule; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.method_validation_rule (id, validation_name) VALUES (2, 'Not Blank');
INSERT INTO public.method_validation_rule (id, validation_name) VALUES (1, 'Not Null');
INSERT INTO public.method_validation_rule (id, validation_name) VALUES (6, 'Apha Numeric');
INSERT INTO public.method_validation_rule (id, validation_name) VALUES (5, 'Only Number');


--
-- TOC entry 2961 (class 0 OID 16527)
-- Dependencies: 225
-- Data for Name: project_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2955 (class 0 OID 16490)
-- Dependencies: 217
-- Data for Name: provider_agency_app_servicereg; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2963 (class 0 OID 16605)
-- Dependencies: 227
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.role (role_id, role_name) VALUES (2, 'GENERAL USER');
INSERT INTO public.role (role_id, role_name) VALUES (1, 'ADMIN');


--
-- TOC entry 2956 (class 0 OID 16493)
-- Dependencies: 218
-- Data for Name: server_location; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2957 (class 0 OID 16499)
-- Dependencies: 219
-- Data for Name: service_catalog; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2959 (class 0 OID 16505)
-- Dependencies: 221
-- Data for Name: service_details; Type: TABLE DATA; Schema: public; Owner: root
--



--
-- TOC entry 2960 (class 0 OID 16521)
-- Dependencies: 224
-- Data for Name: ws_user; Type: TABLE DATA; Schema: public; Owner: root
--

INSERT INTO public.ws_user (user_id, first_name, is_active, last_name, password, user_name, ws_data, svn_url, role_id, email, flag) VALUES (2, 'admin', true, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', NULL, 'http://172.16.5.45/Delivery/APAC/MALASIA/Active/Censof_WS_Generator/PDLC/SVNCommit/', 1, 'admin.admin', true);


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 198
-- Name: agency_app_service_authentication_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.agency_app_service_authentication_seq', 1128, false);


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 200
-- Name: agency_application_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.agency_application_seq', 1, false);


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 202
-- Name: agency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.agency_id_seq', 208, false);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 204
-- Name: agency_service_reg_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.agency_service_reg_seq', 1, false);


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 209
-- Name: cons_agency_application_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.cons_agency_application_seq', 1, false);


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 212
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.hibernate_sequence', 893, true);


--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 213
-- Name: imt_data_tracking_tracking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.imt_data_tracking_tracking_id_seq', 1, false);


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 220
-- Name: service_details_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.service_details_seq', 1092, false);


--
-- TOC entry 2791 (class 2606 OID 16559)
-- Name: config_properties config_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.config_properties
    ADD CONSTRAINT config_properties_pkey PRIMARY KEY (config_property_id);


--
-- TOC entry 2806 (class 2606 OID 16557)
-- Name: configuration configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.configuration
    ADD CONSTRAINT configuration_pkey PRIMARY KEY (configuration_id);


--
-- TOC entry 2793 (class 2606 OID 16555)
-- Name: dependency dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependency
    ADD CONSTRAINT dependency_pkey PRIMARY KEY (dependency_id);


--
-- TOC entry 2810 (class 2606 OID 16623)
-- Name: mail_server_setting mail_server_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mail_server_setting
    ADD CONSTRAINT mail_server_setting_pkey PRIMARY KEY (mail_server_setting_id);


--
-- TOC entry 2795 (class 2606 OID 16553)
-- Name: method_datatype method_datatype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.method_datatype
    ADD CONSTRAINT method_datatype_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 16551)
-- Name: method_validation_rule method_validation_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.method_validation_rule
    ADD CONSTRAINT method_validation_rule_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 16549)
-- Name: project_details project_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_details
    ADD CONSTRAINT project_details_pkey PRIMARY KEY (project_id);


--
-- TOC entry 2808 (class 2606 OID 16609)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 2799 (class 2606 OID 16547)
-- Name: server_location server_location_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.server_location
    ADD CONSTRAINT server_location_pkey PRIMARY KEY (server_location_id);


--
-- TOC entry 2802 (class 2606 OID 16540)
-- Name: ws_user ws_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ws_user
    ADD CONSTRAINT ws_user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2800 (class 1259 OID 16615)
-- Name: fki_ws_user_fkey; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fki_ws_user_fkey ON public.ws_user USING btree (role_id);


--
-- TOC entry 2812 (class 2606 OID 16541)
-- Name: project_details fk_userid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_details
    ADD CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES public.ws_user(user_id);


--
-- TOC entry 2811 (class 2606 OID 16610)
-- Name: ws_user ws_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.ws_user
    ADD CONSTRAINT ws_user_fkey FOREIGN KEY (role_id) REFERENCES public.role(role_id);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE dependency; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.dependency TO root;


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE mail_server_setting; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.mail_server_setting TO root WITH GRANT OPTION;


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE role; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.role FROM root;
GRANT ALL ON TABLE public.role TO root WITH GRANT OPTION;


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE ws_user; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE public.ws_user FROM root;
GRANT ALL ON TABLE public.ws_user TO root WITH GRANT OPTION;
GRANT ALL ON TABLE public.ws_user TO postgres WITH GRANT OPTION;


-- Completed on 2019-05-09 13:07:29

--
-- PostgreSQL database dump complete
--

