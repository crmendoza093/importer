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
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    neighborhood character varying(255),
    search_vector tsvector,
    postal_code character varying NOT NULL,
    updated_at timestamp(6) without time zone,
    updated boolean DEFAULT false NOT NULL,
    country_id integer,
    state_id integer,
    city_id integer,
    district_id integer,
    postal_code_id integer,
    municipality_id integer
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: carrier_invoice_shipments_a_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carrier_invoice_shipments_a_seq
    START WITH 1066993
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carrier_invoice_surcharges_a_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carrier_invoice_surcharges_a_seq
    START WITH 268213
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying NOT NULL,
    country_id bigint NOT NULL,
    state_id bigint,
    district_id bigint
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: cities_postal_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_postal_codes (
    city_id bigint,
    postal_code_id bigint
);


--
-- Name: country_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country_data (
    id integer NOT NULL,
    country_code character(2),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: country_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.country_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: country_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.country_data_id_seq OWNED BY public.country_data.id;


--
-- Name: districts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.districts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    country_id bigint NOT NULL,
    state_id bigint
);


--
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.districts_id_seq OWNED BY public.districts.id;


--
-- Name: invoices_a_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invoices_a_seq
    START WITH 190024
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: municipalities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.municipalities (
    id bigint NOT NULL,
    name character varying NOT NULL,
    country_id bigint NOT NULL,
    state_id bigint,
    district_id bigint,
    city_id bigint
);


--
-- Name: municipalities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.municipalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: municipalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.municipalities_id_seq OWNED BY public.municipalities.id;


--
-- Name: postal_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.postal_codes (
    id bigint NOT NULL,
    code character varying NOT NULL,
    district_id bigint,
    state_id bigint,
    country_id bigint NOT NULL,
    municipality_id bigint
);


