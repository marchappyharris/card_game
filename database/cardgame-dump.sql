--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: cg_schema; Type: SCHEMA; Schema: -; Owner: mharris
--

CREATE SCHEMA cg_schema;


ALTER SCHEMA cg_schema OWNER TO mharris;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = cg_schema, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO mharris;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO mharris;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO mharris;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO mharris;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO mharris;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO mharris;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO mharris;

--
-- Name: auth_user_groups; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO mharris;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO mharris;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO mharris;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO mharris;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO mharris;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: box_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE box_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE box_definition_id_seq OWNER TO mharris;

--
-- Name: box_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE box_definition (
    id integer DEFAULT nextval('box_definition_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE box_definition OWNER TO mharris;

--
-- Name: box_definition_M2M_deck_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE "box_definition_M2M_deck_definition_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "box_definition_M2M_deck_definition_id_seq" OWNER TO mharris;

--
-- Name: SEQUENCE "box_definition_M2M_deck_definition_id_seq"; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE "box_definition_M2M_deck_definition_id_seq" IS 'DbWrench Autogenerated Sequence.';


--
-- Name: box_definition_m2m_deck_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE box_definition_m2m_deck_definition (
    id integer DEFAULT nextval('"box_definition_M2M_deck_definition_id_seq"'::regclass) NOT NULL,
    deck_definition_id integer NOT NULL,
    box_definition_id integer NOT NULL,
    deck_name character varying(255) NOT NULL
);


ALTER TABLE box_definition_m2m_deck_definition OWNER TO mharris;

--
-- Name: card_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE card_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE card_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE card_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: card; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card (
    id integer DEFAULT nextval('card_id_seq'::regclass) NOT NULL,
    deck_definition_m2m_card_definition_id integer NOT NULL,
    deck_id integer NOT NULL
);


ALTER TABLE card OWNER TO mharris;

--
-- Name: card_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE card_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE card_definition_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE card_definition_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE card_definition_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: card_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_definition (
    id integer DEFAULT nextval('card_definition_id_seq'::regclass) NOT NULL,
    front_face_definition_id integer NOT NULL,
    back_face_definition_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE card_definition OWNER TO mharris;

--
-- Name: card_definition_attribute_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE card_definition_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE card_definition_attribute_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE card_definition_attribute_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE card_definition_attribute_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: card_definition_attribute; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_definition_attribute (
    card_definition_attribute_definition_id integer NOT NULL,
    value character varying(255),
    card_definition_id integer NOT NULL,
    id integer DEFAULT nextval('card_definition_attribute_id_seq'::regclass) NOT NULL
);


ALTER TABLE card_definition_attribute OWNER TO mharris;

--
-- Name: card_definition_attribute_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE card_definition_attribute_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE card_definition_attribute_definition_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE card_definition_attribute_definition_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE card_definition_attribute_definition_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: card_definition_attribute_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_definition_attribute_definition (
    id integer DEFAULT nextval('card_definition_attribute_definition_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    card_type_id integer NOT NULL
);


ALTER TABLE card_definition_attribute_definition OWNER TO mharris;

--
-- Name: card_in_array; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_in_array (
    card_in_collection_id integer NOT NULL,
    ordinal integer NOT NULL
);


ALTER TABLE card_in_array OWNER TO mharris;

--
-- Name: card_in_collection_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE card_in_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE card_in_collection_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE card_in_collection_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE card_in_collection_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: card_in_collection; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_in_collection (
    id integer DEFAULT nextval('card_in_collection_id_seq'::regclass) NOT NULL,
    collection_id integer NOT NULL,
    visible_to_others boolean NOT NULL,
    visible_to_player boolean NOT NULL,
    orientation_type_id integer,
    card_id integer NOT NULL
);


ALTER TABLE card_in_collection OWNER TO mharris;

--
-- Name: card_in_fan; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_in_fan (
    card_in_collection_id integer NOT NULL,
    ordinal integer NOT NULL
);


ALTER TABLE card_in_fan OWNER TO mharris;

--
-- Name: card_in_grid; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_in_grid (
    card_in_collection_id integer NOT NULL,
    other_card integer,
    grid_direction_type_id integer,
    grid_proximity_type_id integer
);


ALTER TABLE card_in_grid OWNER TO mharris;

--
-- Name: card_in_pile; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_in_pile (
    card_in_collection_id integer NOT NULL,
    ordinal integer NOT NULL
);


ALTER TABLE card_in_pile OWNER TO mharris;

--
-- Name: card_in_tabletop; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_in_tabletop (
    card_in_collection_id integer NOT NULL,
    z_order integer DEFAULT 0 NOT NULL,
    y double precision NOT NULL,
    x double precision NOT NULL
);


ALTER TABLE card_in_tabletop OWNER TO mharris;

--
-- Name: card_type_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE card_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE card_type_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE card_type_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE card_type_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: card_type; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE card_type (
    id integer DEFAULT nextval('card_type_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE card_type OWNER TO mharris;

--
-- Name: collection_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE collection_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE collection_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE collection_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: collection; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE collection (
    id integer DEFAULT nextval('collection_id_seq'::regclass) NOT NULL,
    collection_definition_id integer NOT NULL,
    parent_collection_id integer,
    name character varying(255),
    player_m2m_game_session_id integer,
    game_session_id integer NOT NULL
);


ALTER TABLE collection OWNER TO mharris;

--
-- Name: collection_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE collection_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE collection_definition_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE collection_definition_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE collection_definition_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: collection_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE collection_definition (
    id integer DEFAULT nextval('collection_definition_id_seq'::regclass) NOT NULL,
    per_player boolean NOT NULL,
    name character varying(255) NOT NULL,
    collection_type_id integer NOT NULL
);


ALTER TABLE collection_definition OWNER TO mharris;

--
-- Name: collection_definition_parent_child_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE collection_definition_parent_child_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE collection_definition_parent_child_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE collection_definition_parent_child_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE collection_definition_parent_child_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: collection_definition_parent_child; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE collection_definition_parent_child (
    id integer DEFAULT nextval('collection_definition_parent_child_id_seq'::regclass) NOT NULL,
    child_collection_definition_id integer NOT NULL,
    parent_collection_definition_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE collection_definition_parent_child OWNER TO mharris;

--
-- Name: collection_type_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE collection_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE collection_type_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE collection_type_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE collection_type_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: collection_type; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE collection_type (
    id integer DEFAULT nextval('collection_type_id_seq'::regclass) NOT NULL,
    name character varying(255)
);


ALTER TABLE collection_type OWNER TO mharris;

--
-- Name: deck_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE deck_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deck_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE deck_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE deck_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: deck; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE deck (
    id integer DEFAULT nextval('deck_id_seq'::regclass) NOT NULL,
    box_definition_m2m_deck_definition_id integer NOT NULL,
    game_session_id integer NOT NULL
);


ALTER TABLE deck OWNER TO mharris;

--
-- Name: deck_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE deck_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE deck_definition_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE deck_definition_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE deck_definition_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: deck_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE deck_definition (
    id integer DEFAULT nextval('deck_definition_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE deck_definition OWNER TO mharris;

--
-- Name: deck_definition_M2M_card_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE "deck_definition_M2M_card_definition_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "deck_definition_M2M_card_definition_id_seq" OWNER TO mharris;

--
-- Name: SEQUENCE "deck_definition_M2M_card_definition_id_seq"; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE "deck_definition_M2M_card_definition_id_seq" IS 'DbWrench Autogenerated Sequence.';


--
-- Name: deck_definition_m2m_card_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE deck_definition_m2m_card_definition (
    id integer DEFAULT nextval('"deck_definition_M2M_card_definition_id_seq"'::regclass) NOT NULL,
    deck_definition_id integer NOT NULL,
    card_definition_id integer NOT NULL,
    ordinal integer NOT NULL
);


ALTER TABLE deck_definition_m2m_card_definition OWNER TO mharris;

--
-- Name: create_cards_vw; Type: VIEW; Schema: cg_schema; Owner: mharris
--

CREATE VIEW create_cards_vw AS
 SELECT dc_d.id AS deck_definition_m2m_card_definition_id,
    d.id AS deck_id,
    d.id AS d_id,
    d.box_definition_m2m_deck_definition_id AS d_box_definition_m2m_deck_definition_id,
    d.game_session_id AS d_game_session_id,
    bd_d.id AS bd_d_id,
    bd_d.deck_definition_id AS bd_d_box_definition_id,
    bd_d.deck_name AS bd_d_deck_name,
    d_d.id AS d_d_id,
    d_d.name AS d_d_name,
    dc_d.id AS dc_d_id,
    dc_d.deck_definition_id AS dc_d_deck_definition_id,
    dc_d.card_definition_id AS dc_d_card_definition_id,
    dc_d.ordinal AS dc_d_ordinal,
    c_d.id AS c_d_id,
    c_d.name AS c_d_name
   FROM ((((deck d
     JOIN box_definition_m2m_deck_definition bd_d ON ((d.box_definition_m2m_deck_definition_id = bd_d.id)))
     JOIN deck_definition d_d ON ((d_d.id = bd_d.deck_definition_id)))
     JOIN deck_definition_m2m_card_definition dc_d ON ((d_d.id = dc_d.deck_definition_id)))
     JOIN card_definition c_d ON ((dc_d.card_definition_id = c_d.id)));


ALTER TABLE create_cards_vw OWNER TO mharris;

--
-- Name: django_admin_log; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO mharris;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO mharris;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO mharris;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO mharris;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO mharris;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO mharris;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: cg_schema; Owner: mharris
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO mharris;

--
-- Name: face_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE face_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE face_definition_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE face_definition_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE face_definition_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: face_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE face_definition (
    id integer DEFAULT nextval('face_definition_id_seq'::regclass) NOT NULL,
    text_display character varying(255) NOT NULL,
    large_image character varying(255),
    small_image character varying(255)
);


ALTER TABLE face_definition OWNER TO mharris;

--
-- Name: game_definition_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE game_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_definition_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE game_definition_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE game_definition_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: game_definition; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE game_definition (
    id integer DEFAULT nextval('game_definition_id_seq'::regclass) NOT NULL,
    box_definition_id integer NOT NULL,
    initial_collection_definition_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE game_definition OWNER TO mharris;

--
-- Name: game_session_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE game_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_session_id_seq OWNER TO mharris;

--
-- Name: game_session; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE game_session (
    id integer DEFAULT nextval('game_session_id_seq'::regclass) NOT NULL,
    game_definition_id integer NOT NULL
);


ALTER TABLE game_session OWNER TO mharris;

--
-- Name: grid_direction_type_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE grid_direction_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grid_direction_type_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE grid_direction_type_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE grid_direction_type_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: grid_direction_type; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE grid_direction_type (
    id integer DEFAULT nextval('grid_direction_type_id_seq'::regclass) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE grid_direction_type OWNER TO mharris;

--
-- Name: grid_proximity_type_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE grid_proximity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE grid_proximity_type_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE grid_proximity_type_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE grid_proximity_type_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: grid_proximity_type; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE grid_proximity_type (
    id integer DEFAULT nextval('grid_proximity_type_id_seq'::regclass) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE grid_proximity_type OWNER TO mharris;

--
-- Name: orientation_type_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE orientation_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orientation_type_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE orientation_type_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE orientation_type_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: orientation_type; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE orientation_type (
    id integer DEFAULT nextval('orientation_type_id_seq'::regclass) NOT NULL,
    label character varying(255) NOT NULL
);


ALTER TABLE orientation_type OWNER TO mharris;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE player_id_seq OWNER TO mharris;

--
-- Name: player; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE player (
    id integer DEFAULT nextval('player_id_seq'::regclass) NOT NULL,
    user_name character varying(255) NOT NULL
);


ALTER TABLE player OWNER TO mharris;

--
-- Name: player_M2M_game_session_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE "player_M2M_game_session_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "player_M2M_game_session_id_seq" OWNER TO mharris;

--
-- Name: SEQUENCE "player_M2M_game_session_id_seq"; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE "player_M2M_game_session_id_seq" IS 'DbWrench Autogenerated Sequence.';


--
-- Name: player_m2m_game_session; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE player_m2m_game_session (
    id integer DEFAULT nextval('"player_M2M_game_session_id_seq"'::regclass) NOT NULL,
    player_id integer NOT NULL,
    player_alias character varying(255),
    game_session_id integer NOT NULL
);


ALTER TABLE player_m2m_game_session OWNER TO mharris;

--
-- Name: visibility_type_id_seq; Type: SEQUENCE; Schema: cg_schema; Owner: mharris
--

CREATE SEQUENCE visibility_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE visibility_type_id_seq OWNER TO mharris;

--
-- Name: SEQUENCE visibility_type_id_seq; Type: COMMENT; Schema: cg_schema; Owner: mharris
--

COMMENT ON SEQUENCE visibility_type_id_seq IS 'DbWrench Autogenerated Sequence.';


--
-- Name: visibility_type; Type: TABLE; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE TABLE visibility_type (
    id integer DEFAULT nextval('visibility_type_id_seq'::regclass) NOT NULL,
    visibility character varying(255)
);


ALTER TABLE visibility_type OWNER TO mharris;

--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add auth group	7	add_authgroup
20	Can change auth group	7	change_authgroup
21	Can delete auth group	7	delete_authgroup
22	Can add auth group permissions	8	add_authgrouppermissions
23	Can change auth group permissions	8	change_authgrouppermissions
24	Can delete auth group permissions	8	delete_authgrouppermissions
25	Can add auth permission	9	add_authpermission
26	Can change auth permission	9	change_authpermission
27	Can delete auth permission	9	delete_authpermission
28	Can add auth user	10	add_authuser
29	Can change auth user	10	change_authuser
30	Can delete auth user	10	delete_authuser
31	Can add auth user groups	11	add_authusergroups
32	Can change auth user groups	11	change_authusergroups
33	Can delete auth user groups	11	delete_authusergroups
34	Can add auth user user permissions	12	add_authuseruserpermissions
35	Can change auth user user permissions	12	change_authuseruserpermissions
36	Can delete auth user user permissions	12	delete_authuseruserpermissions
37	Can add box definition	13	add_boxdefinition
38	Can change box definition	13	change_boxdefinition
39	Can delete box definition	13	delete_boxdefinition
40	Can add box definition m2m deck definition	14	add_boxdefinitionm2mdeckdefinition
41	Can change box definition m2m deck definition	14	change_boxdefinitionm2mdeckdefinition
42	Can delete box definition m2m deck definition	14	delete_boxdefinitionm2mdeckdefinition
43	Can add card	15	add_card
44	Can change card	15	change_card
45	Can delete card	15	delete_card
46	Can add card definition	16	add_carddefinition
47	Can change card definition	16	change_carddefinition
48	Can delete card definition	16	delete_carddefinition
49	Can add card definition attribute	17	add_carddefinitionattribute
50	Can change card definition attribute	17	change_carddefinitionattribute
51	Can delete card definition attribute	17	delete_carddefinitionattribute
52	Can add card definition attribute definition	18	add_carddefinitionattributedefinition
53	Can change card definition attribute definition	18	change_carddefinitionattributedefinition
54	Can delete card definition attribute definition	18	delete_carddefinitionattributedefinition
55	Can add card in array	19	add_cardinarray
56	Can change card in array	19	change_cardinarray
57	Can delete card in array	19	delete_cardinarray
58	Can add card in collection	20	add_cardincollection
59	Can change card in collection	20	change_cardincollection
60	Can delete card in collection	20	delete_cardincollection
61	Can add card in fan	21	add_cardinfan
62	Can change card in fan	21	change_cardinfan
63	Can delete card in fan	21	delete_cardinfan
64	Can add card in grid	22	add_cardingrid
65	Can change card in grid	22	change_cardingrid
66	Can delete card in grid	22	delete_cardingrid
67	Can add card in pile	23	add_cardinpile
68	Can change card in pile	23	change_cardinpile
69	Can delete card in pile	23	delete_cardinpile
70	Can add card in tabletop	24	add_cardintabletop
71	Can change card in tabletop	24	change_cardintabletop
72	Can delete card in tabletop	24	delete_cardintabletop
73	Can add card type	25	add_cardtype
74	Can change card type	25	change_cardtype
75	Can delete card type	25	delete_cardtype
76	Can add collection	26	add_collection
77	Can change collection	26	change_collection
78	Can delete collection	26	delete_collection
79	Can add collection definition	27	add_collectiondefinition
80	Can change collection definition	27	change_collectiondefinition
81	Can delete collection definition	27	delete_collectiondefinition
82	Can add collection definition parent child	28	add_collectiondefinitionparentchild
83	Can change collection definition parent child	28	change_collectiondefinitionparentchild
84	Can delete collection definition parent child	28	delete_collectiondefinitionparentchild
85	Can add collection type	29	add_collectiontype
86	Can change collection type	29	change_collectiontype
87	Can delete collection type	29	delete_collectiontype
88	Can add deck	30	add_deck
89	Can change deck	30	change_deck
90	Can delete deck	30	delete_deck
91	Can add deck definition	31	add_deckdefinition
92	Can change deck definition	31	change_deckdefinition
93	Can delete deck definition	31	delete_deckdefinition
94	Can add deck definition m2m card definition	32	add_deckdefinitionm2mcarddefinition
95	Can change deck definition m2m card definition	32	change_deckdefinitionm2mcarddefinition
96	Can delete deck definition m2m card definition	32	delete_deckdefinitionm2mcarddefinition
97	Can add django admin log	33	add_djangoadminlog
98	Can change django admin log	33	change_djangoadminlog
99	Can delete django admin log	33	delete_djangoadminlog
100	Can add django content type	34	add_djangocontenttype
101	Can change django content type	34	change_djangocontenttype
102	Can delete django content type	34	delete_djangocontenttype
103	Can add django migrations	35	add_djangomigrations
104	Can change django migrations	35	change_djangomigrations
105	Can delete django migrations	35	delete_djangomigrations
106	Can add django session	36	add_djangosession
107	Can change django session	36	change_djangosession
108	Can delete django session	36	delete_djangosession
109	Can add face definition	37	add_facedefinition
110	Can change face definition	37	change_facedefinition
111	Can delete face definition	37	delete_facedefinition
112	Can add game definition	38	add_gamedefinition
113	Can change game definition	38	change_gamedefinition
114	Can delete game definition	38	delete_gamedefinition
115	Can add game session	39	add_gamesession
116	Can change game session	39	change_gamesession
117	Can delete game session	39	delete_gamesession
118	Can add grid direction type	40	add_griddirectiontype
119	Can change grid direction type	40	change_griddirectiontype
120	Can delete grid direction type	40	delete_griddirectiontype
121	Can add grid proximity type	41	add_gridproximitytype
122	Can change grid proximity type	41	change_gridproximitytype
123	Can delete grid proximity type	41	delete_gridproximitytype
124	Can add orientation type	42	add_orientationtype
125	Can change orientation type	42	change_orientationtype
126	Can delete orientation type	42	delete_orientationtype
127	Can add player	43	add_player
128	Can change player	43	change_player
129	Can delete player	43	delete_player
130	Can add player m2m game session	44	add_playerm2mgamesession
131	Can change player m2m game session	44	change_playerm2mgamesession
132	Can delete player m2m game session	44	delete_playerm2mgamesession
133	Can add visibility type	45	add_visibilitytype
134	Can change visibility type	45	change_visibilitytype
135	Can delete visibility type	45	delete_visibilitytype
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('auth_permission_id_seq', 135, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$VmSbbr8wOfrl$cqig9ZFkJUpSuhjoE5TjjcEG4dzlQRM0jRBoEaREeIY=	2016-01-31 01:23:03.7746-05	t	mharris			admin@example.com	t	t	2016-01-30 01:44:04.941256-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: box_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY box_definition (id, name) FROM stdin;
1	Simple cards
2	Tarot
3	San Juan
\.


--
-- Name: box_definition_M2M_deck_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('"box_definition_M2M_deck_definition_id_seq"', 8, true);


--
-- Name: box_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('box_definition_id_seq', 3, true);


--
-- Data for Name: box_definition_m2m_deck_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY box_definition_m2m_deck_definition (id, deck_definition_id, box_definition_id, deck_name) FROM stdin;
1	1	1	Deck
2	2	2	Deck
3	3	3	Main deck
6	4	3	Indigo cards
7	5	3	Role cards
8	6	3	Trading prices
\.


--
-- Data for Name: card; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card (id, deck_definition_m2m_card_definition_id, deck_id) FROM stdin;
66	298	1
67	351	1
68	347	1
69	343	1
70	339	1
71	335	1
72	331	1
73	327	1
74	299	1
75	352	1
76	348	1
77	344	1
78	340	1
79	336	1
80	332	1
81	328	1
82	300	1
83	353	1
84	349	1
85	345	1
86	341	1
87	337	1
88	333	1
89	329	1
90	301	1
91	354	1
92	350	1
93	346	1
94	342	1
95	338	1
96	334	1
97	330	1
98	304	1
99	384	1
100	364	1
101	305	1
102	385	1
103	365	1
104	306	1
105	386	1
106	366	1
107	307	1
108	387	1
109	367	1
56	302	4
57	363	4
58	362	4
59	361	4
60	360	4
61	359	4
62	358	4
2	109	2
3	110	2
4	111	2
5	112	2
6	113	2
7	114	2
8	115	2
9	116	2
10	117	2
11	118	2
110	308	1
111	388	1
112	368	1
113	309	1
114	389	1
65	355	4
64	356	4
63	357	4
12	119	2
13	120	2
14	121	2
15	122	2
16	123	2
17	124	2
18	125	2
19	126	2
20	127	2
21	128	2
22	129	2
23	130	2
24	131	2
25	132	2
26	133	2
27	134	2
28	135	2
29	136	2
30	137	2
31	138	2
32	139	2
33	140	2
34	141	2
35	142	2
36	143	2
37	144	2
38	145	2
39	146	2
40	147	2
41	148	2
42	149	2
43	150	2
44	151	2
45	152	2
46	153	2
47	154	2
48	155	2
49	156	2
50	157	2
51	158	2
52	159	2
53	160	2
54	161	2
55	162	2
166	408	5
167	409	5
168	410	5
169	411	5
170	412	5
171	413	5
172	415	6
173	416	6
174	417	6
175	418	6
176	419	6
115	369	1
116	310	1
117	390	1
118	370	1
119	311	1
120	391	1
121	371	1
122	312	1
123	392	1
124	372	1
125	313	1
126	393	1
127	373	1
128	314	1
129	394	1
130	374	1
131	315	1
132	395	1
133	375	1
134	316	1
135	396	1
136	376	1
137	317	1
138	397	1
139	377	1
140	318	1
141	398	1
142	378	1
143	319	1
144	399	1
145	379	1
146	320	1
147	400	1
148	380	1
149	321	1
150	401	1
151	381	1
152	322	1
153	402	1
154	382	1
155	323	1
156	404	1
157	324	1
158	405	1
159	325	1
160	406	1
161	326	1
162	407	1
163	303	1
164	403	1
165	383	1
\.


--
-- Data for Name: card_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_definition (id, front_face_definition_id, back_face_definition_id, name) FROM stdin;
1	67	110	A♢
2	69	110	2♢
3	70	110	3♢
4	71	110	4♢
5	72	110	5♢
6	73	110	6♢
7	74	110	7♢
8	75	110	8♢
9	76	110	9♢
10	77	110	T♢
11	78	110	J♢
12	79	110	Q♢
13	80	110	K♢
14	81	110	A♠
15	83	110	2♠
16	84	110	3♠
17	85	110	4♠
18	86	110	5♠
19	87	110	6♠
20	88	110	7♠
21	89	110	8♠
22	53	110	A♡
23	55	110	2♡
24	56	110	3♡
25	57	110	4♡
26	58	110	5♡
27	59	110	6♡
28	60	110	7♡
29	61	110	8♡
30	62	110	9♡
31	63	110	T♡
32	64	110	J♡
33	65	110	Q♡
34	66	110	K♡
35	90	110	9♠
36	91	110	T♠
37	92	110	J♠
38	93	110	Q♠
39	94	110	K♠
40	95	110	A♣
41	97	110	2♣
42	98	110	3♣
43	99	110	4♣
44	100	110	5♣
45	101	110	6♣
46	102	110	7♣
47	103	110	8♣
48	104	110	9♣
49	105	110	T♣
50	106	110	J♣
51	107	110	Q♣
52	108	110	K♣
53	111	110	Joker 1
54	112	110	Joker 2
55	113	110	C♢
56	114	110	C♠
57	115	110	C♣
58	116	110	C♡
59	117	110	1T
60	118	110	2T
61	119	110	3T
62	120	110	4T
63	121	110	5T
64	122	110	6T
65	123	110	7T
66	124	110	8T
67	125	110	9T
68	126	110	10T
69	127	110	11T
70	128	110	12T
71	129	110	13T
72	130	110	14T
73	131	110	15T
74	132	110	16T
75	133	110	17T
76	134	110	18T
77	135	110	19T
78	136	110	20T
79	137	110	21T
80	138	167	Indigo plant
81	139	167	Sugar mill
82	140	167	Tobacco storage
83	141	167	Coffee roaster
84	142	167	Silver smelter
85	143	167	Archive
86	144	167	Smithy
87	145	167	Well
88	146	167	Black market
89	147	167	Poor house
90	148	167	Market stand
91	149	167	Crane
92	150	167	Trading post
93	151	167	Chapel
94	152	167	Tower
95	153	167	Aqueduct
96	154	167	Prefecture
97	155	167	Carpenter
98	156	167	Statue
99	157	167	Market hall
100	158	167	Quarry
101	159	167	Victory column
102	160	167	Library
103	161	167	Hero
104	162	167	Guild hall
105	163	167	Triumphal arch
106	164	167	Palace
107	165	167	City hall
108	166	167	Gold mine
109	168	168	Councillor
110	169	169	Producer
111	170	170	Builder
112	171	171	Governor
113	172	172	Trader
114	173	173	Prospector
115	174	179	11122
116	175	179	11223
117	176	179	11222
118	177	179	12233
119	178	179	12223
120	181	110	Fool
\.


--
-- Data for Name: card_definition_attribute; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_definition_attribute (card_definition_attribute_definition_id, value, card_definition_id, id) FROM stdin;
1	A	1	14
1	2	2	15
1	3	3	16
1	4	4	17
1	5	5	18
1	6	6	19
1	7	7	20
1	8	8	21
1	9	9	22
1	T	10	23
1	J	11	24
1	Q	12	25
1	K	13	26
1	A	14	27
1	2	15	28
1	3	16	29
1	4	17	30
1	5	18	31
1	6	19	32
1	7	20	33
1	8	21	34
1	A	22	35
1	2	23	36
1	3	24	37
1	4	25	38
1	5	26	39
1	6	27	40
1	7	28	41
1	8	29	42
1	9	30	43
1	T	31	44
1	J	32	45
1	Q	33	46
1	K	34	47
1	9	35	48
1	T	36	49
1	J	37	50
1	Q	38	51
1	K	39	52
1	A	40	53
1	2	41	54
1	3	42	55
1	4	43	56
1	5	44	57
1	6	45	58
1	7	46	59
1	8	47	60
1	9	48	61
1	T	49	62
1	J	50	63
1	Q	51	64
1	K	52	65
3	2	2	123
3	3	3	124
3	4	4	125
3	5	5	126
3	6	6	127
3	7	7	128
3	8	8	129
3	9	9	130
3	2	15	136
3	3	16	137
3	4	17	138
3	5	18	139
3	6	19	140
3	7	20	141
3	8	21	142
3	2	23	144
3	3	24	145
3	4	25	146
3	5	26	147
3	6	27	148
3	7	28	149
3	8	29	150
3	9	30	151
3	9	35	156
3	2	41	162
3	3	42	163
3	4	43	164
3	5	44	165
3	6	45	166
3	7	46	167
3	8	47	168
3	9	48	169
3	1,11	1	122
3	1,11	14	135
3	1,11	22	143
3	1,11	40	161
3	10	10	131
3	10	31	152
3	10	36	157
3	10	49	170
3	10	11	132
3	10	32	153
3	10	37	158
3	10	50	171
3	Joker	54	175
2	Red	54	121
3	10	12	133
3	10	33	154
3	10	38	159
3	10	51	172
3	10	13	134
3	10	34	155
3	10	39	160
3	10	52	173
1	Joker	53	66
1	Joker	54	67
2	Hearts	22	89
2	Black	53	120
3	Joker	53	174
2	Hearts	23	90
2	Hearts	24	91
2	Hearts	25	92
2	Hearts	26	93
2	Hearts	27	94
2	Hearts	28	95
2	Hearts	29	96
2	Hearts	30	97
2	Hearts	31	98
2	Hearts	32	99
2	Hearts	33	100
2	Clubs	40	107
2	Clubs	41	108
2	Clubs	42	109
2	Clubs	43	110
2	Clubs	44	111
2	Clubs	45	112
2	Clubs	46	113
2	Clubs	47	114
2	Clubs	48	115
2	Clubs	49	116
2	Clubs	50	117
2	Clubs	51	118
2	Clubs	52	119
2	Diamonds	1	68
2	Diamonds	2	69
2	Diamonds	3	70
2	Diamonds	4	71
2	Diamonds	5	72
2	Diamonds	6	73
2	Diamonds	7	74
2	Diamonds	8	75
2	Diamonds	9	76
2	Diamonds	10	77
2	Spades	14	81
2	Spades	15	82
2	Spades	16	83
2	Spades	17	84
2	Spades	18	85
2	Spades	19	86
2	Spades	20	87
2	Spades	21	88
2	Spades	35	102
2	Spades	36	103
2	Diamonds	11	78
2	Diamonds	12	79
2	Diamonds	13	80
2	Hearts	34	101
2	Spades	37	104
2	Spades	38	105
2	Spades	39	106
1	C	55	177
1	C	56	178
1	C	58	179
1	C	57	180
3	10	55	181
3	10	56	182
3	10	57	183
3	10	58	184
2	Diamonds	55	185
2	Spades	56	186
2	Clubs	57	187
2	Hearts	58	188
1	1	59	189
1	2	60	190
1	3	61	191
1	4	62	192
1	5	63	193
1	6	64	194
1	7	65	195
1	8	66	196
1	9	67	197
1	10	68	198
1	11	69	199
1	12	70	200
1	13	71	201
1	14	72	202
1	15	73	203
1	16	74	204
1	17	75	205
1	18	76	206
1	19	77	207
1	20	78	208
1	21	79	209
2	Trump	59	210
2	Trump	60	211
2	Trump	61	212
2	Trump	62	213
2	Trump	63	214
2	Trump	64	215
2	Trump	65	216
2	Trump	66	217
2	Trump	67	218
2	Trump	68	219
2	Trump	69	220
2	Trump	70	221
2	Trump	71	222
2	Trump	72	223
2	Trump	73	224
2	Trump	74	225
2	Trump	75	226
2	Trump	76	227
2	Trump	77	228
2	Trump	78	229
2	Trump	79	230
3	1	59	231
3	2	60	232
3	3	61	233
3	4	62	234
3	5	63	235
3	6	64	236
3	7	65	237
3	8	66	238
3	9	67	239
3	10	68	240
3	11	69	241
3	12	70	242
3	13	71	243
3	14	72	244
3	15	73	245
3	16	74	246
3	17	75	247
3	18	76	248
3	19	77	249
3	20	78	250
3	21	79	251
13	Indigo plant	80	252
13	Sugar mill	81	253
13	Tobacco storage	82	254
13	Coffee roaster	83	255
13	Silver smelter	84	256
13	Archive	85	257
13	Smithy	86	258
13	Well	87	259
13	Black market	88	260
13	Poor house	89	261
13	Market stand	90	262
13	Crane	91	263
13	Trading post	92	264
13	Chapel	93	265
13	Tower	94	266
13	Aqueduct	95	267
13	Prefecture	96	268
13	Carpenter	97	269
13	Statue	98	270
13	Market hall	99	271
13	Quarry	100	272
13	Victory column	101	273
13	Library	102	274
13	Hero	103	275
13	Guild hall	104	276
13	Triumphal arch	105	277
13	Palace	106	278
13	City hall	107	279
8	1	80	282
8	2	81	283
8	3	82	284
8	4	83	285
8	5	84	286
8	1	85	287
8	1	86	288
8	2	87	289
8	2	88	290
8	2	89	291
8	2	90	292
8	2	91	293
8	2	92	294
8	3	93	295
8	3	94	296
8	3	95	297
8	3	96	298
8	3	97	299
8	3	98	300
8	4	99	301
8	4	100	302
8	4	101	303
8	5	102	304
8	5	103	305
8	6	105	307
8	6	106	308
8	6	107	309
8	6	104	306
13	Gold mine	108	311
8	1	108	312
26	Councillor	109	327
26	Producer	110	328
26	Builder	111	329
26	Governor	112	330
26	Trader	113	331
26	Prospector	114	332
21	1	115	333
21	1	116	334
21	1	117	335
21	1	118	336
21	1	119	337
22	1	115	338
22	1	116	339
22	1	117	340
22	2	118	341
22	2	119	342
23	1	115	343
23	2	116	344
23	2	117	345
23	2	118	346
23	2	119	347
24	2	115	348
24	2	116	349
24	2	117	350
24	2	119	351
24	3	118	352
25	2	115	353
25	3	116	354
25	2	117	355
25	3	118	356
25	3	119	357
1	Fool	120	358
3	0	120	360
2	Fool	120	359
\.


--
-- Data for Name: card_definition_attribute_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_definition_attribute_definition (id, name, card_type_id) FROM stdin;
1	Rank	1
2	Suit	1
3	Values	1
8	Cost	2
9	Victory points	2
10	IsViolet	2
11	Phase	2
12	Description	2
13	Name	2
21	1 cost	5
22	2 cost	5
23	3 cost	5
24	4 cost	5
25	5 cost	5
26	role	4
27	action	4
28	privilege	4
\.


--
-- Name: card_definition_attribute_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('card_definition_attribute_definition_id_seq', 28, true);


--
-- Name: card_definition_attribute_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('card_definition_attribute_id_seq', 360, true);


--
-- Name: card_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('card_definition_id_seq', 120, true);


--
-- Name: card_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('card_id_seq', 176, true);


--
-- Data for Name: card_in_array; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_in_array (card_in_collection_id, ordinal) FROM stdin;
1095	1
1096	1
1097	1
1098	1
1099	1
1100	1
\.


--
-- Data for Name: card_in_collection; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_in_collection (id, collection_id, visible_to_others, visible_to_player, orientation_type_id, card_id) FROM stdin;
995	7	f	f	1	66
996	7	f	f	1	67
997	7	f	f	1	68
998	7	f	f	1	69
999	7	f	f	1	70
1000	7	f	f	1	71
1001	7	f	f	1	72
1002	7	f	f	1	73
1003	7	f	f	1	74
1004	7	f	f	1	75
1005	7	f	f	1	76
1006	7	f	f	1	77
1007	7	f	f	1	78
1008	7	f	f	1	79
1009	7	f	f	1	80
1010	7	f	f	1	81
1011	7	f	f	1	82
1012	7	f	f	1	83
1013	7	f	f	1	84
1014	7	f	f	1	85
1015	7	f	f	1	86
1016	7	f	f	1	87
1017	7	f	f	1	88
1018	7	f	f	1	89
1019	7	f	f	1	90
729	3	f	f	1	2
730	3	f	f	1	3
731	3	f	f	1	4
732	3	f	f	1	5
733	3	f	f	1	6
734	3	f	f	1	7
735	3	f	f	1	8
736	3	f	f	1	9
737	3	f	f	1	10
738	3	f	f	1	11
739	3	f	f	1	12
740	3	f	f	1	13
741	3	f	f	1	14
742	3	f	f	1	15
743	3	f	f	1	16
744	3	f	f	1	17
745	3	f	f	1	18
746	3	f	f	1	19
747	3	f	f	1	20
748	3	f	f	1	21
749	3	f	f	1	22
750	3	f	f	1	23
751	3	f	f	1	24
752	3	f	f	1	25
753	3	f	f	1	26
754	3	f	f	1	27
755	3	f	f	1	28
756	3	f	f	1	29
757	3	f	f	1	30
758	3	f	f	1	31
759	3	f	f	1	32
760	3	f	f	1	33
761	3	f	f	1	34
762	3	f	f	1	35
763	3	f	f	1	36
764	3	f	f	1	37
765	3	f	f	1	38
766	3	f	f	1	39
767	3	f	f	1	40
768	3	f	f	1	41
769	3	f	f	1	42
770	3	f	f	1	43
771	3	f	f	1	44
772	3	f	f	1	45
773	3	f	f	1	46
774	3	f	f	1	47
775	3	f	f	1	48
776	3	f	f	1	49
777	3	f	f	1	50
778	3	f	f	1	51
779	3	f	f	1	52
780	3	f	f	1	53
781	3	f	f	1	54
782	3	f	f	1	55
1020	7	f	f	1	91
1021	7	f	f	1	92
1022	7	f	f	1	93
1023	7	f	f	1	94
1024	7	f	f	1	95
1025	7	f	f	1	96
1026	7	f	f	1	97
1027	7	f	f	1	98
1028	7	f	f	1	99
1029	7	f	f	1	100
1030	7	f	f	1	101
1031	7	f	f	1	102
1032	7	f	f	1	103
1033	7	f	f	1	104
1034	7	f	f	1	105
1035	7	f	f	1	106
1036	7	f	f	1	107
1037	7	f	f	1	108
1038	7	f	f	1	109
1039	7	f	f	1	110
1040	7	f	f	1	111
1041	7	f	f	1	112
1042	7	f	f	1	113
1043	7	f	f	1	114
1106	14	t	t	1	65
1107	15	t	t	1	64
1108	16	t	t	1	63
1095	20	t	t	1	166
1096	20	t	t	1	167
1097	20	t	t	1	168
1098	20	t	t	1	169
1099	20	t	t	1	170
1100	20	t	t	1	171
1101	8	f	f	1	172
1102	8	f	f	1	173
1103	8	f	f	1	174
1104	8	f	f	1	175
1105	8	f	f	1	176
1044	7	f	f	1	115
1045	7	f	f	1	116
1046	7	f	f	1	117
1047	7	f	f	1	118
1048	7	f	f	1	119
1049	7	f	f	1	120
1050	7	f	f	1	121
1051	7	f	f	1	122
1052	7	f	f	1	123
1053	7	f	f	1	124
1054	7	f	f	1	125
1055	7	f	f	1	126
1056	7	f	f	1	127
1057	7	f	f	1	128
1058	7	f	f	1	129
1059	7	f	f	1	130
1060	7	f	f	1	131
1061	7	f	f	1	132
1062	7	f	f	1	133
1063	7	f	f	1	134
1064	7	f	f	1	135
1065	7	f	f	1	136
1066	7	f	f	1	137
1067	7	f	f	1	138
1068	7	f	f	1	139
1069	7	f	f	1	140
1070	7	f	f	1	141
1071	7	f	f	1	142
1072	7	f	f	1	143
1073	7	f	f	1	144
1074	7	f	f	1	145
1075	7	f	f	1	146
1076	7	f	f	1	147
1077	7	f	f	1	148
1078	7	f	f	1	149
1079	7	f	f	1	150
1080	7	f	f	1	151
1081	7	f	f	1	152
1082	7	f	f	1	153
1083	7	f	f	1	154
1084	7	f	f	1	155
1085	7	f	f	1	156
1086	7	f	f	1	157
1087	7	f	f	1	158
1088	7	f	f	1	159
1089	7	f	f	1	160
1090	7	f	f	1	161
1091	7	f	f	1	162
1092	7	f	f	1	163
1093	7	f	f	1	164
1094	7	f	f	1	165
\.


--
-- Name: card_in_collection_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('card_in_collection_id_seq', 1108, true);


--
-- Data for Name: card_in_fan; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_in_fan (card_in_collection_id, ordinal) FROM stdin;
\.


--
-- Data for Name: card_in_grid; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_in_grid (card_in_collection_id, other_card, grid_direction_type_id, grid_proximity_type_id) FROM stdin;
1106	\N	\N	\N
1107	\N	\N	\N
1108	\N	\N	\N
\.


--
-- Data for Name: card_in_pile; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_in_pile (card_in_collection_id, ordinal) FROM stdin;
729	1
730	1
731	1
732	1
733	1
734	1
735	1
736	1
737	1
738	1
739	1
740	1
741	1
742	1
743	1
744	1
745	1
746	1
747	1
748	1
749	1
750	1
751	1
752	1
753	1
754	1
755	1
756	1
757	1
758	1
759	1
760	1
761	1
762	1
763	1
764	1
765	1
766	1
767	1
768	1
769	1
770	1
771	1
772	1
773	1
774	1
775	1
776	1
777	1
778	1
779	1
780	1
781	1
782	1
1101	1
1102	1
1103	1
1104	1
1105	1
995	1
996	1
997	1
998	1
999	1
1000	1
1001	1
1002	1
1003	1
1004	1
1005	1
1006	1
1007	1
1008	1
1009	1
1010	1
1011	1
1012	1
1013	1
1014	1
1015	1
1016	1
1017	1
1018	1
1019	1
1020	1
1021	1
1022	1
1023	1
1024	1
1025	1
1026	1
1027	1
1028	1
1029	1
1030	1
1031	1
1032	1
1033	1
1034	1
1035	1
1036	1
1037	1
1038	1
1039	1
1040	1
1041	1
1042	1
1043	1
1044	1
1045	1
1046	1
1047	1
1048	1
1049	1
1050	1
1051	1
1052	1
1053	1
1054	1
1055	1
1056	1
1057	1
1058	1
1059	1
1060	1
1061	1
1062	1
1063	1
1064	1
1065	1
1066	1
1067	1
1068	1
1069	1
1070	1
1071	1
1072	1
1073	1
1074	1
1075	1
1076	1
1077	1
1078	1
1079	1
1080	1
1081	1
1082	1
1083	1
1084	1
1085	1
1086	1
1087	1
1088	1
1089	1
1090	1
1091	1
1092	1
1093	1
1094	1
\.


--
-- Data for Name: card_in_tabletop; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_in_tabletop (card_in_collection_id, z_order, y, x) FROM stdin;
\.


--
-- Data for Name: card_type; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY card_type (id, name) FROM stdin;
1	playing card
4	San Juan Role
5	San Juan Trading
2	San Juan card
\.


--
-- Name: card_type_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('card_type_id_seq', 5, true);


--
-- Data for Name: collection; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY collection (id, collection_definition_id, parent_collection_id, name, player_m2m_game_session_id, game_session_id) FROM stdin;
1	9	\N	\N	\N	1
2	13	\N	\N	\N	2
3	1	1	\N	\N	2
4	2	1	\N	\N	2
5	3	1	\N	4	2
6	3	1	\N	5	2
7	1	2	Main draw	\N	1
8	1	2	Trade draw	\N	1
9	2	2	Main discard	\N	1
10	2	2	Trade discard	\N	1
11	3	2	\N	1	1
12	3	2	\N	2	1
13	3	2	\N	3	1
14	14	2	\N	3	1
15	14	2	\N	2	1
16	14	2	\N	1	1
17	15	2	\N	1	1
18	15	2	\N	2	1
19	15	2	\N	3	1
20	16	2	\N	\N	1
\.


--
-- Data for Name: collection_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY collection_definition (id, per_player, name, collection_type_id) FROM stdin;
1	f	Draw pile	2
2	f	Discard pile	2
3	t	Players hand	1
5	t	Counting pile	2
7	t	Played card	2
9	f	Yaniv layout	4
10	f	Tarot layout	4
11	f	Rummy layout	4
13	f	San Juan layout	4
12	f	Winning hand	1
14	t	Player area	5
15	t	Player role	3
16	f	Roles	3
\.


--
-- Name: collection_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('collection_definition_id_seq', 16, true);


--
-- Data for Name: collection_definition_parent_child; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY collection_definition_parent_child (id, child_collection_definition_id, parent_collection_definition_id, name) FROM stdin;
1	1	9	\N
2	2	9	\N
3	3	9	\N
4	1	10	\N
5	3	10	\N
6	7	10	\N
7	5	10	\N
8	1	11	\N
9	2	11	\N
10	3	11	\N
11	12	11	\N
14	3	13	\N
45	14	13	\N
46	15	13	\N
47	16	13	\N
48	1	13	Trade values draw pile
49	2	13	Trade values discard pile
12	1	13	Main draw pile
13	2	13	Main discard pile
\.


--
-- Name: collection_definition_parent_child_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('collection_definition_parent_child_id_seq', 49, true);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('collection_id_seq', 20, true);


--
-- Data for Name: collection_type; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY collection_type (id, name) FROM stdin;
2	pile
3	array
4	tabletop
5	grid
1	fan
\.


--
-- Name: collection_type_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('collection_type_id_seq', 6, true);


--
-- Data for Name: deck; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY deck (id, box_definition_m2m_deck_definition_id, game_session_id) FROM stdin;
2	1	2
1	3	1
4	6	1
5	7	1
6	8	1
\.


--
-- Data for Name: deck_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY deck_definition (id, name) FROM stdin;
1	Standard
2	Tarot
3	San Juan main
4	San Juan indigo
5	San Juan role placards
6	San Juan trading prices
\.


--
-- Name: deck_definition_M2M_card_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('"deck_definition_M2M_card_definition_id_seq"', 419, true);


--
-- Name: deck_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('deck_definition_id_seq', 6, true);


--
-- Data for Name: deck_definition_m2m_card_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY deck_definition_m2m_card_definition (id, deck_definition_id, card_definition_id, ordinal) FROM stdin;
219	2	1	1
220	2	2	1
221	2	3	1
222	2	4	1
223	2	5	1
224	2	6	1
225	2	7	1
226	2	8	1
227	2	9	1
228	2	10	1
229	2	11	1
230	2	12	1
231	2	13	1
232	2	14	1
233	2	15	1
234	2	16	1
235	2	17	1
236	2	18	1
237	2	19	1
238	2	20	1
239	2	21	1
240	2	22	1
241	2	23	1
242	2	24	1
243	2	25	1
244	2	26	1
245	2	27	1
246	2	28	1
247	2	29	1
248	2	30	1
249	2	31	1
250	2	32	1
251	2	33	1
252	2	34	1
253	2	35	1
254	2	36	1
255	2	37	1
256	2	38	1
257	2	39	1
258	2	40	1
259	2	41	1
260	2	42	1
261	2	43	1
262	2	44	1
263	2	45	1
264	2	46	1
265	2	47	1
266	2	48	1
267	2	49	1
268	2	50	1
269	2	51	1
270	2	52	1
271	2	53	1
109	1	1	1
110	1	2	1
111	1	3	1
112	1	4	1
113	1	5	1
114	1	6	1
115	1	7	1
116	1	8	1
117	1	9	1
118	1	10	1
119	1	11	1
120	1	12	1
121	1	13	1
122	1	14	1
123	1	15	1
124	1	16	1
125	1	17	1
126	1	18	1
127	1	19	1
128	1	20	1
129	1	21	1
130	1	22	1
131	1	23	1
132	1	24	1
133	1	25	1
134	1	26	1
135	1	27	1
136	1	28	1
137	1	29	1
138	1	30	1
139	1	31	1
140	1	32	1
141	1	33	1
142	1	34	1
143	1	35	1
144	1	36	1
145	1	37	1
146	1	38	1
147	1	39	1
148	1	40	1
149	1	41	1
150	1	42	1
151	1	43	1
152	1	44	1
153	1	45	1
154	1	46	1
155	1	47	1
156	1	48	1
157	1	49	1
158	1	50	1
159	1	51	1
160	1	52	1
161	1	53	1
162	1	54	1
272	2	54	1
273	2	55	1
274	2	56	1
275	2	57	1
276	2	58	1
277	2	59	1
278	2	60	1
279	2	61	1
280	2	62	1
281	2	63	1
282	2	64	1
283	2	65	1
284	2	66	1
285	2	67	1
286	2	68	1
287	2	69	1
288	2	70	1
289	2	71	1
290	2	72	1
291	2	73	1
292	2	74	1
293	2	75	1
294	2	76	1
295	2	77	1
296	2	78	1
297	2	79	1
298	3	81	8
299	3	82	8
300	3	83	8
301	3	84	8
302	4	80	10
303	3	108	3
304	3	85	3
305	3	86	3
306	3	87	3
307	3	88	3
308	3	89	3
309	3	90	3
310	3	91	3
311	3	92	3
312	3	93	3
313	3	94	3
314	3	95	3
315	3	96	3
316	3	97	3
317	3	98	3
318	3	99	3
319	3	100	3
320	3	101	3
321	3	102	3
322	3	103	3
323	3	104	2
324	3	105	2
325	3	106	2
326	3	107	2
327	3	81	1
328	3	82	1
329	3	83	1
330	3	84	1
331	3	81	2
332	3	82	2
333	3	83	2
334	3	84	2
335	3	81	3
336	3	82	3
337	3	83	3
338	3	84	3
339	3	81	4
340	3	82	4
341	3	83	4
342	3	84	4
343	3	81	5
344	3	82	5
345	3	83	5
346	3	84	5
347	3	81	6
348	3	82	6
349	3	83	6
350	3	84	6
351	3	81	7
352	3	82	7
353	3	83	7
354	3	84	7
355	4	80	1
356	4	80	2
357	4	80	3
358	4	80	4
359	4	80	5
360	4	80	6
361	4	80	7
362	4	80	8
363	4	80	9
364	3	85	1
365	3	86	1
366	3	87	1
367	3	88	1
368	3	89	1
369	3	90	1
370	3	91	1
371	3	92	1
372	3	93	1
373	3	94	1
374	3	95	1
375	3	96	1
376	3	97	1
377	3	98	1
378	3	99	1
379	3	100	1
380	3	101	1
381	3	102	1
382	3	103	1
383	3	108	1
384	3	85	2
385	3	86	2
386	3	87	2
387	3	88	2
388	3	89	2
389	3	90	2
390	3	91	2
391	3	92	2
392	3	93	2
393	3	94	2
394	3	95	2
395	3	96	2
396	3	97	2
397	3	98	2
398	3	99	2
399	3	100	2
400	3	101	2
401	3	102	2
402	3	103	2
403	3	108	2
404	3	104	1
405	3	105	1
406	3	106	1
407	3	107	1
408	5	109	1
409	5	110	1
410	5	111	1
411	5	112	1
412	5	113	1
413	5	114	1
415	6	115	1
416	6	116	1
417	6	117	1
418	6	118	1
419	6	119	1
\.


--
-- Name: deck_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('deck_id_seq', 6, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	definitions	authgroup
8	definitions	authgrouppermissions
9	definitions	authpermission
10	definitions	authuser
11	definitions	authusergroups
12	definitions	authuseruserpermissions
13	definitions	boxdefinition
14	definitions	boxdefinitionm2mdeckdefinition
15	definitions	card
16	definitions	carddefinition
17	definitions	carddefinitionattribute
18	definitions	carddefinitionattributedefinition
19	definitions	cardinarray
20	definitions	cardincollection
21	definitions	cardinfan
22	definitions	cardingrid
23	definitions	cardinpile
24	definitions	cardintabletop
25	definitions	cardtype
26	definitions	collection
27	definitions	collectiondefinition
28	definitions	collectiondefinitionparentchild
29	definitions	collectiontype
30	definitions	deck
31	definitions	deckdefinition
32	definitions	deckdefinitionm2mcarddefinition
33	definitions	djangoadminlog
34	definitions	djangocontenttype
35	definitions	djangomigrations
36	definitions	djangosession
37	definitions	facedefinition
38	definitions	gamedefinition
39	definitions	gamesession
40	definitions	griddirectiontype
41	definitions	gridproximitytype
42	definitions	orientationtype
43	definitions	player
44	definitions	playerm2mgamesession
45	definitions	visibilitytype
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('django_content_type_id_seq', 45, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-01-29 22:06:12.468494-05
2	auth	0001_initial	2016-01-29 22:06:12.524711-05
3	admin	0001_initial	2016-01-29 22:06:12.547905-05
4	admin	0002_logentry_remove_auto_add	2016-01-29 22:06:12.561199-05
5	contenttypes	0002_remove_content_type_name	2016-01-29 22:06:12.586714-05
6	auth	0002_alter_permission_name_max_length	2016-01-29 22:06:12.597169-05
7	auth	0003_alter_user_email_max_length	2016-01-29 22:06:12.607272-05
8	auth	0004_alter_user_username_opts	2016-01-29 22:06:12.618848-05
9	auth	0005_alter_user_last_login_null	2016-01-29 22:06:12.62886-05
10	auth	0006_require_contenttypes_0002	2016-01-29 22:06:12.630619-05
11	auth	0007_alter_validators_add_error_messages	2016-01-29 22:06:12.639556-05
12	sessions	0001_initial	2016-01-29 22:06:12.648239-05
13	definitions	0001_initial	2016-01-30 01:09:29.303011-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('django_migrations_id_seq', 13, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
ul6mb9mei91vwa3n3293oc5ftz3hxq9t	MzFlYzdhZDE2YzQ5ZmU3NTQxY2E2OTk2MGUwNmI2NGI3NjRlNjljZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwNWRmNjVhNWMwNmRjZjllNDM1ZTE1Mzk2ZDc3MzQ1ZGMxODEwNGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-14 01:23:03.776279-05
\.


--
-- Data for Name: face_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY face_definition (id, text_display, large_image, small_image) FROM stdin;
67	A♢	\N	\N
69	2♢	\N	\N
70	3♢	\N	\N
71	4♢	\N	\N
72	5♢	\N	\N
73	6♢	\N	\N
74	7♢	\N	\N
75	8♢	\N	\N
76	9♢	\N	\N
77	T♢	\N	\N
78	J♢	\N	\N
79	Q♢	\N	\N
80	K♢	\N	\N
111	Joker1	\N	\N
112	Joker2	\N	\N
113	C♢	\N	\N
114	C♠	\N	\N
116	C♡	\N	\N
115	C♣	\N	\N
117	1T	\N	\N
118	2T	\N	\N
119	3T	\N	\N
120	4T	\N	\N
121	5T	\N	\N
122	6T	\N	\N
123	7T	\N	\N
124	8T	\N	\N
125	9T	\N	\N
126	10T	\N	\N
127	11T	\N	\N
128	12T	\N	\N
129	13T	\N	\N
130	14T	\N	\N
131	15T	\N	\N
132	16T	\N	\N
133	17T	\N	\N
134	18T	\N	\N
135	19T	\N	\N
136	20T	\N	\N
137	21T	\N	\N
81	A♠	\N	\N
83	2♠	\N	\N
84	3♠	\N	\N
85	4♠	\N	\N
86	5♠	\N	\N
87	6♠	\N	\N
88	7♠	\N	\N
89	8♠	\N	\N
53	A♡	\N	\N
55	2♡	\N	\N
56	3♡	\N	\N
57	4♡	\N	\N
58	5♡	\N	\N
59	6♡	\N	\N
60	7♡	\N	\N
61	8♡	\N	\N
62	9♡	\N	\N
63	T♡	\N	\N
64	J♡	\N	\N
65	Q♡	\N	\N
66	K♡	\N	\N
90	9♠	\N	\N
91	T♠	\N	\N
92	J♠	\N	\N
93	Q♠	\N	\N
94	K♠	\N	\N
138	Indigo plant	\N	\N
139	Sugar mill	\N	\N
140	Tobacco storage	\N	\N
141	Coffee roaster	\N	\N
142	Silver smelter	\N	\N
143	Archive	\N	\N
144	Smithy	\N	\N
145	Well	\N	\N
146	Black market	\N	\N
147	Poor house	\N	\N
148	Market stand	\N	\N
149	Crane	\N	\N
150	Trading post	\N	\N
151	Chapel	\N	\N
152	Tower	\N	\N
95	A♣	\N	\N
97	2♣	\N	\N
98	3♣	\N	\N
99	4♣	\N	\N
100	5♣	\N	\N
101	6♣	\N	\N
102	7♣	\N	\N
103	8♣	\N	\N
104	9♣	\N	\N
105	T♣	\N	\N
106	J♣	\N	\N
107	Q♣	\N	\N
108	K♣	\N	\N
153	Aqueduct	\N	\N
154	Prefecture	\N	\N
155	Carpenter	\N	\N
156	Statue	\N	\N
157	Market hall	\N	\N
158	Quarry	\N	\N
159	Victory column	\N	\N
160	Library	\N	\N
161	Hero	\N	\N
162	Guild hall	\N	\N
163	Triumphal arch	\N	\N
164	Palace	\N	\N
165	City hall	\N	\N
166	Gold mine	\N	\N
167	SJ	\N	\N
168	Councillor	\N	\N
169	Producer	\N	\N
170	Builder	\N	\N
171	Governor	\N	\N
172	Trader	\N	\N
173	Prospector	\N	\N
174	1 1 1 2 2	\N	\N
175	1 1 2 2 3	\N	\N
176	1 1 2 2 2	\N	\N
177	1 2 2 3 3	\N	\N
178	1 2 2 2 3	\N	\N
179	X X X X X	\N	\N
180	{}	\N	\N
181	Fool	\N	\N
110	[ ]	\N	\N
\.


--
-- Name: face_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('face_definition_id_seq', 181, true);


--
-- Data for Name: game_definition; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY game_definition (id, box_definition_id, initial_collection_definition_id, name) FROM stdin;
1	1	9	Yaniv
2	2	10	Tarot
3	1	11	Rummy
4	3	13	San Juan
\.


--
-- Name: game_definition_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('game_definition_id_seq', 4, true);


--
-- Data for Name: game_session; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY game_session (id, game_definition_id) FROM stdin;
1	4
2	1
\.


--
-- Name: game_session_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('game_session_id_seq', 2, true);


--
-- Data for Name: grid_direction_type; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY grid_direction_type (id, label) FROM stdin;
1	up
2	down
3	left
4	right
5	same
\.


--
-- Name: grid_direction_type_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('grid_direction_type_id_seq', 5, true);


--
-- Data for Name: grid_proximity_type; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY grid_proximity_type (id, label) FROM stdin;
1	overlap
2	underlap
3	adjacent
4	small-gap
5	large-gap
\.


--
-- Name: grid_proximity_type_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('grid_proximity_type_id_seq', 5, true);


--
-- Data for Name: orientation_type; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY orientation_type (id, label) FROM stdin;
1	upright
2	inverted
3	left
4	right
\.


--
-- Name: orientation_type_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('orientation_type_id_seq', 4, true);


--
-- Data for Name: player; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY player (id, user_name) FROM stdin;
1	mharris
2	daphneharris
3	ariellaharris
4	abigailharris
\.


--
-- Name: player_M2M_game_session_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('"player_M2M_game_session_id_seq"', 5, true);


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('player_id_seq', 4, true);


--
-- Data for Name: player_m2m_game_session; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY player_m2m_game_session (id, player_id, player_alias, game_session_id) FROM stdin;
1	1	Marc playing San Juan	1
2	2	\N	1
3	3	\N	1
4	1	Marc playing yaniv	2
5	4	\N	2
\.


--
-- Data for Name: visibility_type; Type: TABLE DATA; Schema: cg_schema; Owner: mharris
--

COPY visibility_type (id, visibility) FROM stdin;
\.


--
-- Name: visibility_type_id_seq; Type: SEQUENCE SET; Schema: cg_schema; Owner: mharris
--

SELECT pg_catalog.setval('visibility_type_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: pkbox_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY box_definition
    ADD CONSTRAINT pkbox_definition PRIMARY KEY (id);


--
-- Name: pkbox_definition_m2m_deck_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY box_definition_m2m_deck_definition
    ADD CONSTRAINT pkbox_definition_m2m_deck_definition PRIMARY KEY (id);


--
-- Name: pkcard; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card
    ADD CONSTRAINT pkcard PRIMARY KEY (id);


--
-- Name: pkcard_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_definition
    ADD CONSTRAINT pkcard_definition PRIMARY KEY (id);


--
-- Name: pkcard_definition_attribute; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_definition_attribute
    ADD CONSTRAINT pkcard_definition_attribute PRIMARY KEY (id);


--
-- Name: pkcard_definition_attribute_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_definition_attribute_definition
    ADD CONSTRAINT pkcard_definition_attribute_definition PRIMARY KEY (id);


--
-- Name: pkcard_in_array; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_in_array
    ADD CONSTRAINT pkcard_in_array PRIMARY KEY (card_in_collection_id);


--
-- Name: pkcard_in_collection; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_in_collection
    ADD CONSTRAINT pkcard_in_collection PRIMARY KEY (id);


--
-- Name: pkcard_in_fan; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_in_fan
    ADD CONSTRAINT pkcard_in_fan PRIMARY KEY (card_in_collection_id);


--
-- Name: pkcard_in_grid; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_in_grid
    ADD CONSTRAINT pkcard_in_grid PRIMARY KEY (card_in_collection_id);


--
-- Name: pkcard_in_pile; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_in_pile
    ADD CONSTRAINT pkcard_in_pile PRIMARY KEY (card_in_collection_id);


--
-- Name: pkcard_type; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY card_type
    ADD CONSTRAINT pkcard_type PRIMARY KEY (id);


--
-- Name: pkcollection; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT pkcollection PRIMARY KEY (id);


--
-- Name: pkcollection_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY collection_definition
    ADD CONSTRAINT pkcollection_definition PRIMARY KEY (id);


--
-- Name: pkcollection_definition_parent_child; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY collection_definition_parent_child
    ADD CONSTRAINT pkcollection_definition_parent_child PRIMARY KEY (id);


--
-- Name: pkcollection_type; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY collection_type
    ADD CONSTRAINT pkcollection_type PRIMARY KEY (id);


--
-- Name: pkdeck; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY deck
    ADD CONSTRAINT pkdeck PRIMARY KEY (id);


--
-- Name: pkdeck_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY deck_definition
    ADD CONSTRAINT pkdeck_definition PRIMARY KEY (id);


--
-- Name: pkdeck_definition_m2m_card_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY deck_definition_m2m_card_definition
    ADD CONSTRAINT pkdeck_definition_m2m_card_definition PRIMARY KEY (id);


--
-- Name: pkface_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY face_definition
    ADD CONSTRAINT pkface_definition PRIMARY KEY (id);


--
-- Name: pkgame_definition; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY game_definition
    ADD CONSTRAINT pkgame_definition PRIMARY KEY (id);


--
-- Name: pkgame_session; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY game_session
    ADD CONSTRAINT pkgame_session PRIMARY KEY (id);


--
-- Name: pkgrid_direction_type; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY grid_direction_type
    ADD CONSTRAINT pkgrid_direction_type PRIMARY KEY (id);


--
-- Name: pkgrid_proximity_type; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY grid_proximity_type
    ADD CONSTRAINT pkgrid_proximity_type PRIMARY KEY (id);


--
-- Name: pkorientation_type; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY orientation_type
    ADD CONSTRAINT pkorientation_type PRIMARY KEY (id);


--
-- Name: pkplayer; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY player
    ADD CONSTRAINT pkplayer PRIMARY KEY (id);


--
-- Name: pkplayer_m2m_game_session; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY player_m2m_game_session
    ADD CONSTRAINT pkplayer_m2m_game_session PRIMARY KEY (id);


--
-- Name: pkvisibility_type; Type: CONSTRAINT; Schema: cg_schema; Owner: mharris; Tablespace: 
--

ALTER TABLE ONLY visibility_type
    ADD CONSTRAINT pkvisibility_type PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: card_in_collection_card_id_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE UNIQUE INDEX "card_in_collection_card_id_Idx" ON card_in_collection USING btree (card_id);


--
-- Name: card_type_Name_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE UNIQUE INDEX "card_type_Name_Idx" ON card_type USING btree (name);


--
-- Name: collection_definition_parent_child_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE UNIQUE INDEX "collection_definition_parent_child_Idx" ON collection_definition_parent_child USING btree (parent_collection_definition_id, child_collection_definition_id, name);


--
-- Name: deck_M2M_card; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE UNIQUE INDEX "deck_M2M_card" ON deck_definition_m2m_card_definition USING btree (card_definition_id, deck_definition_id, ordinal);


--
-- Name: deck_card_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE UNIQUE INDEX "deck_card_Idx" ON box_definition_m2m_deck_definition USING btree (deck_definition_id, box_definition_id, deck_name);


--
-- Name: deck_definition_name_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE UNIQUE INDEX "deck_definition_name_Idx" ON deck_definition USING btree (name);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: game_definition_name_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX "game_definition_name_Idx" ON game_definition USING btree (name);


--
-- Name: grid_direction_type_label_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX "grid_direction_type_label_Idx" ON grid_direction_type USING btree (label);


--
-- Name: grid_proximity_type_label_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX "grid_proximity_type_label_Idx" ON grid_proximity_type USING btree (label);


--
-- Name: orientation_type_label_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX "orientation_type_label_Idx" ON orientation_type USING btree (label);


--
-- Name: pile_type_pile_type_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE UNIQUE INDEX "pile_type_pile_type_Idx" ON collection_type USING btree (name);


--
-- Name: player_m2m_game_session_Idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE INDEX "player_m2m_game_session_Idx" ON player_m2m_game_session USING btree (player_id, player_alias, game_session_id);


--
-- Name: player_name_idx; Type: INDEX; Schema: cg_schema; Owner: mharris; Tablespace: 
--

CREATE UNIQUE INDEX player_name_idx ON player USING btree (user_name);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fk_box_definition_M2M_deck_definition_box_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY box_definition_m2m_deck_definition
    ADD CONSTRAINT "fk_box_definition_M2M_deck_definition_box_definition" FOREIGN KEY (box_definition_id) REFERENCES box_definition(id);


--
-- Name: fk_box_definition_M2M_deck_definition_deck_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY box_definition_m2m_deck_definition
    ADD CONSTRAINT "fk_box_definition_M2M_deck_definition_deck_definition" FOREIGN KEY (deck_definition_id) REFERENCES deck_definition(id);


--
-- Name: fk_card_deck; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card
    ADD CONSTRAINT fk_card_deck FOREIGN KEY (deck_id) REFERENCES deck(id);


--
-- Name: fk_card_deck_definition_m2m_card_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card
    ADD CONSTRAINT fk_card_deck_definition_m2m_card_definition FOREIGN KEY (deck_definition_m2m_card_definition_id) REFERENCES deck_definition_m2m_card_definition(id);


--
-- Name: fk_card_definition_attribute_card_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_definition_attribute
    ADD CONSTRAINT fk_card_definition_attribute_card_definition FOREIGN KEY (card_definition_id) REFERENCES card_definition(id);


--
-- Name: fk_card_definition_attribute_card_definition_attribute_definiti; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_definition_attribute
    ADD CONSTRAINT fk_card_definition_attribute_card_definition_attribute_definiti FOREIGN KEY (card_definition_attribute_definition_id) REFERENCES card_definition_attribute_definition(id);


--
-- Name: fk_card_definition_attribute_definition_card_type; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_definition_attribute_definition
    ADD CONSTRAINT fk_card_definition_attribute_definition_card_type FOREIGN KEY (card_type_id) REFERENCES card_type(id);


--
-- Name: fk_card_definition_back; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_definition
    ADD CONSTRAINT fk_card_definition_back FOREIGN KEY (back_face_definition_id) REFERENCES face_definition(id);


--
-- Name: fk_card_definition_front; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_definition
    ADD CONSTRAINT fk_card_definition_front FOREIGN KEY (front_face_definition_id) REFERENCES face_definition(id);


--
-- Name: fk_card_in_array_card_in_collection; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_array
    ADD CONSTRAINT fk_card_in_array_card_in_collection FOREIGN KEY (card_in_collection_id) REFERENCES card_in_collection(id);


--
-- Name: fk_card_in_collection_card; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_collection
    ADD CONSTRAINT fk_card_in_collection_card FOREIGN KEY (card_id) REFERENCES card(id);


--
-- Name: fk_card_in_collection_collection; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_collection
    ADD CONSTRAINT fk_card_in_collection_collection FOREIGN KEY (collection_id) REFERENCES collection(id);


--
-- Name: fk_card_in_collection_orientation_type; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_collection
    ADD CONSTRAINT fk_card_in_collection_orientation_type FOREIGN KEY (orientation_type_id) REFERENCES orientation_type(id);


--
-- Name: fk_card_in_fan_card_in_collection; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_fan
    ADD CONSTRAINT fk_card_in_fan_card_in_collection FOREIGN KEY (card_in_collection_id) REFERENCES card_in_collection(id);


--
-- Name: fk_card_in_grid_card_in_collection; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_grid
    ADD CONSTRAINT fk_card_in_grid_card_in_collection FOREIGN KEY (card_in_collection_id) REFERENCES card_in_collection(id);


--
-- Name: fk_card_in_grid_grid_direction_type; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_grid
    ADD CONSTRAINT fk_card_in_grid_grid_direction_type FOREIGN KEY (grid_direction_type_id) REFERENCES grid_direction_type(id);


--
-- Name: fk_card_in_grid_grid_proximity_type; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_grid
    ADD CONSTRAINT fk_card_in_grid_grid_proximity_type FOREIGN KEY (grid_proximity_type_id) REFERENCES grid_proximity_type(id);


--
-- Name: fk_card_in_pile_card_in_collection; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_pile
    ADD CONSTRAINT fk_card_in_pile_card_in_collection FOREIGN KEY (card_in_collection_id) REFERENCES card_in_collection(id);


--
-- Name: fk_card_in_tabletop_card_in_collection; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_tabletop
    ADD CONSTRAINT fk_card_in_tabletop_card_in_collection FOREIGN KEY (card_in_collection_id) REFERENCES card_in_collection(id);


--
-- Name: fk_collection_collection; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT fk_collection_collection FOREIGN KEY (parent_collection_id) REFERENCES collection(id);


--
-- Name: fk_collection_collection_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT fk_collection_collection_definition FOREIGN KEY (collection_definition_id) REFERENCES collection_definition(id);


--
-- Name: fk_collection_definition_collection_type; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY collection_definition
    ADD CONSTRAINT fk_collection_definition_collection_type FOREIGN KEY (collection_type_id) REFERENCES collection_type(id);


--
-- Name: fk_collection_definition_parent_child_box_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY collection_definition_parent_child
    ADD CONSTRAINT fk_collection_definition_parent_child_box_definition FOREIGN KEY (parent_collection_definition_id) REFERENCES collection_definition(id);


--
-- Name: fk_collection_definition_parent_child_collection_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY collection_definition_parent_child
    ADD CONSTRAINT fk_collection_definition_parent_child_collection_definition FOREIGN KEY (child_collection_definition_id) REFERENCES collection_definition(id);


--
-- Name: fk_collection_game_session; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT fk_collection_game_session FOREIGN KEY (game_session_id) REFERENCES game_session(id);


--
-- Name: fk_collection_player_m2m_game_session; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY collection
    ADD CONSTRAINT fk_collection_player_m2m_game_session FOREIGN KEY (player_m2m_game_session_id) REFERENCES player_m2m_game_session(id);


--
-- Name: fk_deck_box_definition_m2m_deck_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY deck
    ADD CONSTRAINT fk_deck_box_definition_m2m_deck_definition FOREIGN KEY (box_definition_m2m_deck_definition_id) REFERENCES box_definition_m2m_deck_definition(id);


--
-- Name: fk_deck_definition_M2M_card_definition_card_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY deck_definition_m2m_card_definition
    ADD CONSTRAINT "fk_deck_definition_M2M_card_definition_card_definition" FOREIGN KEY (card_definition_id) REFERENCES card_definition(id);


--
-- Name: fk_deck_definition_M2M_card_definition_deck_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY deck_definition_m2m_card_definition
    ADD CONSTRAINT "fk_deck_definition_M2M_card_definition_deck_definition" FOREIGN KEY (deck_definition_id) REFERENCES deck_definition(id);


--
-- Name: fk_deck_game_session; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY deck
    ADD CONSTRAINT fk_deck_game_session FOREIGN KEY (game_session_id) REFERENCES game_session(id);


--
-- Name: fk_game_session_game_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY game_session
    ADD CONSTRAINT fk_game_session_game_definition FOREIGN KEY (game_definition_id) REFERENCES game_definition(id);


--
-- Name: fk_grid_relationship; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY card_in_grid
    ADD CONSTRAINT fk_grid_relationship FOREIGN KEY (other_card) REFERENCES card_in_grid(card_in_collection_id);


--
-- Name: fk_initial_layout_definition_box_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY game_definition
    ADD CONSTRAINT fk_initial_layout_definition_box_definition FOREIGN KEY (box_definition_id) REFERENCES box_definition(id);


--
-- Name: fk_initial_layout_definition_collection_definition; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY game_definition
    ADD CONSTRAINT fk_initial_layout_definition_collection_definition FOREIGN KEY (initial_collection_definition_id) REFERENCES collection_definition(id);


--
-- Name: fk_player_M2M_game_session_game_session; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY player_m2m_game_session
    ADD CONSTRAINT "fk_player_M2M_game_session_game_session" FOREIGN KEY (game_session_id) REFERENCES game_session(id);


--
-- Name: fk_player_M2M_game_session_player; Type: FK CONSTRAINT; Schema: cg_schema; Owner: mharris
--

ALTER TABLE ONLY player_m2m_game_session
    ADD CONSTRAINT "fk_player_M2M_game_session_player" FOREIGN KEY (player_id) REFERENCES player(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: mharris
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mharris;
GRANT ALL ON SCHEMA public TO mharris;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

