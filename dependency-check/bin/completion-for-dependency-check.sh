#/usr/bin/env bash

pattern="^.*completion-for-dependency-check.sh$";
if [[ "$0" =~ $pattern ]]; then 
    echo
    echo "To use completion for dependency-check you must run:"
    echo
    echo "         source completion-for-dependency-check.sh"
    echo
    exit
fi

_odc_completions()
{
    # Pointer to current completion word.
    local options="
            --advancedHelp
            --artifactoryApiToken
            --artifactoryBearerToken
            --artifactoryParallelAnalysis
            --artifactoryUseProxy
            --artifactoryUsername
            --bundleAudit
            --bundleAuditWorkingDirectory
        -c --connectiontimeout
            --connectionString
            --cveUrlBase
            --cveUrlModified
            --cveValidForHours
        -d --data
            --dbDriverName
            --dbDriverPath
            --dbPassword
            --dbUser
            --disableArchive
            --disableAssembly
            --disableAutoconf
            --disableBundleAudit
            --disableCentral
            --disableCentralCache
            --disableCmake
            --disableCocoapodsAnalyzer
            --disableComposer 
            --disableGolangDep
            --disableGolangMod
            --disableJar
            --disableMixAudit
            --disableNodeAudit
            --disableNodeAuditCache
            --disableNodeJS
            --disableNugetconf
            --disableNuspec
            --disableOpenSSL
            --disableOssIndex
            --disableOssIndexCache
            --disablePip
            --disablePipfile
            --disablePyDist
            --disablePyPkg
            --disableRetireJS
            --disableRubygems
            --disableSwiftPackageManagerAnalyzer
            --dotnet
            --enableArtifactory
            --enableExperimental
            --enableNexus
            --enableRetired
            --exclude <pattern> 
        -f --format <format> 
            --failOnCVSS <score>
            --go
        -h --help 
            --hints
            --junitFailOnCVSS <score> 
        -l --log
        -n --noupdate                 
            --nexus <url>        
            --nexusPass <password>   
            --nexusUser <username>
            --nexusUsesProxy
            --nodeAuditSkipDevDependencies  
            --nonProxyHosts <list>    
        -o --out
            --ossIndexPassword <password>   
            --ossIndexUsername <username> 
        -P --propertyfile
            --prettyPrint
            --project <name> 
            --proxypass <pass>
            --proxyport <port>
            --proxyserver <server>
            --proxyuser <user> 
            --purge
            --retirejsFilter <pattern>
            --retirejsFilterNonVulnerable
            --retireJsForceUpdate
            --retireJsUrl <url>
        -s --scan
            --suppression
            --symLink <depth>
            --updateonly
        -v --version
            --zipExtensions <extensions>      
    "


    # Array variable storing the possible completions.
    COMPREPLY=()
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev="${COMP_WORDS[COMP_CWORD-1]}"


    case "${prev}" in
        -s|--scan|-o|--out|-d|--data|--bundleAudit|--bundleAuditWorkingDirectory|--dbDriverPath|--dotnet|--go|-P|--propertyfile|--suppression|--hint|-l|--log)
            COMPREPLY=( $(compgen -f -o default -- ${cur}) )
            return 0
            ;;
        --artifactoryParallelAnalysis|--artifactoryUseProxy|--nexusUsesProxy)
            COMPREPLY=( $(compgen -W "true false" -- ${cur}) )
            return 0
            ;;
        -f|--format)
            COMPREPLY=( $(compgen -W "HTML XML CSV JSON JUNIT ALL" ${cur}) )
            return 0
            ;;
    esac
    if [[ "$cur" == -* ]] ; then
        COMPREPLY=( $(compgen -W "$options" -- "$cur") )
        return 0
    fi
  return 0
}

complete -F _odc_completions dependency-check.sh
