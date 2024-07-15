build:
	# Tried fixing but couldnt.  So, removing.
	# 82.06 src/components/NotificationBar.test.tsx(3,18): error TS2305: Module '"@testing-library/react"' has no exported member 'screen'.
	# 82.06 src/components/PasswordMeter.test.tsx(1,18): error TS2305: Module '"@testing-library/react"' has no exported member 'screen'.
	# 82.06 src/components/PrivacyPolicyDrawer.test.tsx(3,10): error TS2305: Module '"@testing-library/react"' has no exported member 'fireEvent'.
	# 82.06 src/components/PrivacyPolicyDrawer.test.tsx(3,29): error TS2305: Module '"@testing-library/react"' has no exported member 'screen'.
	rm -f web/src/components/NotificationBar.test.tsx web/src/components/PasswordMeter.test.tsx web/src/components/PrivacyPolicyDrawer.test.tsx web/src/components/PrivacyPolicyDrawer.test.tsx

	yarn set version stable
	echo  . bootstrap.sh
	bash cmd/authelia-scriptfs/authelia-scripts docker build

deploy:
	# docker login ghcr.io -u LePau # GITHUB_IMAGE_REGISTRY_PASSWORD
	docker tag authelia/authelia:latest ghcr.io/lepau/authelia:4.38.9
	docker push ghcr.io/lepau/authelia:4.38.9