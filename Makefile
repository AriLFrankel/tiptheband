GSUTILPATH = "gs://www.tipthebandatx.live/tipthebandatx.html"
LOCALPATH = "./tipthebandatx.html"
GCLOUDNAME = "ari.l.frankel@gmail.com"

dev:
	python3 -m http.server & sleep 2; open http://localhost:8000/tipthebandatx.html

login:
	gcloud config list account --format "value(core.account)" | grep -q $(GCLOUDNAME) || gcloud auth login

push: login
	gcloud storage rm $(GSUTILPATH)
	gcloud storage cp $(LOCALPATH) $(GSUTILPATH)

logout:
	gcloud auth revoke $(GCLOUDNAME)

all: login push logout