--
-- Name: postal_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.postal_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: postal_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.postal_codes_id_seq OWNED BY public.postal_codes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: states; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.states (
    id bigint NOT NULL,
    code character varying(2),
    name character varying,
    country_id bigint NOT NULL
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: country_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_data ALTER COLUMN id SET DEFAULT nextval('public.country_data_id_seq'::regclass);


--
-- Name: districts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts ALTER COLUMN id SET DEFAULT nextval('public.districts_id_seq'::regclass);


--
-- Name: municipalities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.municipalities ALTER COLUMN id SET DEFAULT nextval('public.municipalities_id_seq'::regclass);


--
-- Name: postal_codes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postal_codes ALTER COLUMN id SET DEFAULT nextval('public.postal_codes_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: country_data countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_data
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: districts districts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT districts_pkey PRIMARY KEY (id);


--
-- Name: municipalities municipalities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.municipalities
    ADD CONSTRAINT municipalities_pkey PRIMARY KEY (id);


--
-- Name: postal_codes postal_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postal_codes
    ADD CONSTRAINT postal_codes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: address_search_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX address_search_idx ON public.addresses USING gin (search_vector);


--
-- Name: addresses_city_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_city_id_index ON public.addresses USING btree (city_id);


--
-- Name: addresses_country_id_updated_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_country_id_updated_index ON public.addresses USING btree (country_id, updated);


--
-- Name: addresses_district_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_district_id_index ON public.addresses USING btree (district_id);


--
-- Name: addresses_municipality_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_municipality_id_index ON public.addresses USING btree (municipality_id);


--
-- Name: addresses_neighborhood_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_neighborhood_index ON public.addresses USING btree (neighborhood);


--
-- Name: addresses_postal_code_id_country_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_postal_code_id_country_id_index ON public.addresses USING btree (postal_code_id, country_id);


--
-- Name: addresses_postal_code_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_postal_code_id_index ON public.addresses USING btree (postal_code_id);


--
-- Name: addresses_state_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_state_id_index ON public.addresses USING btree (state_id);


--
-- Name: addresses_updated_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX addresses_updated_index ON public.addresses USING btree (updated);


--
-- Name: combined_city_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX combined_city_idx ON public.cities USING btree (name, country_id, state_id, district_id);


--
-- Name: combined_code_country_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX combined_code_country_id_idx ON public.postal_codes USING btree (country_id, code);


--
-- Name: combined_code_country_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX combined_code_country_idx ON public.states USING btree (code, country_id);


--
-- Name: combined_district_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX combined_district_idx ON public.districts USING btree (name, country_id, state_id);


--
-- Name: combined_municipality_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX combined_municipality_idx ON public.municipalities USING btree (name, country_id, state_id, district_id, city_id);


--
-- Name: combined_postal_code_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX combined_postal_code_idx ON public.postal_codes USING btree (code, country_id, state_id, district_id, municipality_id);


--
-- Name: country_data_country_code_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX country_data_country_code_index ON public.country_data USING btree (country_code);


--
-- Name: index_cities_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cities_on_country_id ON public.cities USING btree (country_id);


--
-- Name: index_cities_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cities_on_district_id ON public.cities USING btree (district_id);


--
-- Name: index_cities_on_state_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cities_on_state_id ON public.cities USING btree (state_id);


--
-- Name: index_cities_postal_codes_on_postal_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cities_postal_codes_on_postal_code_id ON public.cities_postal_codes USING btree (postal_code_id);


--
-- Name: index_districts_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_districts_on_country_id ON public.districts USING btree (country_id);


--
-- Name: index_districts_on_state_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_districts_on_state_id ON public.districts USING btree (state_id);


--
-- Name: index_municipalities_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_municipalities_on_city_id ON public.municipalities USING btree (city_id);


--
-- Name: index_municipalities_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_municipalities_on_country_id ON public.municipalities USING btree (country_id);


--
-- Name: index_municipalities_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_municipalities_on_district_id ON public.municipalities USING btree (district_id);


--
-- Name: index_municipalities_on_state_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_municipalities_on_state_id ON public.municipalities USING btree (state_id);


--
-- Name: index_postal_codes_on_district_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_postal_codes_on_district_id ON public.postal_codes USING btree (district_id);


--
-- Name: index_postal_codes_on_municipality_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_postal_codes_on_municipality_id ON public.postal_codes USING btree (municipality_id);


--
-- Name: index_postal_codes_on_state_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_postal_codes_on_state_id ON public.postal_codes USING btree (state_id);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_states_on_country_id ON public.states USING btree (country_id);


--
-- Name: postal_codes__index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX postal_codes__index ON public.postal_codes USING btree (country_id);


--
-- Name: postal_codes fk_rails_019171d1de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postal_codes
    ADD CONSTRAINT fk_rails_019171d1de FOREIGN KEY (municipality_id) REFERENCES public.municipalities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: municipalities fk_rails_03f4031592; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.municipalities
    ADD CONSTRAINT fk_rails_03f4031592 FOREIGN KEY (district_id) REFERENCES public.districts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cities_postal_codes fk_rails_17d373ecbf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_postal_codes
    ADD CONSTRAINT fk_rails_17d373ecbf FOREIGN KEY (postal_code_id) REFERENCES public.postal_codes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postal_codes fk_rails_1e36f9a149; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postal_codes
    ADD CONSTRAINT fk_rails_1e36f9a149 FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cities fk_rails_25e397b588; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_rails_25e397b588 FOREIGN KEY (district_id) REFERENCES public.districts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: municipalities fk_rails_394ce8a471; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.municipalities
    ADD CONSTRAINT fk_rails_394ce8a471 FOREIGN KEY (city_id) REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: states fk_rails_40bd891262; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT fk_rails_40bd891262 FOREIGN KEY (country_id) REFERENCES public.country_data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: municipalities fk_rails_5f4e0cae68; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.municipalities
    ADD CONSTRAINT fk_rails_5f4e0cae68 FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: districts fk_rails_61da3337c8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT fk_rails_61da3337c8 FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: districts fk_rails_8245f4596b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.districts
    ADD CONSTRAINT fk_rails_8245f4596b FOREIGN KEY (country_id) REFERENCES public.country_data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cities_postal_codes fk_rails_8c929e0223; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_postal_codes
    ADD CONSTRAINT fk_rails_8c929e0223 FOREIGN KEY (city_id) REFERENCES public.cities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postal_codes fk_rails_96209ddbe1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postal_codes
    ADD CONSTRAINT fk_rails_96209ddbe1 FOREIGN KEY (country_id) REFERENCES public.country_data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cities fk_rails_996e05be41; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_rails_996e05be41 FOREIGN KEY (country_id) REFERENCES public.country_data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: municipalities fk_rails_b003c71db1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.municipalities
    ADD CONSTRAINT fk_rails_b003c71db1 FOREIGN KEY (country_id) REFERENCES public.country_data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: addresses fk_rails_d873e14e27; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_rails_d873e14e27 FOREIGN KEY (country_id) REFERENCES public.country_data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: postal_codes fk_rails_ec4db60877; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.postal_codes
    ADD CONSTRAINT fk_rails_ec4db60877 FOREIGN KEY (district_id) REFERENCES public.districts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;



