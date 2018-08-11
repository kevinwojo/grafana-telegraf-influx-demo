# Grafana + Influx + Telegraf

## Grafana
Granfana provides a graphical interface to datastores. The application itself is general in nature and can be used to display any information stored in a supported backend. 

In the context of System Administration, Grafana can allow operators an easy way to spot performance issues and quickly understand the scope of an issue at scale.

Application developers can provide insight into their applications by using an interface such as `statsd` to provide support teams metrics on application performance.

Combininig systems and application metrics can help support teams establish base line performance
and spot anomolies that may require action.

### Dashboards
Dashboards can provide a detailed view of a system or group of systems. 
Dashboards are defined in JSON and graphs can be constructed using a SQL-like language.
Alerts are defined by thresholds on graphs or the lack of data.

Many dashboards are available for download freely by the community.

#### Available Dashboards
 * https://grafana.com/dashboards/1375
 * https://grafana.com/dashboards?dataSource=influxdb&collector=Telegraf&page=2
 * https://grafana.com/dashboards/2690
 * https://grafana.com/dashboards/4164
 * https://grafana.com/dashboards/5063
 * https://grafana.com/dashboards/6908
 * https://grafana.com/dashboards/1486
 * https://grafana.com/dashboards/320
 * https://grafana.com/dashboards/1941
 * https://grafana.com/dashboards/3900
 * https://grafana.com/dashboards/4220

## InfluxDB
InfluxDB is a time-series data store. It has a SQL-esque interface that allows a familiar interaction. 

## Telegraf
Telegraf is a telemetry utility with a wide range of inputs, such as Linux Host, Networking, Apache, Nginx, InfluxDB, MySQL, MS-SQL, and a statsd endpoint for application metric collection.

Telegraf ships as a statically-linked binary which is very simple to configure. There are a growing number of plugins which extend the functionaltiy of the utility.

The configuration file is well-documented and allows for easy manipulate by
configuration management systems, such as Ansible.

# Demo Configuration
The `run-demo.sh` script utilizes Vagrant to spin up two hosts: a "monitoring" host which runs Grafana and InfluxDB and a "wildhost" that runs a sample application that generates work for the host and telegraf.

You can access the Grafana configuration via http://192.168.33.10:3000 with the credentials admin,admin. 

A pre-configured Grafana database is bootstrapped by the script. You may disable this before the first-run by commenting out the following line:

```
# line to comment out
```

## Running the Demo
Copy and paste the following into your Terminal.

You will need the following Prerequisites to run on your system:
 * VirtualBox
 * Vagrant
 * git
 * An ssh key at `~/.ssh/id_rsa`

```
git clone https://github.com/kevinwojo/grafana-demo
cd grafana-demo
./run-demo.sh
```

# Operational Considerations

## Backup Strategy
The most laborious configuration for Grafana is the Dashboard configuration. Luckily these dashboards can be exported into JSON. This allows for a relatively simple disaster recovery plan and version control of alerts and graphs.

The documentation for Grafana also recommends backing up the database:
 * grafana.ini
 * grafana.db

(This probably exists in /var/lib/grafana or /etc/grafana) - Need to confirm - kw

Make sure that the user and group own the _grafana.db_ file.
 `chown grafana:grafana grafana.db`

### Open Source CLI Utilities
 * https://github.com/ysde/grafana-backup-tool

